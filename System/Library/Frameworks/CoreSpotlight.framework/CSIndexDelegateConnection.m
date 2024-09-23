@implementation CSIndexDelegateConnection

uint64_t __53__CSIndexDelegateConnection_sharedConnectionForUser___block_invoke(uint64_t a1)
{
  CSIndexDelegateConnection *v2;
  uint64_t v3;
  void *v4;

  v2 = [CSIndexDelegateConnection alloc];
  v3 = -[CSXPCConnection initWithMachServiceName:](v2, "initWithMachServiceName:", sDelegateConnectionName);
  v4 = (void *)sharedConnectionForUser__sCSIndexDelegateConnection;
  sharedConnectionForUser__sCSIndexDelegateConnection = v3;

  objc_msgSend((id)sharedConnectionForUser__sCSIndexDelegateConnection, "_setUser:", *(unsigned int *)(a1 + 32));
  objc_msgSend((id)sharedConnectionForUser__sCSIndexDelegateConnection, "setNonLaunching:", 1);
  return objc_msgSend((id)sharedConnectionForUser__sCSIndexDelegateConnection, "setPrivateDaemon:", sPrivateDaemon);
}

+ (id)sharedConnectionForUser:(unsigned int)a3
{
  _QWORD block[4];
  unsigned int v5;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__CSIndexDelegateConnection_sharedConnectionForUser___block_invoke;
  block[3] = &__block_descriptor_36_e5_v8__0l;
  v5 = a3;
  if (sharedConnectionForUser__onceToken_29 != -1)
    dispatch_once(&sharedConnectionForUser__onceToken_29, block);
  return (id)sharedConnectionForUser__sCSIndexDelegateConnection;
}

- (id)indexForID:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (id)sIndexMap;
  objc_sync_enter(v4);
  objc_msgSend((id)sIndexMap, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v4);

  if (v5)
  {
    objc_msgSend(v5, "indexDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {

      v5 = 0;
    }
  }

  return v5;
}

- (id)indexForProtectionClass:(id)a3
{
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  CSSanitizeProtectionClass(v15);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)sIndexMap;
  objc_sync_enter(v4);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = (id)sIndexMap;
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend((id)sIndexMap, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "indexDelegate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10 == 0;

        if (!v11)
        {
          objc_msgSend(v9, "protectionClass");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          CSSanitizeProtectionClass(v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13 == v3)
          {
            v13 = v3;
LABEL_15:
            v6 = v9;

            goto LABEL_16;
          }
          if (v13 && objc_msgSend(v3, "isEqualToString:", v13))
            goto LABEL_15;

        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_16:

  objc_sync_exit(v4);
  return v6;
}

- (void)handleError:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id obj;
  CSIndexDelegateConnection *val;
  _QWORD handler[4];
  id v26;
  id v27;
  id location;
  int out_token;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  objc_super v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  val = self;
  v34.receiver = self;
  v34.super_class = (Class)CSIndexDelegateConnection;
  -[CSIndexConnection handleError:](&v34, sel_handleError_, v4);
  if (v4 == (id)MEMORY[0x1E0C81258])
  {
    obj = (id)sIndexMap;
    objc_sync_enter(obj);
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v5 = (id)sIndexMap;
    v6 = 0;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v31;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v31 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend((id)sIndexMap, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v9), obj);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v10;
          if (v10)
          {
            objc_msgSend(v10, "indexDelegate");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = v12 == 0;

            if (!v13)
            {
              if (!v6)
                v6 = (void *)objc_opt_new();
              objc_msgSend(v11, "indexID");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "addObject:", v14);

            }
          }

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v7);
    }

    objc_sync_exit(obj);
    if (objc_msgSend(v6, "count"))
    {
      out_token = 0;
      location = 0;
      objc_initWeak(&location, val);
      -[CSXPCConnection queue](val, "queue");
      v15 = objc_claimAutoreleasedReturnValue();
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __41__CSIndexDelegateConnection_handleError___block_invoke;
      handler[3] = &unk_1E2401FE0;
      objc_copyWeak(&v27, &location);
      v26 = v6;
      notify_register_dispatch("com.apple.spotlight.IndexAgent.awake", &out_token, v15, handler);

      logForCSLogCategoryDefault();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        -[CSIndexDelegateConnection handleError:].cold.1((uint64_t)&out_token, v16, v17, v18, v19, v20, v21, v22);

      objc_destroyWeak(&v27);
      objc_destroyWeak(&location);
    }

  }
}

void __41__CSIndexDelegateConnection_handleError___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  logForCSLogCategoryDefault();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __41__CSIndexDelegateConnection_handleError___block_invoke_cold_1(a2, v5, v6, v7, v8, v9, v10, v11);

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v12 = *(id *)(a1 + 32);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(WeakRetained, "indexForID:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v16), (_QWORD)v18);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "_delegateCheckIn:", CFSTR("index-agent-awake"));

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v14);
  }

  notify_cancel(a2);
}

- (void)handleReply:(id)a3
{
  id v4;
  const char *string;
  const char *v6;
  NSObject *v7;
  void *v8;
  xpc_object_t reply;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  CSIndexJob *v14;
  _QWORD v15[4];
  id v16;

  v4 = a3;
  string = xpc_dictionary_get_string(v4, "command");
  if (string)
  {
    v6 = string;
    logForCSLogCategoryDefault();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[CSIndexDelegateConnection handleReply:].cold.1();

    if (!strcmp(v6, "perform-job"))
    {
      if (xpc_dictionary_get_uint64(v4, "id"))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", xpc_dictionary_get_uint64(v4, "id"));
        v12 = (id)objc_claimAutoreleasedReturnValue();
        -[CSIndexDelegateConnection indexForID:](self, "indexForID:", v12);
      }
      else
      {
        v12 = +[CSXPCConnection copyNSStringForKey:fromXPCDictionary:](CSXPCConnection, "copyNSStringForKey:fromXPCDictionary:", "pc", v4);
        -[CSIndexDelegateConnection indexForProtectionClass:](self, "indexForProtectionClass:", v12);
      }
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        xpc_dictionary_get_value(v4, "j");
        v13 = objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v10 = (void *)v13;
          v14 = -[CSIndexJob initWithXPCDict:]([CSIndexJob alloc], "initWithXPCDict:", v13);
          v15[0] = MEMORY[0x1E0C809B0];
          v15[1] = 3221225472;
          v15[2] = __41__CSIndexDelegateConnection_handleReply___block_invoke;
          v15[3] = &unk_1E2402008;
          v16 = v4;
          objc_msgSend(v8, "performIndexJob:protectionClass:acknowledgementHandler:", v14, 0, v15);

          goto LABEL_8;
        }

      }
    }
  }
  xpc_dictionary_get_remote_connection(v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  reply = xpc_dictionary_create_reply(v4);
  v10 = reply;
  if (v8 && reply)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CSIndexErrorDomain"), -1, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    csindex_xpc_dictionary_encode_status_with_error(v10, v11);

    xpc_connection_send_message((xpc_connection_t)v8, v10);
  }
LABEL_8:

}

void __41__CSIndexDelegateConnection_handleReply___block_invoke(uint64_t a1, void *a2)
{
  _xpc_connection_s *v3;
  xpc_object_t reply;
  void *v5;
  BOOL v6;
  id v7;

  v7 = a2;
  xpc_dictionary_get_remote_connection(*(xpc_object_t *)(a1 + 32));
  v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
  v5 = reply;
  if (v3)
    v6 = reply == 0;
  else
    v6 = 1;
  if (!v6)
  {
    csindex_xpc_dictionary_encode_status_with_error(reply, v7);
    xpc_connection_send_message(v3, v5);
  }

}

- (void)handleError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_14_0(&dword_18C42F000, a2, a3, "### notify awake start %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_8();
}

void __41__CSIndexDelegateConnection_handleError___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_14_0(&dword_18C42F000, a2, a3, "### notify awake end %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_8();
}

- (void)handleReply:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3_0(&dword_18C42F000, v0, v1, "reply command: %s", v2);
  OUTLINED_FUNCTION_1();
}

@end
