@implementation DNDSIDSSyncService

- (DNDSIDSSyncService)initWithIDSService:(id)a3
{
  id v5;
  DNDSIDSSyncService *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DNDSIDSSyncService;
  v6 = -[DNDSIDSSyncService init](&v11, sel_init);
  if (v6)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.donotdisturb.server.IdentityServicesSync", v7);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v8;

    objc_storeStrong((id *)&v6->_syncService, a3);
  }

  return v6;
}

- (void)resume
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__DNDSIDSSyncService_resume__block_invoke;
  block[3] = &unk_1E86A5970;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __28__DNDSIDSSyncService_resume__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_resume");
}

- (void)sendMessage:(id)a3 withVersionNumber:(unint64_t)a4 messageType:(id)a5 toDestinations:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v12 = a7;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __97__DNDSIDSSyncService_sendMessage_withVersionNumber_messageType_toDestinations_completionHandler___block_invoke;
  v14[3] = &unk_1E86A7788;
  v15 = v12;
  v13 = v12;
  -[DNDSIDSSyncService sendMessage:withVersionNumber:messageType:toDestinations:identifyingCompletionHandler:](self, "sendMessage:withVersionNumber:messageType:toDestinations:identifyingCompletionHandler:", a3, a4, a5, a6, v14);

}

uint64_t __97__DNDSIDSSyncService_sendMessage_withVersionNumber_messageType_toDestinations_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)sendMessage:(id)a3 withVersionNumber:(unint64_t)a4 messageType:(id)a5 toDestinations:(id)a6 identifyingCompletionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *queue;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  unint64_t v26;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  queue = self->_queue;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __108__DNDSIDSSyncService_sendMessage_withVersionNumber_messageType_toDestinations_identifyingCompletionHandler___block_invoke;
  v21[3] = &unk_1E86A77B0;
  v21[4] = self;
  v22 = v12;
  v23 = v13;
  v24 = v14;
  v25 = v15;
  v26 = a4;
  v17 = v15;
  v18 = v14;
  v19 = v13;
  v20 = v12;
  dispatch_async(queue, v21);

}

void __108__DNDSIDSSyncService_sendMessage_withVersionNumber_messageType_toDestinations_identifyingCompletionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v5 = a1[9];
  v6 = a1[7];
  v11 = 0;
  v12 = 0;
  v7 = objc_msgSend(v2, "_queue_sendMessage:withVersionNumber:messageType:toDestinations:requestIdentifier:error:", v3, v5, v4, v6, &v12, &v11);
  v8 = v12;
  v9 = v11;
  v10 = a1[8];
  if (v10)
    (*(void (**)(uint64_t, uint64_t, id, id))(v10 + 16))(v10, v7, v8, v9);

}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  NSObject *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  id v41;
  __int16 v42;
  id v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  id v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v34 = _os_activity_create(&dword_1CB895000, "com.apple.donotdisturb.DNDSIDSSyncService.incomingMessage", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v34, &state);
  v16 = v14;
  v17 = v13;
  v18 = v16;
  objc_msgSend(v11, "deviceForFromID:", v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    objc_msgSend(v19, "uniqueIDOverride");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v18;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogIDSTransport, OS_LOG_TYPE_ERROR))
      -[DNDSIDSSyncService service:account:incomingMessage:fromID:context:].cold.2();
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    objc_msgSend(v11, "devices");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v35, v52, 16);
    if (v23)
    {
      v31 = v12;
      v32 = v11;
      v24 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v36 != v24)
            objc_enumerationMutation(v22);
          v26 = DNDSLogIDSTransport;
          if (os_log_type_enabled((os_log_t)DNDSLogIDSTransport, OS_LOG_TYPE_ERROR))
          {
            v27 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
            *(_DWORD *)buf = 138412290;
            v41 = v27;
            _os_log_error_impl(&dword_1CB895000, v26, OS_LOG_TYPE_ERROR, "\t%@", buf, 0xCu);
          }
        }
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v35, v52, 16);
      }
      while (v23);
      v21 = v18;
      v12 = v31;
      v11 = v32;
      v17 = v13;
    }
    else
    {
      v21 = v18;
    }
  }

  v28 = (id)DNDSLogIDSTransport;
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v15, "outgoingResponseIdentifier");
    v29 = v15;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v41 = v11;
    v42 = 2114;
    v43 = v12;
    v44 = 2114;
    v45 = v30;
    v46 = 2114;
    v47 = v17;
    v48 = 2112;
    v49 = v21;
    v50 = 2114;
    v51 = v29;
    _os_log_debug_impl(&dword_1CB895000, v28, OS_LOG_TYPE_DEBUG, "Received sync data: service=%{public}@, account=%{public}@, identifier=%{public}@, message=%{public}@, deviceIdentifier=%@, context=%{public}@", buf, 0x3Eu);

    v15 = v29;
  }

  if (v21)
  {
    -[DNDSIDSSyncService _queue_handleIncomingMessage:deviceIdentifier:](self, "_queue_handleIncomingMessage:deviceIdentifier:", v17, v21);
  }
  else if (os_log_type_enabled((os_log_t)DNDSLogIDSTransport, OS_LOG_TYPE_ERROR))
  {
    -[DNDSIDSSyncService service:account:incomingMessage:fromID:context:].cold.1();
  }

  os_activity_scope_leave(&state);
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  int v18;
  id v19;
  __int16 v20;
  _BOOL4 v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v8 = a6;
  v24 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = DNDSLogIDSTransport;
  if (os_log_type_enabled((os_log_t)DNDSLogIDSTransport, OS_LOG_TYPE_DEBUG))
  {
    v18 = 138543874;
    v19 = v14;
    v20 = 1024;
    v21 = v8;
    v22 = 2114;
    v23 = v15;
    _os_log_debug_impl(&dword_1CB895000, v16, OS_LOG_TYPE_DEBUG, "Sync data send has finished: identifier=%{public}@, success=%{BOOL}d, error=%{public}@", (uint8_t *)&v18, 0x1Cu);
  }
  -[DNDSIDSSyncService delegate](self, "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v17, "syncService:didSendWithRequestIdentifier:withSuccess:error:", self, v14, v8, v15);

}

- (void)_queue_resume
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[IDSService addDelegate:queue:](self->_syncService, "addDelegate:queue:", self, self->_queue);
}

- (BOOL)_queue_sendMessage:(id)a3 withVersionNumber:(unint64_t)a4 messageType:(id)a5 toDestinations:(id)a6 requestIdentifier:(id *)a7 error:(id *)a8
{
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  IDSService *syncService;
  id v28;
  id v29;
  NSObject *v30;
  id *v32;
  id v33;
  void *v35;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  uint8_t buf[4];
  id v41;
  __int16 v42;
  void *v43;
  uint64_t v44;
  const __CFString *v45;
  _QWORD v46[2];
  _QWORD v47[4];

  v47[2] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a5;
  v15 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", &unk_1E86DE610, CFSTR("v"));
  v17 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "timeIntervalSinceReferenceDate");
  objc_msgSend(v17, "numberWithDouble:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v19, CFSTR("t"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v20, CFSTR("r"));

  if (v14)
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v14, CFSTR("y"));
  if (v13)
  {
    v32 = a8;
    v46[0] = CFSTR("h");
    v46[1] = CFSTR("d");
    v47[0] = v16;
    v47[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 2);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v21 = 0;
    }
    else
    {
      v44 = *MEMORY[0x1E0D341A8];
      v45 = CFSTR("sr");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v23 = (void *)MEMORY[0x1E0C99E60];
    -[IDSService devices](self->_syncService, "devices");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __110__DNDSIDSSyncService__queue_sendMessage_withVersionNumber_messageType_toDestinations_requestIdentifier_error___block_invoke;
    v38[3] = &unk_1E86A77D8;
    v33 = v15;
    v39 = v15;
    objc_msgSend(v24, "bs_compactMap:", v38);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setWithArray:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v26, "count"))
    {
      syncService = self->_syncService;
      v36 = 0;
      v37 = 0;
      v22 = -[IDSService sendMessage:toDestinations:priority:options:identifier:error:](syncService, "sendMessage:toDestinations:priority:options:identifier:error:", v35, v26, 300, v21, &v37, &v36);
      v28 = v37;
      v29 = v36;
      if (a7)
        *a7 = objc_retainAutorelease(v28);
      v30 = DNDSLogIDSTransport;
      if (v22)
      {
        if (os_log_type_enabled((os_log_t)DNDSLogIDSTransport, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v41 = v28;
          v42 = 2112;
          v43 = v26;
          _os_log_impl(&dword_1CB895000, v30, OS_LOG_TYPE_DEFAULT, "Send sync data: identifier=%{public}@; Destinations: %@",
            buf,
            0x16u);
        }
      }
      else
      {
        if (os_log_type_enabled((os_log_t)DNDSLogIDSTransport, OS_LOG_TYPE_ERROR))
          -[DNDSIDSSyncService _queue_sendMessage:withVersionNumber:messageType:toDestinations:requestIdentifier:error:].cold.3();
        if (v32)
          *v32 = objc_retainAutorelease(v29);
      }

    }
    else
    {
      if (os_log_type_enabled((os_log_t)DNDSLogIDSTransport, OS_LOG_TYPE_ERROR))
        -[DNDSIDSSyncService _queue_sendMessage:withVersionNumber:messageType:toDestinations:requestIdentifier:error:].cold.2();
      LOBYTE(v22) = 0;
    }

    v15 = v33;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogIDSTransport, OS_LOG_TYPE_ERROR))
      -[DNDSIDSSyncService _queue_sendMessage:withVersionNumber:messageType:toDestinations:requestIdentifier:error:].cold.1();
    LOBYTE(v22) = 0;
  }

  return v22;
}

id __110__DNDSIDSSyncService__queue_sendMessage_withVersionNumber_messageType_toDestinations_requestIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "uniqueIDOverride");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((_DWORD)v4)
    v6 = (void *)IDSCopyIDForDevice();
  else
    v6 = 0;

  return v6;
}

- (void)_queue_handleIncomingMessage:(id)a3 deviceIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint8_t v16[16];

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(v6, "bs_safeDictionaryForKey:", CFSTR("h"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bs_safeNumberForKey:", CFSTR("v"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "unsignedIntegerValue") == 1)
  {
    objc_msgSend(v8, "bs_safeNumberForKey:", CFSTR("r"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v6, "bs_safeDictionaryForKey:", CFSTR("d"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        -[DNDSIDSSyncService delegate](self, "delegate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v10, "unsignedIntegerValue");
        objc_msgSend(v8, "bs_safeStringForKey:", CFSTR("y"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0
          && !objc_msgSend(v12, "syncService:shouldAcceptIncomingMessage:withVersionNumber:messageType:fromDeviceIdentifier:", self, v11, v13, v14, v7))
        {
          v15 = DNDSLogIDSTransport;
          if (os_log_type_enabled((os_log_t)DNDSLogIDSTransport, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v16 = 0;
            _os_log_impl(&dword_1CB895000, v15, OS_LOG_TYPE_DEFAULT, "Discarding data because delegate did not allow the message", v16, 2u);
          }
        }
        else
        {
          objc_msgSend(v12, "syncService:didReceiveMessage:withVersionNumber:messageType:fromDeviceIdentifier:", self, v11, v13, v14, v7);
        }

      }
      else if (os_log_type_enabled((os_log_t)DNDSLogIDSTransport, OS_LOG_TYPE_ERROR))
      {
        -[DNDSIDSSyncService _queue_handleIncomingMessage:deviceIdentifier:].cold.2();
      }

    }
    else if (os_log_type_enabled((os_log_t)DNDSLogIDSTransport, OS_LOG_TYPE_ERROR))
    {
      -[DNDSIDSSyncService _queue_handleIncomingMessage:deviceIdentifier:].cold.1();
    }

  }
  else if (os_log_type_enabled((os_log_t)DNDSLogIDSTransport, OS_LOG_TYPE_ERROR))
  {
    -[DNDSIDSSyncService _queue_handleIncomingMessage:deviceIdentifier:].cold.3();
  }

}

- (DNDSSyncServiceDelegate)delegate
{
  return (DNDSSyncServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_syncService, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)service:account:incomingMessage:fromID:context:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2(&dword_1CB895000, v0, v1, "Unable to resolve the device identifier from the IDS ID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)service:account:incomingMessage:fromID:context:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Unable to find IDS device for fromID %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_queue_sendMessage:withVersionNumber:messageType:toDestinations:requestIdentifier:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2(&dword_1CB895000, v0, v1, "Failed to migrate message", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)_queue_sendMessage:withVersionNumber:messageType:toDestinations:requestIdentifier:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Unable to find matching IDS identifier for devices %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_queue_sendMessage:withVersionNumber:messageType:toDestinations:requestIdentifier:error:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  v3 = 2114;
  v4 = v0;
  _os_log_error_impl(&dword_1CB895000, v1, OS_LOG_TYPE_ERROR, "Failed to send sync data: identifier=%{public}@, error=%{public}@", v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)_queue_handleIncomingMessage:deviceIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2(&dword_1CB895000, v0, v1, "Missing record version number, will skip message", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)_queue_handleIncomingMessage:deviceIdentifier:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2(&dword_1CB895000, v0, v1, "Missing data, will skip message", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)_queue_handleIncomingMessage:deviceIdentifier:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Invalid version number, will skip message: versionNumber=%{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
