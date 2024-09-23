@implementation HIDPreferencesHelperClient

- (HIDPreferencesHelperClient)initWithConnection:(id)a3 listener:(id)a4 onQueue:(id)a5
{
  id v9;
  id v10;
  id v11;
  HIDPreferencesHelperClient *v12;
  id *p_isa;
  HIDPreferencesHelperClient *v14;
  NSObject *v15;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HIDPreferencesHelperClient;
  v12 = -[HIDPreferencesHelperClient init](&v17, sel_init);
  p_isa = (id *)&v12->super.isa;
  if (!v12)
  {
LABEL_7:
    v14 = 0;
    goto LABEL_8;
  }
  objc_storeStrong((id *)&v12->_connection, a3);
  objc_storeWeak(p_isa + 2, v10);
  if ((objc_msgSend(p_isa, "setupConnectionOnQueue:", v11) & 1) == 0)
  {
    _IOHIDLogCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[HIDPreferencesHelperClient initWithConnection:listener:onQueue:].cold.1();

    goto LABEL_7;
  }
  v14 = p_isa;
LABEL_8:

  return v14;
}

- (BOOL)setupConnectionOnQueue:(id)a3
{
  NSObject *v4;
  OS_xpc_object *connection;
  _QWORD v7[4];
  id v8;
  id location;

  v4 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  xpc_connection_set_target_queue(self->_connection, v4);
  connection = self->_connection;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__HIDPreferencesHelperClient_setupConnectionOnQueue___block_invoke;
  v7[3] = &unk_24DE4E618;
  objc_copyWeak(&v8, &location);
  xpc_connection_set_event_handler(connection, v7);
  xpc_connection_activate(self->_connection);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

  return 1;
}

void __53__HIDPreferencesHelperClient_setupConnectionOnQueue___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  xpc_connection_t *WeakRetained;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;

  v3 = a2;
  _IOHIDLogCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __53__HIDPreferencesHelperClient_setupConnectionOnQueue___block_invoke_cold_3();

  WeakRetained = (xpc_connection_t *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v6 = MEMORY[0x22075DA18](v3);
    if (v6 == MEMORY[0x24BDACFB8])
    {
      _IOHIDLogCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        __53__HIDPreferencesHelperClient_setupConnectionOnQueue___block_invoke_cold_1();

      -[xpc_connection_t invalidateConnection](WeakRetained, "invalidateConnection");
    }
    else if (v6 == MEMORY[0x24BDACFA0])
    {
      -[xpc_connection_t handleMessage:](WeakRetained, "handleMessage:", v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        xpc_connection_send_message(WeakRetained[1], v7);
        _IOHIDLogCategory();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          __53__HIDPreferencesHelperClient_setupConnectionOnQueue___block_invoke_cold_2();

      }
    }
  }

}

- (id)handleMessage:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  xpc_object_t reply;
  void *v21;
  NSObject *v22;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  _QWORD v31[5];
  _QWORD v32[5];
  id v33;
  _QWORD v34[5];
  _QWORD v35[5];
  _QWORD v36[5];
  _QWORD v37[5];
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;

  v4 = a3;
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy_;
  v45 = __Block_byref_object_dispose_;
  v46 = 0;
  v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  if (!v5)
  {
    _IOHIDLogCategory();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[HIDPreferencesHelperClient handleMessage:].cold.1();
    goto LABEL_64;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _IOHIDLogCategory();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[HIDPreferencesHelperClient handleMessage:].cold.22();
LABEL_64:

    v11 = 0;
    v13 = 0;
    v10 = 0;
    v12 = 0;
    v6 = 0;
LABEL_52:
    v14 = 0;
    goto LABEL_53;
  }
  v6 = v5;
  _IOHIDLogCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[HIDPreferencesHelperClient handleMessage:].cold.21();

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Type"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Domain"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    _IOHIDLogCategory();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[HIDPreferencesHelperClient handleMessage:].cold.2();

    v11 = 0;
    v13 = 0;
    v10 = 0;
LABEL_31:
    v12 = 0;
    goto LABEL_52;
  }
  switch(v9)
  {
    case 1:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Key"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        _IOHIDLogCategory();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          -[HIDPreferencesHelperClient handleMessage:].cold.4();
        goto LABEL_82;
      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("User"));
      v12 = (id)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        _IOHIDLogCategory();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          -[HIDPreferencesHelperClient handleMessage:].cold.5();
        goto LABEL_57;
      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Host"));
      v13 = (id)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        _IOHIDLogCategory();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          -[HIDPreferencesHelperClient handleMessage:].cold.6();

        goto LABEL_94;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v37[0] = MEMORY[0x24BDAC760];
          v37[1] = 3221225472;
          v37[2] = __44__HIDPreferencesHelperClient_handleMessage___block_invoke;
          v37[3] = &unk_24DE4E640;
          v37[4] = self;
          v12 = v12;
          v38 = v12;
          v13 = v13;
          v39 = v13;
          v10 = v10;
          v40 = v10;
          objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v37);

          goto LABEL_52;
        }
        _IOHIDLogCategory();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          -[HIDPreferencesHelperClient handleMessage:].cold.7();
        goto LABEL_51;
      }
      -[HIDPreferencesHelperClient set:value:user:host:domain:](self, "set:value:user:host:domain:", v11, 0, v12, v13, v10);
      v14 = 0;
      goto LABEL_53;
    case 2:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("User"));
      v12 = (id)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        _IOHIDLogCategory();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          -[HIDPreferencesHelperClient handleMessage:].cold.8();
        goto LABEL_82;
      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Host"));
      v13 = (id)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        _IOHIDLogCategory();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          -[HIDPreferencesHelperClient handleMessage:].cold.9();
        goto LABEL_93;
      }
      objc_msgSend(v6, "objectForKey:", CFSTR("Key"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Key"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("KeysToSet"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("KeysToRemove"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[HIDPreferencesHelperClient setMultiple:keysToRemove:user:host:domain:](self, "setMultiple:keysToRemove:user:host:domain:", v18, v19, v12, v13, v10);

        }
        goto LABEL_52;
      }
      -[HIDPreferencesHelperClient setMultiple:keysToRemove:user:host:domain:](self, "setMultiple:keysToRemove:user:host:domain:", 0, 0, v12, v13, v10);
      v14 = 0;
      goto LABEL_53;
    case 3:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("User"));
      v12 = (id)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        _IOHIDLogCategory();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          -[HIDPreferencesHelperClient handleMessage:].cold.12();
        goto LABEL_82;
      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Host"));
      v13 = (id)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        _IOHIDLogCategory();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          -[HIDPreferencesHelperClient handleMessage:].cold.13();
        goto LABEL_93;
      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Key"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v36[0] = MEMORY[0x24BDAC760];
        v36[1] = 3221225472;
        v36[2] = __44__HIDPreferencesHelperClient_handleMessage___block_invoke_16;
        v36[3] = &unk_24DE4E668;
        v36[4] = &v41;
        -[HIDPreferencesHelperClient copy:user:host:domain:reply:](self, "copy:user:host:domain:reply:", v11, v12, v13, v10, v36);
        goto LABEL_47;
      }
      _IOHIDLogCategory();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        -[HIDPreferencesHelperClient handleMessage:].cold.14();

      goto LABEL_15;
    case 4:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("User"));
      v12 = (id)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        _IOHIDLogCategory();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          -[HIDPreferencesHelperClient handleMessage:].cold.16();
        goto LABEL_82;
      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Host"));
      v13 = (id)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        objc_msgSend(v6, "objectForKey:", CFSTR("Key"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Key"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v11, "objectForKey:", CFSTR("KeysToCopy"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (v15)
            {
              objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("KeysToCopy"));
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v35[0] = MEMORY[0x24BDAC760];
              v35[1] = 3221225472;
              v35[2] = __44__HIDPreferencesHelperClient_handleMessage___block_invoke_20;
              v35[3] = &unk_24DE4E668;
              v35[4] = &v41;
              -[HIDPreferencesHelperClient copyMultiple:user:host:domain:reply:](self, "copyMultiple:user:host:domain:reply:", v16, v12, v13, v10, v35);

            }
          }
        }
        else
        {
          v34[0] = MEMORY[0x24BDAC760];
          v34[1] = 3221225472;
          v34[2] = __44__HIDPreferencesHelperClient_handleMessage___block_invoke_2;
          v34[3] = &unk_24DE4E668;
          v34[4] = &v41;
          -[HIDPreferencesHelperClient copyMultiple:user:host:domain:reply:](self, "copyMultiple:user:host:domain:reply:", 0, v12, v13, v10, v34);
        }
        goto LABEL_47;
      }
      _IOHIDLogCategory();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        -[HIDPreferencesHelperClient handleMessage:].cold.17();
      goto LABEL_93;
    case 5:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("User"));
      v12 = (id)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        _IOHIDLogCategory();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          -[HIDPreferencesHelperClient handleMessage:].cold.10();
        goto LABEL_82;
      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Host"));
      v13 = (id)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        -[HIDPreferencesHelperClient synchronize:host:domain:](self, "synchronize:host:domain:", v12, v13, v10);
LABEL_15:
        v11 = 0;
      }
      else
      {
        _IOHIDLogCategory();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          -[HIDPreferencesHelperClient handleMessage:].cold.11();
LABEL_93:

        v11 = 0;
LABEL_94:
        v13 = 0;
      }
      goto LABEL_52;
    case 6:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Key"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        _IOHIDLogCategory();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          -[HIDPreferencesHelperClient handleMessage:].cold.20();
        goto LABEL_82;
      }
      v31[0] = MEMORY[0x24BDAC760];
      v31[1] = 3221225472;
      v31[2] = __44__HIDPreferencesHelperClient_handleMessage___block_invoke_22;
      v31[3] = &unk_24DE4E668;
      v31[4] = &v41;
      -[HIDPreferencesHelperClient copyDomain:domain:reply:](self, "copyDomain:domain:reply:", v11, v10, v31);
      v12 = 0;
      v13 = 0;
LABEL_47:
      reply = xpc_dictionary_create_reply(v4);
      v21 = reply;
      if (reply)
      {
        xpc_dictionary_set_value(reply, "Value", (xpc_object_t)v42[5]);
        v14 = v21;
        goto LABEL_53;
      }
      _IOHIDLogCategory();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[HIDPreferencesHelperClient handleMessage:].cold.15();
LABEL_51:

      goto LABEL_52;
    case 7:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Key"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        _IOHIDLogCategory();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          -[HIDPreferencesHelperClient handleMessage:].cold.18();
LABEL_82:

LABEL_29:
        v11 = 0;
        goto LABEL_30;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v32[0] = MEMORY[0x24BDAC760];
          v32[1] = 3221225472;
          v32[2] = __44__HIDPreferencesHelperClient_handleMessage___block_invoke_21;
          v32[3] = &unk_24DE4E690;
          v32[4] = self;
          v10 = v10;
          v33 = v10;
          objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v32);

        }
        else
        {
          _IOHIDLogCategory();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            -[HIDPreferencesHelperClient handleMessage:].cold.19();
LABEL_57:

        }
LABEL_30:
        v13 = 0;
        goto LABEL_31;
      }
      -[HIDPreferencesHelperClient setDomain:value:domain:](self, "setDomain:value:domain:", v11, 0, v10);
      v13 = 0;
      v12 = 0;
      v14 = 0;
LABEL_53:

      _Block_object_dispose(&v41, 8);
      return v14;
    default:
      _IOHIDLogCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[HIDPreferencesHelperClient handleMessage:].cold.3();

      goto LABEL_29;
  }
}

uint64_t __44__HIDPreferencesHelperClient_handleMessage___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "set:value:user:host:domain:", a2, a3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __44__HIDPreferencesHelperClient_handleMessage___block_invoke_16(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (a2)
  {
    v3 = _CFXPCCreateXPCObjectFromCFObject();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

void __44__HIDPreferencesHelperClient_handleMessage___block_invoke_20(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (a2)
  {
    v3 = _CFXPCCreateXPCObjectFromCFObject();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

void __44__HIDPreferencesHelperClient_handleMessage___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (a2)
  {
    v3 = _CFXPCCreateXPCObjectFromCFObject();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

uint64_t __44__HIDPreferencesHelperClient_handleMessage___block_invoke_21(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDomain:value:domain:", a2, a3, *(_QWORD *)(a1 + 40));
}

void __44__HIDPreferencesHelperClient_handleMessage___block_invoke_22(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (a2)
  {
    v3 = _CFXPCCreateXPCObjectFromCFObject();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

- (void)invalidateConnection
{
  id WeakRetained;
  OS_xpc_object *connection;
  BOOL v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_listener);
  connection = self->_connection;
  v6 = WeakRetained;
  if (connection)
    v5 = WeakRetained == 0;
  else
    v5 = 1;
  if (!v5)
  {
    xpc_connection_cancel(connection);
    objc_msgSend(v6, "removeClient:", self);
  }

}

- (void)set:(id)a3 value:(id)a4 user:(id)a5 host:(id)a6 domain:(id)a7
{
  __CFString *v11;
  id v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  NSObject *v16;
  int v17;
  __CFString *v18;
  __int16 v19;
  __CFString *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  __CFString *v24;
  __int16 v25;
  __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v11 = (__CFString *)a3;
  v12 = a4;
  v13 = (__CFString *)a5;
  v14 = (__CFString *)a6;
  v15 = (__CFString *)a7;
  _IOHIDLogCategory();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v17 = 138413314;
    v18 = v11;
    v19 = 2112;
    v20 = v13;
    v21 = 2112;
    v22 = v12;
    v23 = 2112;
    v24 = v14;
    v25 = 2112;
    v26 = v15;
    _os_log_debug_impl(&dword_21B143000, v16, OS_LOG_TYPE_DEBUG, "HIDPreferencesHelper Set Key:%@ Value:%@ User:%@ Host:%@ Domain:%@\n", (uint8_t *)&v17, 0x34u);
  }

  CFPreferencesSetValue(v11, v12, v15, v13, v14);
}

- (void)copy:(id)a3 user:(id)a4 host:(id)a5 domain:(id)a6 reply:(id)a7
{
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  void (**v15)(id, void *);
  NSObject *v16;
  void *v17;
  NSObject *v18;
  int v19;
  __CFString *v20;
  __int16 v21;
  __CFString *v22;
  __int16 v23;
  __CFString *v24;
  __int16 v25;
  __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v11 = (__CFString *)a3;
  v12 = (__CFString *)a4;
  v13 = (__CFString *)a5;
  v14 = (__CFString *)a6;
  v15 = (void (**)(id, void *))a7;
  _IOHIDLogCategory();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v19 = 138413058;
    v20 = v11;
    v21 = 2112;
    v22 = v12;
    v23 = 2112;
    v24 = v13;
    v25 = 2112;
    v26 = v14;
    _os_log_debug_impl(&dword_21B143000, v16, OS_LOG_TYPE_DEBUG, "HIDPreferencesHelper Copy Key:%@ User:%@ Host:%@ Domain:%@\n", (uint8_t *)&v19, 0x2Au);
  }

  v17 = (void *)CFPreferencesCopyValue(v11, v14, v12, v13);
  _IOHIDLogCategory();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    -[HIDPreferencesHelperClient copy:user:host:domain:reply:].cold.1();

  if (v15)
    v15[2](v15, v17);

}

- (void)synchronize:(id)a3 host:(id)a4 domain:(id)a5
{
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  NSObject *v10;
  int v11;
  __CFString *v12;
  __int16 v13;
  __CFString *v14;
  __int16 v15;
  __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v7 = (__CFString *)a3;
  v8 = (__CFString *)a4;
  v9 = (__CFString *)a5;
  _IOHIDLogCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = 138412802;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    v15 = 2112;
    v16 = v9;
    _os_log_debug_impl(&dword_21B143000, v10, OS_LOG_TYPE_DEBUG, "HIDPreferencesHelper Synchronize User:%@ Host:%@ Domain:%@\n", (uint8_t *)&v11, 0x20u);
  }

  CFPreferencesSynchronize(v9, v7, v8);
}

- (void)copyMultiple:(id)a3 user:(id)a4 host:(id)a5 domain:(id)a6 reply:(id)a7
{
  const __CFArray *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  void (**v15)(id, CFDictionaryRef);
  NSObject *v16;
  CFDictionaryRef v17;
  NSObject *v18;
  int v19;
  const __CFArray *v20;
  __int16 v21;
  __CFString *v22;
  __int16 v23;
  __CFString *v24;
  __int16 v25;
  __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v11 = (const __CFArray *)a3;
  v12 = (__CFString *)a4;
  v13 = (__CFString *)a5;
  v14 = (__CFString *)a6;
  v15 = (void (**)(id, CFDictionaryRef))a7;
  _IOHIDLogCategory();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v19 = 138413058;
    v20 = v11;
    v21 = 2112;
    v22 = v12;
    v23 = 2112;
    v24 = v13;
    v25 = 2112;
    v26 = v14;
    _os_log_debug_impl(&dword_21B143000, v16, OS_LOG_TYPE_DEBUG, "HIDPreferencesHelper Copy Multiple Keys:%@ User:%@ Host:%@ Domain:%@\n", (uint8_t *)&v19, 0x2Au);
  }

  v17 = CFPreferencesCopyMultiple(v11, v14, v12, v13);
  _IOHIDLogCategory();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    -[HIDPreferencesHelperClient copy:user:host:domain:reply:].cold.1();

  if (v15)
    v15[2](v15, v17);

}

- (void)setMultiple:(id)a3 keysToRemove:(id)a4 user:(id)a5 host:(id)a6 domain:(id)a7
{
  const __CFDictionary *v11;
  const __CFArray *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  NSObject *v16;
  int v17;
  const __CFDictionary *v18;
  __int16 v19;
  const __CFArray *v20;
  __int16 v21;
  __CFString *v22;
  __int16 v23;
  __CFString *v24;
  __int16 v25;
  __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v11 = (const __CFDictionary *)a3;
  v12 = (const __CFArray *)a4;
  v13 = (__CFString *)a5;
  v14 = (__CFString *)a6;
  v15 = (__CFString *)a7;
  _IOHIDLogCategory();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v17 = 138413314;
    v18 = v11;
    v19 = 2112;
    v20 = v12;
    v21 = 2112;
    v22 = v13;
    v23 = 2112;
    v24 = v14;
    v25 = 2112;
    v26 = v15;
    _os_log_debug_impl(&dword_21B143000, v16, OS_LOG_TYPE_DEBUG, "HIDPreferencesHelper Set Multiple KeysToSet:%@ KeysToRemove:%@ User:%@ Host:%@ Domain:%@\n", (uint8_t *)&v17, 0x34u);
  }

  CFPreferencesSetMultiple(v11, v12, v15, v13, v14);
}

- (void)copyDomain:(id)a3 domain:(id)a4 reply:(id)a5
{
  __CFString *v7;
  __CFString *v8;
  void (**v9)(id, void *);
  NSObject *v10;
  void *v11;
  NSObject *v12;

  v7 = (__CFString *)a3;
  v8 = (__CFString *)a4;
  v9 = (void (**)(id, void *))a5;
  _IOHIDLogCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[HIDPreferencesHelperClient copyDomain:domain:reply:].cold.2();

  v11 = (void *)CFPreferencesCopyAppValue(v7, v8);
  _IOHIDLogCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[HIDPreferencesHelperClient copy:user:host:domain:reply:].cold.1();

  if (v9)
    v9[2](v9, v11);

}

- (void)setDomain:(id)a3 value:(id)a4 domain:(id)a5
{
  __CFString *v7;
  id v8;
  __CFString *v9;
  NSObject *v10;
  int v11;
  __CFString *v12;
  __int16 v13;
  __CFString *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v7 = (__CFString *)a3;
  v8 = a4;
  v9 = (__CFString *)a5;
  _IOHIDLogCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = 138412802;
    v12 = v7;
    v13 = 2112;
    v14 = v9;
    v15 = 2112;
    v16 = v8;
    _os_log_debug_impl(&dword_21B143000, v10, OS_LOG_TYPE_DEBUG, "HIDPreferencesHelper Set Domain Value Key:%@ Domain:%@ Value : %@\n", (uint8_t *)&v11, 0x20u);
  }

  CFPreferencesSetAppValue(v7, v8, v9);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_listener);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)initWithConnection:listener:onQueue:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21B143000, v0, v1, "HIDPreferencesHelper failed to setup connection\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __53__HIDPreferencesHelperClient_setupConnectionOnQueue___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_21B143000, v0, v1, "HIDPreferencesHelper Remote Connection terminated\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __53__HIDPreferencesHelperClient_setupConnectionOnQueue___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_21B143000, v0, v1, "HIDPreferencesHelper send event reply\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __53__HIDPreferencesHelperClient_setupConnectionOnQueue___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_21B143000, v0, v1, "HIDPreferencesHelper XPC connection event\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)handleMessage:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21B143000, v0, v1, "HIDPreferencesHelper failed to decode message\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)handleMessage:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21B143000, v0, v1, "HIDPreferencesHelper invalid domain\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)handleMessage:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_21B143000, v0, v1, "HIDPreferencesHelper invalid request type %lu\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)handleMessage:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21B143000, v0, v1, "HIDPreferencesHelper Set invalid key\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)handleMessage:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21B143000, v0, v1, "HIDPreferencesHelper Set invalid user\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)handleMessage:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21B143000, v0, v1, "HIDPreferencesHelper Set invalid host\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)handleMessage:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_21B143000, v0, v1, "HIDPreferencesHelper Set unknown key type %@\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)handleMessage:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21B143000, v0, v1, "HIDPreferencesHelper Set Multiple invalid user\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)handleMessage:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21B143000, v0, v1, "HIDPreferencesHelper Set Multiple invalid host\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)handleMessage:.cold.10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21B143000, v0, v1, "HIDPreferencesHelper Synchronize invalid user\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)handleMessage:.cold.11()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21B143000, v0, v1, "HIDPreferencesHelper Synchronize invalid host\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)handleMessage:.cold.12()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21B143000, v0, v1, "HIDPreferencesHelper Copy invalid user\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)handleMessage:.cold.13()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21B143000, v0, v1, "HIDPreferencesHelper Copy invalid host\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)handleMessage:.cold.14()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21B143000, v0, v1, "HIDPreferencesHelper Copy invalid key\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)handleMessage:.cold.15()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21B143000, v0, v1, "HIDPreferencesHelper failed to create reply object\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)handleMessage:.cold.16()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21B143000, v0, v1, "HIDPreferencesHelper Copy Multiple invalid user\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)handleMessage:.cold.17()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21B143000, v0, v1, "HIDPreferencesHelper Copy Multiple invalid host\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)handleMessage:.cold.18()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21B143000, v0, v1, "HIDPreferencesHelper Set Domain invalid key\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)handleMessage:.cold.19()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_21B143000, v0, v1, "HIDPreferencesHelper Set Domain unknown key type %@\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)handleMessage:.cold.20()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21B143000, v0, v1, "HIDPreferencesHelper Copy Domain invalid key\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)handleMessage:.cold.21()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_21B143000, v0, v1, "HIDPreferencesHelper Message from remote connection %@\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)handleMessage:.cold.22()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21B143000, v0, v1, "HIDPreferencesHelper invalid message type\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)copy:user:host:domain:reply:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_21B143000, v0, v1, "HIDPreferencesHelper CFPreference value %@\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)copyDomain:domain:reply:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_7();
  v3 = 2112;
  v4 = v0;
  _os_log_debug_impl(&dword_21B143000, v1, OS_LOG_TYPE_DEBUG, "HIDPreferencesHelper Copy Domain Value Key:%@ Domain:%@\n", v2, 0x16u);
  OUTLINED_FUNCTION_4();
}

@end
