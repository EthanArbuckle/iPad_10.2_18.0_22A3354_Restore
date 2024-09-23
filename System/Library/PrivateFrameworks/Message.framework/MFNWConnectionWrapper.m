@implementation MFNWConnectionWrapper

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__MFNWConnectionWrapper_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_23 != -1)
    dispatch_once(&log_onceToken_23, block);
  return (id)log_log_23;
}

void __28__MFNWConnectionWrapper_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_23;
  log_log_23 = (uint64_t)v1;

}

- (MFNWConnectionWrapper)init
{
  MFNWConnectionWrapper *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  NSConditionLock *readBufferLock;
  dispatch_group_t v8;
  OS_dispatch_group *writeGroup;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MFNWConnectionWrapper;
  v2 = -[MFNWConnectionWrapper init](&v11, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.mail.connection", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3538]), "initWithCondition:", 0);
    readBufferLock = v2->_readBufferLock;
    v2->_readBufferLock = (NSConditionLock *)v6;

    v8 = dispatch_group_create();
    writeGroup = v2->_writeGroup;
    v2->_writeGroup = (OS_dispatch_group *)v8;

    v2->_lock._os_unfair_lock_opaque = 0;
    v2->_timeout = 60;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[MFNWConnectionWrapper close](self, "close");
  v3.receiver = self;
  v3.super_class = (Class)MFNWConnectionWrapper;
  -[MFNWConnectionWrapper dealloc](&v3, sel_dealloc);
}

- (void)cancel
{
  NSObject *v3;
  void *v4;
  int v5;
  MFNWConnectionWrapper *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  +[MFNWConnectionWrapper log](MFNWConnectionWrapper, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = self;
    _os_log_impl(&dword_1A4F90000, v3, OS_LOG_TYPE_DEFAULT, "Connection cancelled: %@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "ef_cancelledError");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFNWConnectionWrapper _closeWithError:](self, "_closeWithError:", v4);

}

- (BOOL)connectToHost:(id)a3 withPort:(unsigned int)a4 service:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  id v10;
  const char *v11;
  id v12;
  nw_endpoint_t host;
  BOOL v14;
  uint64_t v15;
  NSObject *v16;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = a5;
  v10 = objc_retainAutorelease(v8);
  v11 = (const char *)objc_msgSend(v10, "UTF8String");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u"), v6);
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  host = nw_endpoint_create_host(v11, (const char *)objc_msgSend(v12, "UTF8String"));

  if (host)
  {
    v14 = -[MFNWConnectionWrapper _connectToEndpoint:service:](self, "_connectToEndpoint:service:", host, v9);
  }
  else
  {
    v15 = *__error();
    +[MFNWConnectionWrapper log](MFNWConnectionWrapper, "log");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[MFNWConnectionWrapper connectToHost:withPort:service:].cold.1();

    -[MFNWConnectionWrapper _closeWithErrorDomain:code:](self, "_closeWithErrorDomain:code:", *MEMORY[0x1E0CB2FE0], v15);
    v14 = 0;
  }

  return v14;
}

- (BOOL)_connectToEndpoint:(id)a3 service:(id)a4
{
  NSObject *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  OS_nw_connection *connection;
  NSObject *v11;
  OS_dispatch_semaphore *v12;
  OS_dispatch_semaphore *eventSemaphore;
  double Current;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  dispatch_time_t v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  CFAbsoluteTime v25;
  NSObject *v26;
  void *v27;
  BOOL v28;
  _QWORD v30[20];
  _QWORD v31[5];
  int v32;
  uint8_t buf[4];
  MFNWConnectionWrapper *v34;
  __int16 v35;
  CFAbsoluteTime v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v32 = 0;
  -[MFNWConnectionWrapper _createConnectionWithEndpoint:error:](self, "_createConnectionWithEndpoint:error:", v6, &v32);
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    +[MFNWConnectionWrapper log](MFNWConnectionWrapper, "log");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", nw_endpoint_get_hostname(v6));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFNWConnectionWrapper _connectToEndpoint:service:].cold.1(v22, &v32, (uint64_t)buf, v21);
    }

    -[MFNWConnectionWrapper _closeWithErrorDomain:code:](self, "_closeWithErrorDomain:code:", *MEMORY[0x1E0CB2FE0], v32);
    goto LABEL_27;
  }
  objc_storeStrong((id *)&self->_service, a4);
  objc_storeStrong((id *)&self->_connection, v8);
  nw_connection_set_queue(v8, (dispatch_queue_t)self->_queue);
  objc_msgSend(MEMORY[0x1E0D1E788], "attachCurrentActivityToConnection:", v8);
  v9 = MEMORY[0x1E0C809B0];
  connection = self->_connection;
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __52__MFNWConnectionWrapper__connectToEndpoint_service___block_invoke;
  v31[3] = &unk_1E4E8E488;
  v31[4] = self;
  MEMORY[0x1A85B0CC8](connection, v31);
  v30[15] = v9;
  v30[16] = 3221225472;
  v30[17] = __52__MFNWConnectionWrapper__connectToEndpoint_service___block_invoke_11;
  v30[18] = &unk_1E4E88DC8;
  v30[19] = self;
  nw_connection_set_cancel_handler();
  v30[10] = v9;
  v30[11] = 3221225472;
  v30[12] = __52__MFNWConnectionWrapper__connectToEndpoint_service___block_invoke_12;
  v30[13] = &unk_1E4E88DC8;
  v30[14] = self;
  nw_connection_set_read_close_handler();
  v30[5] = v9;
  v30[6] = 3221225472;
  v30[7] = __52__MFNWConnectionWrapper__connectToEndpoint_service___block_invoke_13;
  v30[8] = &unk_1E4E88DC8;
  v30[9] = self;
  nw_connection_set_write_close_handler();
  v11 = self->_connection;
  v30[0] = v9;
  v30[1] = 3221225472;
  v30[2] = __52__MFNWConnectionWrapper__connectToEndpoint_service___block_invoke_14;
  v30[3] = &unk_1E4E8E4B0;
  v30[4] = self;
  nw_connection_set_viability_changed_handler(v11, v30);
  v12 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
  eventSemaphore = self->_eventSemaphore;
  self->_eventSemaphore = v12;

  if (!self->_eventSemaphore)
  {
    +[MFNWConnectionWrapper log](MFNWConnectionWrapper, "log");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4F90000, v23, OS_LOG_TYPE_INFO, "could not create event semaphore", buf, 2u);
    }

    -[MFNWConnectionWrapper _closeWithErrorDomain:code:](self, "_closeWithErrorDomain:code:", *MEMORY[0x1E0CB2FE0], 12);
    goto LABEL_27;
  }
  -[MFNWConnectionWrapper _networkActivityStarted](self, "_networkActivityStarted");
  Current = CFAbsoluteTimeGetCurrent();
  +[MFNWConnectionWrapper log](MFNWConnectionWrapper, "log");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    -[MFNWConnectionWrapper securityProtocol](self, "securityProtocol");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v34 = self;
    v35 = 2112;
    v36 = *(double *)&v6;
    v37 = 2112;
    v38 = v16;
    _os_log_impl(&dword_1A4F90000, v15, OS_LOG_TYPE_DEFAULT, "opening connection %p to %@ (%@)", buf, 0x20u);

  }
  nw_connection_start(v8);
  v17 = self->_eventSemaphore;
  v18 = dispatch_time(0, 30000000000);
  if (dispatch_semaphore_wait(v17, v18))
  {
    -[MFNWConnectionWrapper _networkActivityEnded](self, "_networkActivityEnded");
    +[MFNWConnectionWrapper log](MFNWConnectionWrapper, "log");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v34 = self;
      _os_log_impl(&dword_1A4F90000, v19, OS_LOG_TYPE_DEFAULT, "opening connection %p timed out", buf, 0xCu);
    }
    v20 = 60;
  }
  else
  {
    self->_connectTime = CFAbsoluteTimeGetCurrent();
    if (self->_connectionState == 3)
    {
      +[MFNWConnectionWrapper log](MFNWConnectionWrapper, "log");
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v25 = CFAbsoluteTimeGetCurrent();
        *(_DWORD *)buf = 134218240;
        v34 = self;
        v35 = 2048;
        v36 = v25 - Current;
        _os_log_impl(&dword_1A4F90000, v24, OS_LOG_TYPE_DEFAULT, "opening connection %p took %f seconds", buf, 0x16u);
      }

      +[MFNWConnectionWrapper log](MFNWConnectionWrapper, "log");
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        -[MFNWConnectionWrapper _negotiatedSecurityProtocol](self, "_negotiatedSecurityProtocol");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v34 = self;
        v35 = 2114;
        v36 = *(double *)&v27;
        _os_log_impl(&dword_1A4F90000, v26, OS_LOG_TYPE_INFO, "negotiated SSL version for connection %p is %{public}@", buf, 0x16u);

      }
      -[MFNWConnectionWrapper _networkActivityEnded](self, "_networkActivityEnded");
      -[MFNWConnectionWrapper _scheduleNextRead](self, "_scheduleNextRead");
      if (!v32)
      {
        v28 = 1;
        goto LABEL_28;
      }
      v20 = 57;
      goto LABEL_26;
    }
    -[MFNWConnectionWrapper _networkActivityEnded](self, "_networkActivityEnded");
    +[MFNWConnectionWrapper log](MFNWConnectionWrapper, "log");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v34 = self;
      _os_log_impl(&dword_1A4F90000, v19, OS_LOG_TYPE_DEFAULT, "connection %p failed to connect", buf, 0xCu);
    }
    v20 = 57;
  }

LABEL_26:
  -[MFNWConnectionWrapper _closeWithErrorDomain:code:](self, "_closeWithErrorDomain:code:", *MEMORY[0x1E0CB2FE0], v20);
LABEL_27:
  v28 = 0;
LABEL_28:

  return v28;
}

void __52__MFNWConnectionWrapper__connectToEndpoint_service___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  nw_endpoint_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    +[MFNWConnectionWrapper log](MFNWConnectionWrapper, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v15 = 134218498;
      v16 = v7;
      v17 = 2080;
      v18 = nw_connection_state_to_string();
      v19 = 2112;
      v20 = v5;
      _os_log_error_impl(&dword_1A4F90000, v6, OS_LOG_TYPE_ERROR, "state for connection %p: %s (error: %@)", (uint8_t *)&v15, 0x20u);
    }
  }
  else
  {
    +[MFNWConnectionWrapper log](MFNWConnectionWrapper, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = nw_connection_state_to_string();
      __52__MFNWConnectionWrapper__connectToEndpoint_service___block_invoke_cold_2(v8, v9, (uint64_t)&v15, v6);
    }
  }

  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 24) = a2;
  v10 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v10 + 48))
  {
    v11 = nw_connection_copy_endpoint(*(nw_connection_t *)(v10 + 16));
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v12 + 48);
    *(_QWORD *)(v12 + 48) = v11;

    v10 = *(_QWORD *)(a1 + 32);
  }
  if (*(_QWORD *)(v10 + 32))
  {
    if ((_DWORD)a2 == 3)
    {
      objc_msgSend((id)v10, "_handleConnectionReady");
    }
    else if ((a2 & 0xFFFFFFFE) == 4)
    {
      objc_msgSend((id)v10, "_handleConnectionFailure:", a2);
    }
  }
  else
  {
    +[MFNWConnectionWrapper log](MFNWConnectionWrapper, "log");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __52__MFNWConnectionWrapper__connectToEndpoint_service___block_invoke_cold_1();

  }
}

void __52__MFNWConnectionWrapper__connectToEndpoint_service___block_invoke_11(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;

  v1 = a1 + 32;
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
  +[MFNWConnectionWrapper log](MFNWConnectionWrapper, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __52__MFNWConnectionWrapper__connectToEndpoint_service___block_invoke_11_cold_2();

    *(_DWORD *)(*(_QWORD *)v1 + 24) = 5;
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)v1 + 32));
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __52__MFNWConnectionWrapper__connectToEndpoint_service___block_invoke_cold_1();

  }
}

void __52__MFNWConnectionWrapper__connectToEndpoint_service___block_invoke_12(uint64_t a1)
{
  NSObject *v2;

  +[MFNWConnectionWrapper log](MFNWConnectionWrapper, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __52__MFNWConnectionWrapper__connectToEndpoint_service___block_invoke_12_cold_1();

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 120) = 0;
  nw_connection_cancel(*(nw_connection_t *)(*(_QWORD *)(a1 + 32) + 16));
}

void __52__MFNWConnectionWrapper__connectToEndpoint_service___block_invoke_13(uint64_t a1)
{
  NSObject *v2;

  +[MFNWConnectionWrapper log](MFNWConnectionWrapper, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __52__MFNWConnectionWrapper__connectToEndpoint_service___block_invoke_13_cold_1();

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 121) = 0;
}

void __52__MFNWConnectionWrapper__connectToEndpoint_service___block_invoke_14(uint64_t a1, char a2)
{
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if ((a2 & 1) == 0)
  {
    +[MFNWConnectionWrapper log](MFNWConnectionWrapper, "log");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = 134217984;
      v6 = v4;
      _os_log_impl(&dword_1A4F90000, v3, OS_LOG_TYPE_INFO, "connection %p no longer viable", (uint8_t *)&v5, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 120) = 0;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 121) = 0;
    nw_connection_cancel(*(nw_connection_t *)(*(_QWORD *)(a1 + 32) + 16));
  }
}

- (id)_createConnectionWithEndpoint:(id)a3 error:(int *)a4
{
  NSObject *v7;
  void *v8;
  NSString *securityProtocol;
  void *v10;
  NSObject *secure_tcp;
  void *v12;
  id v13;
  void *v14;
  id v15;
  nw_parameters_attribution_t v16;
  void *v17;
  id v18;
  const char *v19;
  NSObject *v20;
  NSObject *v21;
  int *v22;
  nw_connection_t v23;
  xpc_object_t v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  void *v29;
  _QWORD aBlock[5];

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFNWConnectionWrapper.m"), 241, CFSTR("endpoint is NULL!"));

  }
  v8 = _Block_copy((const void *)*MEMORY[0x1E0CCED20]);
  securityProtocol = self->_securityProtocol;
  if (securityProtocol && !-[NSString isEqualToString:](securityProtocol, "isEqualToString:", *MEMORY[0x1E0C9B328]))
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __61__MFNWConnectionWrapper__createConnectionWithEndpoint_error___block_invoke;
    aBlock[3] = &unk_1E4E8E4D8;
    aBlock[4] = self;
    v10 = _Block_copy(aBlock);

    v8 = v10;
  }
  secure_tcp = nw_parameters_create_secure_tcp(v8, &__block_literal_global_53);
  if (secure_tcp)
  {
    -[MFNWConnectionWrapper networkAccountIdentifier](self, "networkAccountIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[MFNWConnectionWrapper networkAccountIdentifier](self, "networkAccountIdentifier");
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v13, "UTF8String");
      nw_parameters_set_account_id();

    }
    -[MFNWConnectionWrapper sourceApplicationBundleIdentifier](self, "sourceApplicationBundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[MFNWConnectionWrapper sourceApplicationBundleIdentifier](self, "sourceApplicationBundleIdentifier");
      v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v15, "UTF8String");
      nw_parameters_set_source_application_by_bundle_id();

    }
    if (-[MFNWConnectionWrapper isNonAppInitiated](self, "isNonAppInitiated"))
      v16 = nw_parameters_attribution_user;
    else
      v16 = nw_parameters_attribution_developer;
    nw_parameters_set_attribution(secure_tcp, v16);
    -[MFNWConnectionWrapper connectionServiceType](self, "connectionServiceType");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[MFNWConnectionWrapper connectionServiceType](self, "connectionServiceType");
      v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v19 = (const char *)objc_msgSend(v18, "UTF8String");

      if (!strncmp(v19, "kCTDataConnectionServiceType", 0x1CuLL))
      {
        v20 = xpc_array_create(0, 0);
        v24 = xpc_array_create(0, 0);
        v25 = v24;
        if (v20 && v24)
        {
          xpc_array_set_string(v20, 0xFFFFFFFFFFFFFFFFLL, "Cellular");
          xpc_array_set_string(v25, 0xFFFFFFFFFFFFFFFFLL, v19 + 28);
          nw_parameters_set_required_netagent_classes();
        }
        else
        {
          +[MFNWConnectionWrapper log](MFNWConnectionWrapper, "log");
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            -[MFNWConnectionWrapper _createConnectionWithEndpoint:error:].cold.3();

        }
      }
      else
      {
        +[MFNWConnectionWrapper log](MFNWConnectionWrapper, "log");
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          -[MFNWConnectionWrapper _createConnectionWithEndpoint:error:].cold.4();
      }

    }
    v23 = nw_connection_create(v7, secure_tcp);
    if (!v23)
    {
      +[MFNWConnectionWrapper log](MFNWConnectionWrapper, "log");
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        -[MFNWConnectionWrapper _createConnectionWithEndpoint:error:].cold.2();

      if (a4)
      {
        v22 = __error();
        goto LABEL_36;
      }
    }
  }
  else
  {
    +[MFNWConnectionWrapper log](MFNWConnectionWrapper, "log");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[MFNWConnectionWrapper _createConnectionWithEndpoint:error:].cold.1();

    if (a4)
    {
      v22 = __error();
      v23 = 0;
LABEL_36:
      *a4 = *v22;
      goto LABEL_37;
    }
    v23 = 0;
  }
LABEL_37:

  return v23;
}

uint64_t __61__MFNWConnectionWrapper__createConnectionWithEndpoint_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_configureTLS:", a2);
}

void __61__MFNWConnectionWrapper__createConnectionWithEndpoint_error___block_invoke_2(int a1, nw_protocol_options_t options)
{
  nw_tcp_options_set_connection_timeout(options, 0x1Eu);
}

- (void)_handleConnectionReady
{
  *(_WORD *)&self->_readable = 257;
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_eventSemaphore);
}

- (void)_handleConnectionFailure:(int)a3
{
  if (a3 == 5)
  {
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_eventSemaphore);
  }
  else if (a3 == 4)
  {
    nw_connection_cancel((nw_connection_t)self->_connection);
  }
}

- (void)_configureTLS:(id)a3
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id location;

  v4 = a3;
  -[MFNWConnectionWrapper clientCertificates](self, "clientCertificates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    -[MFNWConnectionWrapper clientCertificates](self, "clientCertificates");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v8 = objc_claimAutoreleasedReturnValue();
    sec_protocol_options_set_local_identity(v4, v8);

  }
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __39__MFNWConnectionWrapper__configureTLS___block_invoke;
  v9[3] = &unk_1E4E8E520;
  objc_copyWeak(&v10, &location);
  sec_protocol_options_set_verify_block(v4, v9, (dispatch_queue_t)self->_queue);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __39__MFNWConnectionWrapper__configureTLS___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  NSObject *v6;
  void (**v7)(id, uint64_t);
  _QWORD *WeakRetained;
  SecTrustRef v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint8_t buf[24];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained[25])
  {
    v9 = sec_trust_copy_ref(v6);
    v10 = (*(uint64_t (**)(void))(WeakRetained[25] + 16))();
    v11 = 0;
    if (v11)
      objc_msgSend(WeakRetained, "setError:", v11);
    +[MFNWConnectionWrapper log](MFNWConnectionWrapper, "log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromBOOL();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      __39__MFNWConnectionWrapper__configureTLS___block_invoke_cold_1(v13, buf, v12);
    }

    CFRelease(v9);
  }
  else
  {
    v10 = 1;
  }
  v7[2](v7, v10);

}

- (id)_negotiatedSecurityProtocol
{
  NSObject *connection;
  NSObject *v3;
  NSObject *v4;
  uint64_t negotiated_protocol_version;
  __CFString *v6;

  connection = self->_connection;
  if (connection)
  {
    v3 = MEMORY[0x1A85B0DB8]();
    v4 = nw_connection_copy_protocol_metadata(connection, v3);

    negotiated_protocol_version = sec_protocol_metadata_get_negotiated_protocol_version(v4);
    if (negotiated_protocol_version < 0xB && ((0x595u >> negotiated_protocol_version) & 1) != 0)
    {
      v6 = off_1E4E8E640[(int)negotiated_protocol_version];
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unknown-protocol-version(%d)"), negotiated_protocol_version);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)_networkActivityStarted
{
  void *v3;
  void (**v4)(id, uint64_t);

  ECAssertNetworkActivityAllowed();
  -[MFNWConnectionWrapper networkActivityChangeBlock](self, "networkActivityChangeBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MFNWConnectionWrapper networkActivityChangeBlock](self, "networkActivityChangeBlock");
    v4 = (void (**)(id, uint64_t))objc_claimAutoreleasedReturnValue();
    v4[2](v4, 1);

  }
}

- (void)_networkActivityEnded
{
  void *v3;
  void (**v4)(id, _QWORD);

  -[MFNWConnectionWrapper networkActivityChangeBlock](self, "networkActivityChangeBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MFNWConnectionWrapper networkActivityChangeBlock](self, "networkActivityChangeBlock");
    v4 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0);

  }
}

- (int64_t)writeBytes:(const char *)a3 length:(unint64_t)a4
{
  NSObject *v7;
  NSObject *v8;
  NSObject *connection;
  NSObject *v10;
  NSObject *writeGroup;
  dispatch_time_t v12;
  NSObject *v13;
  void *v14;
  int64_t v15;
  CFAbsoluteTime Current;
  double connectTime;
  CFAbsoluteTime v19;
  _QWORD completion[7];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t buf[4];
  MFNWConnectionWrapper *v26;
  __int16 v27;
  double v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = -1;
  +[MFNWConnectionWrapper log](MFNWConnectionWrapper, "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    v26 = self;
    v27 = 2048;
    v28 = *(double *)&a4;
    _os_log_impl(&dword_1A4F90000, v7, OS_LOG_TYPE_INFO, "writeBytes on connection %p for %zu bytes", buf, 0x16u);
  }

  if (self->_connection && self->_writable)
  {
    -[MFNWConnectionWrapper _networkActivityStarted](self, "_networkActivityStarted");
    v8 = dispatch_data_create(a3, a4, 0, 0);
    dispatch_group_enter((dispatch_group_t)self->_writeGroup);
    connection = self->_connection;
    v10 = *MEMORY[0x1E0CCECF0];
    completion[0] = MEMORY[0x1E0C809B0];
    completion[1] = 3221225472;
    completion[2] = __43__MFNWConnectionWrapper_writeBytes_length___block_invoke;
    completion[3] = &unk_1E4E8E548;
    completion[4] = self;
    completion[5] = &v21;
    completion[6] = a4;
    nw_connection_send(connection, v8, v10, 0, completion);
    writeGroup = self->_writeGroup;
    v12 = dispatch_time(0, 1000000000 * self->_timeout);
    if (dispatch_group_wait(writeGroup, v12))
    {
      +[MFNWConnectionWrapper log](MFNWConnectionWrapper, "log");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        Current = CFAbsoluteTimeGetCurrent();
        connectTime = self->_connectTime;
        v19 = Current - connectTime;
        LODWORD(connectTime) = self->_timeout;
        *(_DWORD *)buf = 134218240;
        v26 = self;
        v27 = 2048;
        v28 = v19 - (double)*(unint64_t *)&connectTime;
        _os_log_error_impl(&dword_1A4F90000, v13, OS_LOG_TYPE_ERROR, "writeBytes: connection %p timed out (lifetime: %f seconds)", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 60, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFNWConnectionWrapper setError:](self, "setError:", v14);

    }
    -[MFNWConnectionWrapper _networkActivityEnded](self, "_networkActivityEnded");

  }
  v15 = v22[3];
  _Block_object_dispose(&v21, 8);
  return v15;
}

void __43__MFNWConnectionWrapper_writeBytes_length___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    +[MFNWConnectionWrapper log](MFNWConnectionWrapper, "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __43__MFNWConnectionWrapper_writeBytes_length___block_invoke_cold_1();

  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = a1[6];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1[4] + 64));

}

- (int64_t)readBytesIntoBuffer:(char *)a3 maxLength:(unint64_t)a4
{
  NSObject *v7;
  uint64_t (**v8)(void *, const __CFString *, id *, double);
  int64_t v9;
  id v10;
  unint64_t v11;
  id v12;
  id v14;
  id v15;
  _QWORD aBlock[7];

  +[MFNWConnectionWrapper log](MFNWConnectionWrapper, "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[MFNWConnectionWrapper readBytesIntoBuffer:maxLength:].cold.1();

  if (!self->_connection || !self->_readable)
    return -1;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__MFNWConnectionWrapper_readBytesIntoBuffer_maxLength___block_invoke;
  aBlock[3] = &unk_1E4E8E570;
  aBlock[4] = self;
  aBlock[5] = a4;
  aBlock[6] = a3;
  v8 = (uint64_t (**)(void *, const __CFString *, id *, double))_Block_copy(aBlock);
  -[MFNWConnectionWrapper _networkActivityStarted](self, "_networkActivityStarted");
  v15 = 0;
  v9 = v8[2](v8, CFSTR("buffered"), &v15, 0.0);
  v10 = v15;
  if (v9 < 0)
  {
    -[MFNWConnectionWrapper _scheduleNextRead](self, "_scheduleNextRead");
    LODWORD(v11) = self->_timeout;
    v14 = v10;
    v9 = v8[2](v8, CFSTR("scheduled read"), &v14, (double)v11);
    v12 = v14;

    v10 = v12;
  }
  -[MFNWConnectionWrapper _networkActivityEnded](self, "_networkActivityEnded");
  if (v10)
    -[MFNWConnectionWrapper setError:](self, "setError:", v10);

  return v9;
}

int64_t __55__MFNWConnectionWrapper_readBytesIntoBuffer_maxLength___block_invoke(uint64_t a1, void *a2, __CFError **a3, double a4)
{
  double *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  double *v23;
  CFAbsoluteTime v24;
  NSObject *v25;
  double v26;
  NSObject *v27;
  double *v28;
  CFAbsoluteTime v29;
  NSObject *v30;
  CFErrorRef v31;
  NSObject *v32;
  double *v33;
  double Current;
  double v35;
  void *v36;
  __CFError *v37;
  int v39;
  double *v40;
  __int16 v41;
  double v42;
  __int16 v43;
  int64_t v44;
  __int16 v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v8, "lockWhenCondition:beforeDate:", 2, v9);

  if ((_DWORD)v8)
  {
    v10 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
    if (v10)
    {
      v11 = objc_msgSend(v10, "length");
      v12 = v11;
      v13 = *(_QWORD *)(a1 + 32);
      if (*(_QWORD *)(a1 + 40) >= v11 - *(_QWORD *)(v13 + 96))
        v14 = v11 - *(_QWORD *)(v13 + 96);
      else
        v14 = *(_QWORD *)(a1 + 40);
      if (v14 >= 1)
      {
        memcpy(*(void **)(a1 + 48), (const void *)(objc_msgSend(*(id *)(v13 + 88), "bytes") + *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96)), v14);
        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) += v14;
        v15 = *(_QWORD *)(a1 + 32);
        if (*(_QWORD *)(v15 + 96) == v12)
        {
          *(_QWORD *)(v15 + 96) = 0;
          v16 = *(_QWORD *)(a1 + 32);
          v17 = *(void **)(v16 + 88);
          *(_QWORD *)(v16 + 88) = 0;

        }
      }
      +[MFNWConnectionWrapper log](MFNWConnectionWrapper, "log");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v19 = *(double *)(a1 + 32);
        v20 = *(_QWORD *)(*(_QWORD *)&v19 + 96);
        v39 = 138544130;
        v40 = v7;
        v41 = 2048;
        v42 = v19;
        v43 = 2048;
        v44 = v14;
        v45 = 2048;
        v46 = v20;
        _os_log_impl(&dword_1A4F90000, v18, OS_LOG_TYPE_INFO, "readBytes: returning %{public}@ data for connection %p (%lu bytes, new offset %lu)", (uint8_t *)&v39, 0x2Au);
      }

      v21 = *(_QWORD *)(a1 + 32);
      if (!*(_BYTE *)(v21 + 72))
      {
        if ((v14 & 0x8000000000000000) == 0)
        {
          objc_msgSend(*(id *)(v21 + 56), "unlockWithCondition:", 2 * (*(_QWORD *)(v21 + 88) != 0));
          *a3 = 0;
          goto LABEL_32;
        }
        goto LABEL_26;
      }
    }
    else
    {
      +[MFNWConnectionWrapper log](MFNWConnectionWrapper, "log");
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        v26 = *(double *)(a1 + 32);
        v39 = 138543618;
        v40 = v7;
        v41 = 2048;
        v42 = v26;
        _os_log_impl(&dword_1A4F90000, v25, OS_LOG_TYPE_INFO, "readBytes: no %{public}@ data to return for connection %p", (uint8_t *)&v39, 0x16u);
      }

      v21 = *(_QWORD *)(a1 + 32);
      v14 = -1;
      if (!*(_BYTE *)(v21 + 72))
      {
LABEL_26:
        v30 = *(NSObject **)(v21 + 80);
        if (v30)
          v31 = nw_error_copy_cf_error(v30);
        else
          v31 = 0;
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "unlockWithCondition:", 0);
        +[MFNWConnectionWrapper log](MFNWConnectionWrapper, "log");
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          v33 = *(double **)(a1 + 32);
          Current = CFAbsoluteTimeGetCurrent();
          v35 = *(double *)(*(_QWORD *)(a1 + 32) + 128);
          -[__CFError ef_publicDescription](v31, "ef_publicDescription");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = 134218498;
          v40 = v33;
          v41 = 2048;
          v42 = Current - v35 - a4;
          v43 = 2114;
          v44 = (int64_t)v36;
          _os_log_impl(&dword_1A4F90000, v32, OS_LOG_TYPE_DEFAULT, "readBytes: connection %p signaled with no buffered data (lifetime: %f seconds): %{public}@", (uint8_t *)&v39, 0x20u);

        }
        v37 = objc_retainAutorelease(v31);
        *a3 = v37;

        goto LABEL_32;
      }
    }
    objc_msgSend(*(id *)(v21 + 56), "unlockWithCondition:", 1);
    +[MFNWConnectionWrapper log](MFNWConnectionWrapper, "log");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = *(double **)(a1 + 32);
      v29 = CFAbsoluteTimeGetCurrent() - v28[16];
      v39 = 134218240;
      v40 = v28;
      v41 = 2048;
      v42 = v29;
      _os_log_impl(&dword_1A4F90000, v27, OS_LOG_TYPE_DEFAULT, "readBytes: connection %p canceled with a still scheduled read (lifetime: ~%f seconds)", (uint8_t *)&v39, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "ef_cancelledError");
    *a3 = (__CFError *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a4 <= 0.0)
    {
      *a3 = 0;
    }
    else
    {
      +[MFNWConnectionWrapper log](MFNWConnectionWrapper, "log");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = *(double **)(a1 + 32);
        v24 = CFAbsoluteTimeGetCurrent() - v23[16] - a4;
        v39 = 134218240;
        v40 = v23;
        v41 = 2048;
        v42 = v24;
        _os_log_impl(&dword_1A4F90000, v22, OS_LOG_TYPE_DEFAULT, "readBytes: connection %p timed out (lifetime: %f seconds)", (uint8_t *)&v39, 0x16u);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 60, 0);
      *a3 = (__CFError *)(id)objc_claimAutoreleasedReturnValue();
    }
    v14 = -1;
  }
LABEL_32:

  return v14;
}

- (void)_scheduleNextRead
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_5(&dword_1A4F90000, v0, v1, "connection %p NOT calling nw_connection_receive", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __42__MFNWConnectionWrapper__scheduleNextRead__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  NSObject *v8;
  id v9;
  id *v10;
  _QWORD *v11;
  size_t size;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  id v16;
  _QWORD *v17;
  id v18;
  void *v19;
  BOOL v20;
  NSObject *v21;
  void (**v22)(void);
  id v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  id v28;
  __int16 v29;
  size_t v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a5;
  v10 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "lock");
  v11 = *(_QWORD **)(a1 + 32);
  if (v11[11])
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("MFNWConnectionWrapper.m"), 503, CFSTR("nw_connection_receive: _buffer must be NULL"));

    v11 = *v10;
  }
  if (v11[12])
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("MFNWConnectionWrapper.m"), 504, CFSTR("nw_connection_receive: _bufferOffset must be 0"));

  }
  if (v8)
  {
    size = dispatch_data_get_size(v8);
    +[MFNWConnectionWrapper log](MFNWConnectionWrapper, "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v23 = *v10;
      NSStringFromBOOL();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 134218754;
      v28 = v23;
      v29 = 2048;
      v30 = size;
      v31 = 2112;
      v32 = v24;
      v33 = 2112;
      v34 = v9;
      _os_log_debug_impl(&dword_1A4F90000, v13, OS_LOG_TYPE_DEBUG, "nw_connection_receive (%p): length=%lu isComplete=%@ error=%@", (uint8_t *)&v27, 0x2Au);

    }
    objc_storeStrong((id *)*v10 + 11, a2);
    v14 = (void *)*((_QWORD *)*v10 + 10);
    *((_QWORD *)*v10 + 10) = 0;
  }
  else
  {
    +[MFNWConnectionWrapper log](MFNWConnectionWrapper, "log");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = *v10;
      v27 = 134218242;
      v28 = v16;
      v29 = 2112;
      v30 = (size_t)v9;
      _os_log_impl(&dword_1A4F90000, v15, OS_LOG_TYPE_DEFAULT, "nw_connection_receive (%p): no content error=%@", (uint8_t *)&v27, 0x16u);
    }

    v17 = *v10;
    v18 = v9;
    v14 = (void *)v17[10];
    v17[10] = v18;
  }

  *((_BYTE *)*v10 + 72) = 0;
  objc_msgSend(*((id *)*v10 + 7), "unlockWithCondition:", 2);
  if (v8)
  {
    objc_msgSend(*v10, "bytesAvailableHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19 == 0;

    if (!v20)
    {
      +[MFNWConnectionWrapper log](MFNWConnectionWrapper, "log");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        __42__MFNWConnectionWrapper__scheduleNextRead__block_invoke_cold_1();

      objc_msgSend(*v10, "bytesAvailableHandler");
      v22 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v22[2]();

    }
  }

}

- (void)_closeWithError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  OS_nw_connection *connection;
  NSObject *v8;
  NSObject *eventSemaphore;
  dispatch_time_t v10;
  intptr_t v11;
  int connectionState;
  NSObject *v13;
  NSObject *v14;
  int v15;
  MFNWConnectionWrapper *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[MFNWConnectionWrapper setError:](self, "setError:", v4);
    +[MFNWConnectionWrapper log](MFNWConnectionWrapper, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "ef_publicDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 134218242;
      v16 = self;
      v17 = 2114;
      v18 = v6;
      _os_log_impl(&dword_1A4F90000, v5, OS_LOG_TYPE_DEFAULT, "closing connection %p with error: %{public}@", (uint8_t *)&v15, 0x16u);

    }
  }
  else
  {
    +[MFNWConnectionWrapper log](MFNWConnectionWrapper, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 134217984;
      v16 = self;
      _os_log_impl(&dword_1A4F90000, v5, OS_LOG_TYPE_DEFAULT, "closing connection %p", (uint8_t *)&v15, 0xCu);
    }
  }

  os_unfair_lock_lock(&self->_lock);
  connection = self->_connection;
  if (connection)
    MEMORY[0x1A85B0CC8](connection, &__block_literal_global_51_0);
  if (self->_connectionState != 5)
  {
    v8 = self->_connection;
    if (v8)
      nw_connection_cancel(v8);
    eventSemaphore = self->_eventSemaphore;
    if (eventSemaphore)
    {
      v10 = dispatch_time(0, 5000000000);
      v11 = dispatch_semaphore_wait(eventSemaphore, v10);
      connectionState = self->_connectionState;
      if (v11)
      {
        if (connectionState == 5)
        {
          +[MFNWConnectionWrapper log](MFNWConnectionWrapper, "log");
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            -[MFNWConnectionWrapper _closeWithError:].cold.2();
LABEL_19:

          v14 = self->_connection;
          if (v14)
            nw_connection_force_cancel(v14);
          goto LABEL_21;
        }
      }
      else if (connectionState == 5)
      {
        goto LABEL_21;
      }
      +[MFNWConnectionWrapper log](MFNWConnectionWrapper, "log");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[MFNWConnectionWrapper _closeWithError:].cold.1();
      goto LABEL_19;
    }
  }
LABEL_21:
  os_unfair_lock_unlock(&self->_lock);

}

- (void)_closeWithErrorDomain:(id)a3 code:(int64_t)a4
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", a3, a4, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MFNWConnectionWrapper _closeWithError:](self, "_closeWithError:");

}

- (void)startActivity
{
  objc_msgSend(MEMORY[0x1E0D1E788], "attachCurrentActivityToConnection:", self->_connection);
}

- (void)stopActivity
{
  objc_msgSend(MEMORY[0x1E0D1E788], "detachCurrentActivityFromConnection:", self->_connection);
}

- (void)close
{
  -[MFNWConnectionWrapper _closeWithError:](self, "_closeWithError:", 0);
}

- (id)securityProtocol
{
  if (self->_securityProtocol)
    return self->_securityProtocol;
  else
    return (id)*MEMORY[0x1E0C9B328];
}

- (BOOL)setSecurityProtocol:(id)a3
{
  NSString *v6;
  NSString *v7;
  BOOL v8;
  NSObject *v9;
  nw_protocol_options_t options;
  NSObject *eventSemaphore;
  dispatch_time_t v12;
  NSObject *v13;
  void *v14;
  void *v16;
  int v17;
  MFNWConnectionWrapper *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (-[NSString isEqualToString:](self->_securityProtocol, "isEqualToString:", v6))
  {
    v7 = 0;
  }
  else
  {
    v7 = self->_securityProtocol;
    objc_storeStrong((id *)&self->_securityProtocol, a3);
  }
  os_unfair_lock_unlock(&self->_lock);
  if (self->_connection)
  {
    v8 = 1;
    if (v6 && v7 != v6 && !-[NSString isEqualToString:](v6, "isEqualToString:", *MEMORY[0x1E0C9B328]))
    {
      +[MFNWConnectionWrapper log](MFNWConnectionWrapper, "log");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v17 = 134217984;
        v18 = self;
        _os_log_impl(&dword_1A4F90000, v9, OS_LOG_TYPE_INFO, "starting TLS on connection %p", (uint8_t *)&v17, 0xCu);
      }

      options = nw_tls_create_options();
      -[MFNWConnectionWrapper _configureTLS:](self, "_configureTLS:", options);
      if (!self->_eventSemaphore)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFNWConnectionWrapper.m"), 602, CFSTR("event semaphore is NULL"));

      }
      nw_connection_append_and_start_application_protocol();
      eventSemaphore = self->_eventSemaphore;
      v12 = dispatch_time(0, 30000000000);
      if (dispatch_semaphore_wait(eventSemaphore, v12))
      {
        +[MFNWConnectionWrapper log](MFNWConnectionWrapper, "log");
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          -[MFNWConnectionWrapper setSecurityProtocol:].cold.2();
      }
      else
      {
        if (self->_connectionState == 3)
        {
          +[MFNWConnectionWrapper log](MFNWConnectionWrapper, "log");
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            -[MFNWConnectionWrapper _negotiatedSecurityProtocol](self, "_negotiatedSecurityProtocol");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = 134218242;
            v18 = self;
            v19 = 2114;
            v20 = v14;
            _os_log_impl(&dword_1A4F90000, v13, OS_LOG_TYPE_DEFAULT, "negotiated SSL version for connection %p changed to %{public}@", (uint8_t *)&v17, 0x16u);

          }
          v8 = 1;
          goto LABEL_23;
        }
        +[MFNWConnectionWrapper log](MFNWConnectionWrapper, "log");
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          -[MFNWConnectionWrapper setSecurityProtocol:].cold.1();
      }
      v8 = 0;
LABEL_23:

    }
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (void)enableThroughputMonitoring:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  _BOOL4 v6;
  uint8_t buf[4];
  MFNWConnectionWrapper *v8;
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x1E0C80C00];
  if (enableThroughputMonitoring__onceToken != -1)
    dispatch_once(&enableThroughputMonitoring__onceToken, &__block_literal_global_54_0);
  if (enableThroughputMonitoring__sLowThroughputThreshold
    && self->_connection
    && -[MFNWConnectionWrapper isValid](self, "isValid"))
  {
    +[MFNWConnectionWrapper log](MFNWConnectionWrapper, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v6)
      {
        *(_DWORD *)buf = 134217984;
        v8 = self;
        _os_log_impl(&dword_1A4F90000, v5, OS_LOG_TYPE_DEFAULT, "turning throughput monitoring ON for connection %p", buf, 0xCu);
      }
    }
    else if (v6)
    {
      *(_DWORD *)buf = 134217984;
      v8 = self;
      _os_log_impl(&dword_1A4F90000, v5, OS_LOG_TYPE_DEFAULT, "turning throughput monitoring OFF for connection %p", buf, 0xCu);
    }

    nw_connection_set_low_throughput_handler();
  }
}

void __52__MFNWConnectionWrapper_enableThroughputMonitoring___block_invoke()
{
  void *v0;
  BOOL v1;
  NSObject *v2;
  _BOOL4 v3;
  const char *v4;
  NSObject *v5;
  uint32_t v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  enableThroughputMonitoring__sLowThroughputThreshold = objc_msgSend(v0, "integerForKey:", CFSTR("ThroughputMonitoringThreshold"));

  v1 = enableThroughputMonitoring__sLowThroughputThreshold == 0;
  +[MFNWConnectionWrapper log](MFNWConnectionWrapper, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);
  if (v1)
  {
    if (v3)
    {
      LOWORD(v7[0]) = 0;
      v4 = "throughput monitoring is OFF";
      v5 = v2;
      v6 = 2;
      goto LABEL_6;
    }
  }
  else if (v3)
  {
    v7[0] = 67109120;
    v7[1] = enableThroughputMonitoring__sLowThroughputThreshold;
    v4 = "throughput monitoring is ON (%u bytes/sec)";
    v5 = v2;
    v6 = 8;
LABEL_6:
    _os_log_impl(&dword_1A4F90000, v5, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)v7, v6);
  }

}

uint64_t __52__MFNWConnectionWrapper_enableThroughputMonitoring___block_invoke_58(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  +[MFNWConnectionWrapper log](MFNWConnectionWrapper, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 134217984;
    v6 = v3;
    _os_log_impl(&dword_1A4F90000, v2, OS_LOG_TYPE_DEFAULT, "closing connection %p due to low throughput", (uint8_t *)&v5, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_closeWithErrorDomain:code:", *MEMORY[0x1E0CB2FE0], 60);
}

- (void)registerForBytesAvailableWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  MFNWConnectionWrapper *v12;
  id v13;

  v4 = a3;
  +[MFNWConnectionWrapper log](MFNWConnectionWrapper, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[MFNWConnectionWrapper registerForBytesAvailableWithHandler:].cold.1();

  queue = self->_queue;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __62__MFNWConnectionWrapper_registerForBytesAvailableWithHandler___block_invoke;
  v11 = &unk_1E4E8BB10;
  v12 = self;
  v7 = v4;
  v13 = v7;
  dispatch_sync(queue, &v8);
  -[MFNWConnectionWrapper _scheduleNextRead](self, "_scheduleNextRead", v8, v9, v10, v11, v12);

}

uint64_t __62__MFNWConnectionWrapper_registerForBytesAvailableWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBytesAvailableHandler:", *(_QWORD *)(a1 + 40));
}

- (void)unregisterForBytesAvailable
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_5(&dword_1A4F90000, v0, v1, "unregisterForBytesAvailable (%p)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

uint64_t __52__MFNWConnectionWrapper_unregisterForBytesAvailable__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBytesAvailableHandler:", 0);
}

- (NSString)remoteHostname
{
  NSObject *endpoint;

  endpoint = self->_endpoint;
  if (endpoint)
  {
    endpoint = nw_endpoint_get_hostname(endpoint);
    if (endpoint)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", endpoint);
      endpoint = objc_claimAutoreleasedReturnValue();
    }
  }
  return (NSString *)endpoint;
}

- (unsigned)remotePortNumber
{
  NSObject *endpoint;

  endpoint = self->_endpoint;
  if (endpoint)
    LODWORD(endpoint) = nw_endpoint_get_port(endpoint);
  return endpoint;
}

- (BOOL)isReadable
{
  return self->_connectionState == 3 && self->_readable && self->_buffer != 0;
}

- (BOOL)isWritable
{
  return self->_connectionState == 3 && self->_writable;
}

- (BOOL)isValid
{
  return self->_connectionState == 3;
}

- (BOOL)isCellularConnection
{
  NSObject *v2;
  void *v3;
  BOOL v4;

  v2 = nw_connection_copy_connected_path();
  if (v2)
  {
    v3 = (void *)nw_path_copy_interface();
    if (v3)
      v4 = nw_path_uses_interface_type(v2, nw_interface_type_cellular);
    else
      v4 = 0;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)isConstrained
{
  NSObject *v2;
  NSObject *v3;
  BOOL is_constrained;

  v2 = nw_connection_copy_current_path((nw_connection_t)self->_connection);
  v3 = v2;
  if (v2)
    is_constrained = nw_path_is_constrained(v2);
  else
    is_constrained = 0;

  return is_constrained;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  OS_nw_endpoint *endpoint;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = nw_connection_state_to_string();
  endpoint = self->_endpoint;
  -[MFNWConnectionWrapper networkAccountIdentifier](self, "networkAccountIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> state=%s endpoint=%@ account-id=%@ service=%@"), v4, self, v5, endpoint, v7, self->_service);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (BOOL)allowsTrustPrompt
{
  return self->_allowsTrustPrompt;
}

- (void)setAllowsTrustPrompt:(BOOL)a3
{
  self->_allowsTrustPrompt = a3;
}

- (NSArray)clientCertificates
{
  return self->_clientCertificates;
}

- (void)setClientCertificates:(id)a3
{
  objc_storeStrong((id *)&self->_clientCertificates, a3);
}

- (NSString)connectionServiceType
{
  return self->_connectionServiceType;
}

- (void)setConnectionServiceType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (BOOL)isNonAppInitiated
{
  return self->_isNonAppInitiated;
}

- (void)setIsNonAppInitiated:(BOOL)a3
{
  self->_isNonAppInitiated = a3;
}

- (BOOL)disableEphemeralDiffieHellmanCiphers
{
  return self->_disableEphemeralDiffieHellmanCiphers;
}

- (void)setDisableEphemeralDiffieHellmanCiphers:(BOOL)a3
{
  self->_disableEphemeralDiffieHellmanCiphers = a3;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 168, 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (NSString)networkAccountIdentifier
{
  return self->_networkAccountIdentifier;
}

- (void)setNetworkAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (id)networkActivityChangeBlock
{
  return self->_networkActivityChangeBlock;
}

- (void)setNetworkActivityChangeBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSArray)serverCertificates
{
  return self->_serverCertificates;
}

- (id)serverTrustHandler
{
  return self->_serverTrustHandler;
}

- (void)setServerTrustHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSString)service
{
  return self->_service;
}

- (NSString)sourceApplicationBundleIdentifier
{
  return self->_sourceApplicationBundleIdentifier;
}

- (void)setSourceApplicationBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (unsigned)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(unsigned int)a3
{
  self->_timeout = a3;
}

- (BOOL)usesOpportunisticSockets
{
  return self->_usesOpportunisticSockets;
}

- (void)setUsesOpportunisticSockets:(BOOL)a3
{
  self->_usesOpportunisticSockets = a3;
}

- (id)bytesAvailableHandler
{
  return objc_getProperty(self, a2, 216, 1);
}

- (void)setBytesAvailableHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 216);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_bytesAvailableHandler, 0);
  objc_storeStrong((id *)&self->_sourceApplicationBundleIdentifier, 0);
  objc_storeStrong(&self->_serverTrustHandler, 0);
  objc_storeStrong((id *)&self->_serverCertificates, 0);
  objc_storeStrong(&self->_networkActivityChangeBlock, 0);
  objc_storeStrong((id *)&self->_networkAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_connectionServiceType, 0);
  objc_storeStrong((id *)&self->_clientCertificates, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_securityProtocol, 0);
  objc_storeStrong((id *)&self->_buffer, 0);
  objc_storeStrong((id *)&self->_readError, 0);
  objc_storeStrong((id *)&self->_writeGroup, 0);
  objc_storeStrong((id *)&self->_readBufferLock, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_eventSemaphore, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)connectToHost:withPort:service:.cold.1()
{
  int v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_0();
  v3 = 1024;
  v4 = v0;
  OUTLINED_FUNCTION_8_0(&dword_1A4F90000, v1, (uint64_t)v1, "nw_endpoint_create_host failed for %@ (error %d)", v2);
  OUTLINED_FUNCTION_5();
}

- (void)_connectToEndpoint:(uint64_t)a3 service:(NSObject *)a4 .cold.1(void *a1, int *a2, uint64_t a3, NSObject *a4)
{
  int v5;

  v5 = *a2;
  *(_DWORD *)a3 = 138412546;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 1024;
  *(_DWORD *)(a3 + 14) = v5;
  OUTLINED_FUNCTION_8_0(&dword_1A4F90000, a4, a3, "failed to open connection for %@ (%{errno}d)", (uint8_t *)a3);

}

void __52__MFNWConnectionWrapper__connectToEndpoint_service___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_3(&dword_1A4F90000, v0, v1, "event semaphore is NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void __52__MFNWConnectionWrapper__connectToEndpoint_service___block_invoke_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 134218242;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2080;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_6_0(&dword_1A4F90000, a4, a3, "state for connection %p: %s", (uint8_t *)a3);
}

void __52__MFNWConnectionWrapper__connectToEndpoint_service___block_invoke_11_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_0_5(&dword_1A4F90000, v0, v1, "nw_connection_set_cancel_handler called for %p", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __52__MFNWConnectionWrapper__connectToEndpoint_service___block_invoke_12_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_0_5(&dword_1A4F90000, v0, v1, "read close (%p)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __52__MFNWConnectionWrapper__connectToEndpoint_service___block_invoke_13_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_0_5(&dword_1A4F90000, v0, v1, "write close (%p)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_createConnectionWithEndpoint:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_3(&dword_1A4F90000, v0, v1, "nw_parameters_create failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)_createConnectionWithEndpoint:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_3(&dword_1A4F90000, v0, v1, "nw_connection_create failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)_createConnectionWithEndpoint:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_3(&dword_1A4F90000, v0, v1, "failed to set service type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)_createConnectionWithEndpoint:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_1A4F90000, v0, v1, "unknown service type: %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __39__MFNWConnectionWrapper__configureTLS___block_invoke_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_1A4F90000, log, OS_LOG_TYPE_DEBUG, "trust validation returned %@", buf, 0xCu);

}

void __43__MFNWConnectionWrapper_writeBytes_length___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7_2();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_1A4F90000, v1, OS_LOG_TYPE_ERROR, "write error on connection %p: %@", v2, 0x16u);
  OUTLINED_FUNCTION_5();
}

- (void)readBytesIntoBuffer:maxLength:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_0();
  v3 = 2048;
  v4 = v0;
  OUTLINED_FUNCTION_6_0(&dword_1A4F90000, v1, (uint64_t)v1, "readBytes on connection %p for %ld bytes", v2);
  OUTLINED_FUNCTION_5();
}

void __42__MFNWConnectionWrapper__scheduleNextRead__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_0_5(&dword_1A4F90000, v0, v1, "connection %p calling bytesAvailableHandler", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_closeWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_1A4F90000, v0, v1, "cancel failed on connection %p", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_closeWithError:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_1A4F90000, v0, v1, "cancel timed out on connection %p", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)setSecurityProtocol:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_1A4F90000, v0, v1, "starting TLS on connection %p failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)setSecurityProtocol:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_1A4F90000, v0, v1, "starting TLS timed out on connection %p", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)registerForBytesAvailableWithHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_5(&dword_1A4F90000, v0, v1, "registerForBytesAvailableWithHandler (%p)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
