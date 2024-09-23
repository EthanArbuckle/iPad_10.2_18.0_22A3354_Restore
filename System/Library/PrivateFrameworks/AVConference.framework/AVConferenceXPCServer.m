@implementation AVConferenceXPCServer

void __52__AVConferenceXPCServer_sendMessageAsync_arguments___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  _BYTE v7[128];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v7, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        xpc_connection_send_message((xpc_connection_t)objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "connection"), *(xpc_object_t *)(a1 + 40));
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v7, 16);
    }
    while (v4);
  }
  xpc_release(*(xpc_object_t *)(a1 + 40));
}

- (id)_xpc_get_connection_from_list_for_connection:(id)a3
{
  NSMutableArray *clientConnections;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _BYTE v12[128];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->clientConnectionsQueue);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  clientConnections = self->clientConnections;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](clientConnections, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
  if (!v6)
    return 0;
  v7 = v6;
  v8 = *(_QWORD *)v14;
LABEL_3:
  v9 = 0;
  while (1)
  {
    if (*(_QWORD *)v14 != v8)
      objc_enumerationMutation(clientConnections);
    v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
    if ((id)objc_msgSend(v10, "connection") == a3)
      return v10;
    if (v7 == ++v9)
    {
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](clientConnections, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
      if (v7)
        goto LABEL_3;
      return 0;
    }
  }
}

void __69__AVConferenceXPCServer_XPCManagement___xpc_handle_incoming_request___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  NSObject *v5;
  const char *string;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  xpc_object_t value;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  pid_t pid;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  int ErrorLogLevelForModule;
  uint64_t v32;
  char IsOSFaultDisabled;
  NSObject *v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  _BYTE *v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  NSObject *v44;
  uint64_t v45;
  id v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id obj;
  _QWORD v52[6];
  _QWORD block[4];
  __int128 v54;
  _BYTE *v55;
  _QWORD v56[13];
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  void (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  uint64_t v62;
  _QWORD v63[4];
  __int128 v64;
  _BYTE *v65;
  _BYTE v66[128];
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE buf[24];
  __int128 v72;
  uint64_t v73;
  __int16 v74;
  NSObject *v75;
  _BYTE v76[24];
  void (*v77)(uint64_t, uint64_t);
  void (*v78)(uint64_t);
  uint64_t v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  if (MEMORY[0x1DF089754](a2) == MEMORY[0x1E0C812F8])
  {
    objc_msgSend(*(id *)(a1 + 32), "_xpc_add_connection_to_list:", *(_QWORD *)(a1 + 40));
    *(_QWORD *)v76 = 0;
    *(_QWORD *)&v76[8] = v76;
    *(_QWORD *)&v76[16] = 0x3052000000;
    v77 = __Block_byref_object_copy__28;
    v78 = __Block_byref_object_dispose__28;
    v79 = 0;
    v63[0] = MEMORY[0x1E0C809B0];
    v63[1] = 3221225472;
    v63[2] = __69__AVConferenceXPCServer_XPCManagement___xpc_handle_incoming_request___block_invoke_2;
    v63[3] = &unk_1E9E527A8;
    v65 = v76;
    v64 = *(_OWORD *)(a1 + 32);
    dispatch_barrier_sync(*(dispatch_queue_t *)(v64 + 48), v63);
    v57 = 0;
    v58 = &v57;
    v59 = 0x3052000000;
    v60 = __Block_byref_object_copy__28;
    v61 = __Block_byref_object_dispose__28;
    v62 = 0xAAAAAAAAAAAAAAAALL;
    v62 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", xpc_dictionary_get_string(a2, "API"));
    value = xpc_dictionary_get_value(a2, "XPCARGUMENTS");
    v17 = value;
    if (value)
    {
      xpc_retain(value);
      xpc_dictionary_set_value(a2, "XPCARGUMENTS", 0);
    }
    v18 = (void *)objc_msgSend(*(id *)(a1 + 32), "newNSDictionaryFromXPCDictionary:", a2);
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v18);

    if (objc_msgSend((id)objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("CACHEAUTHTOKEN")), "BOOLValue"))
    {
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", a1 + 48, 32);
      v21 = *(void **)(*(_QWORD *)&v76[8] + 40);
      if (v21 && !objc_msgSend(v21, "tokenData"))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v22 = VRTraceErrorLogLevelToCSTR();
          v23 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            pid = xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 40));
            *(_DWORD *)buf = 136315906;
            *(_QWORD *)&buf[4] = v22;
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = "-[AVConferenceXPCServer(XPCManagement) _xpc_handle_incoming_request:]_block_invoke";
            *(_WORD *)&buf[22] = 1024;
            LODWORD(v72) = 766;
            WORD2(v72) = 1024;
            *(_DWORD *)((char *)&v72 + 6) = pid;
            _os_log_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_DEFAULT, "AVConferenceXPCServer [%s] %s:%d VCXPCServer: caching audit token from PID %d", buf, 0x22u);
          }
        }
        objc_msgSend(*(id *)(*(_QWORD *)&v76[8] + 40), "setTokenData:", v20);
      }

    }
    if (xpc_dictionary_get_BOOL(a2, "USERPERSISTENT"))
      objc_msgSend(*(id *)(*(_QWORD *)&v76[8] + 40), "setPersistent:", 1);
    if (v17)
    {
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v17, CFSTR("USERXPCARGUMENTS"));
      xpc_release(v17);
    }
    objc_msgSend(*(id *)(a1 + 32), "appendPIDToDictionary:pid:", v19, xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 40)));
    objc_msgSend(*(id *)(a1 + 32), "appendContextToDictionary:forConnection:", v19, *(_QWORD *)(a1 + 40));
    v25 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    objc_sync_enter(v25);
    v26 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKeyedSubscript:", v58[5]);
    v27 = v26;
    if (!v26)
    {
      objc_sync_exit(v25);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v35 = VRTraceErrorLogLevelToCSTR();
        v36 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v37 = v58[5];
          *(_DWORD *)buf = 136315906;
          *(_QWORD *)&buf[4] = v35;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "-[AVConferenceXPCServer(XPCManagement) _xpc_handle_incoming_request:]_block_invoke_3";
          *(_WORD *)&buf[22] = 1024;
          LODWORD(v72) = 888;
          WORD2(v72) = 2112;
          *(_QWORD *)((char *)&v72 + 6) = v37;
          _os_log_impl(&dword_1D8A54000, v36, OS_LOG_TYPE_DEFAULT, "AVConferenceXPCServer [%s] %s:%d VCXPCServer: invalid service requested or no block registered for service %@, ignoring", buf, 0x26u);
        }
      }
      goto LABEL_60;
    }
    v28 = objc_msgSend(v26, "block");
    v29 = a1;
    v30 = objc_msgSend(v27, "queue");
    ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if ((int)objc_msgSend(v27, "eventLogLevel") > ErrorLogLevelForModule || (int)objc_msgSend(v27, "eventLogLevel") < 1)
      goto LABEL_59;
    objc_msgSend(v27, "eventLogLevel");
    v32 = VRTraceErrorLogLevelToCSTR();
    if ((int)objc_msgSend(v27, "eventLogLevel") > 2)
    {
      if ((int)objc_msgSend(v27, "eventLogLevel") > 4)
      {
        if ((int)objc_msgSend(v27, "eventLogLevel") > 7)
        {
          if ((int)objc_msgSend(v27, "eventLogLevel") > 8)
            goto LABEL_59;
          v43 = *MEMORY[0x1E0CF2758];
          v44 = *MEMORY[0x1E0CF2758];
          if (!*MEMORY[0x1E0CF2748])
          {
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
            {
              v50 = v58[5];
              *(_DWORD *)buf = 136316418;
              *(_QWORD *)&buf[4] = v32;
              *(_WORD *)&buf[12] = 2080;
              *(_QWORD *)&buf[14] = "-[AVConferenceXPCServer(XPCManagement) _xpc_handle_incoming_request:]_block_invoke";
              *(_WORD *)&buf[22] = 1024;
              LODWORD(v72) = 796;
              WORD2(v72) = 2112;
              *(_QWORD *)((char *)&v72 + 6) = v50;
              HIWORD(v72) = 2048;
              v73 = v28;
              v74 = 2048;
              v75 = v30;
              _os_log_debug_impl(&dword_1D8A54000, v43, OS_LOG_TYPE_DEBUG, "AVConferenceXPCServer [%s] %s:%d VCXPCServer: dispatching registered block for service %@, block %p, queue %p", buf, 0x3Au);
            }
            goto LABEL_59;
          }
          if (!os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
            goto LABEL_59;
        }
        else
        {
          v43 = *MEMORY[0x1E0CF2758];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            goto LABEL_59;
        }
        v45 = v58[5];
        *(_DWORD *)buf = 136316418;
        *(_QWORD *)&buf[4] = v32;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[AVConferenceXPCServer(XPCManagement) _xpc_handle_incoming_request:]_block_invoke";
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v72) = 796;
        WORD2(v72) = 2112;
        *(_QWORD *)((char *)&v72 + 6) = v45;
        HIWORD(v72) = 2048;
        v73 = v28;
        v74 = 2048;
        v75 = v30;
        _os_log_impl(&dword_1D8A54000, v43, OS_LOG_TYPE_DEFAULT, "AVConferenceXPCServer [%s] %s:%d VCXPCServer: dispatching registered block for service %@, block %p, queue %p", buf, 0x3Au);
        goto LABEL_59;
      }
      v34 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
LABEL_47:
        v41 = v58[5];
        *(_DWORD *)buf = 136316418;
        *(_QWORD *)&buf[4] = v32;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[AVConferenceXPCServer(XPCManagement) _xpc_handle_incoming_request:]_block_invoke";
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v72) = 796;
        WORD2(v72) = 2112;
        *(_QWORD *)((char *)&v72 + 6) = v41;
        HIWORD(v72) = 2048;
        v73 = v28;
        v74 = 2048;
        v75 = v30;
        _os_log_error_impl(&dword_1D8A54000, v34, OS_LOG_TYPE_ERROR, "AVConferenceXPCServer [%s] %s:%d VCXPCServer: dispatching registered block for service %@, block %p, queue %p", buf, 0x3Au);
      }
    }
    else
    {
      IsOSFaultDisabled = VRTraceIsOSFaultDisabled();
      v34 = *MEMORY[0x1E0CF2758];
      if ((IsOSFaultDisabled & 1) == 0)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
        {
          v42 = v58[5];
          *(_DWORD *)buf = 136316418;
          *(_QWORD *)&buf[4] = v32;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "-[AVConferenceXPCServer(XPCManagement) _xpc_handle_incoming_request:]_block_invoke";
          *(_WORD *)&buf[22] = 1024;
          LODWORD(v72) = 796;
          WORD2(v72) = 2112;
          *(_QWORD *)((char *)&v72 + 6) = v42;
          HIWORD(v72) = 2048;
          v73 = v28;
          v74 = 2048;
          v75 = v30;
          _os_log_fault_impl(&dword_1D8A54000, v34, OS_LOG_TYPE_FAULT, "AVConferenceXPCServer [%s] %s:%d VCXPCServer: dispatching registered block for service %@, block %p, queue %p", buf, 0x3Au);
        }
        goto LABEL_59;
      }
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_47;
    }
LABEL_59:
    v46 = *(id *)(*(_QWORD *)&v76[8] + 40);
    v47 = (id)v58[5];
    xpc_retain(a2);
    v56[0] = MEMORY[0x1E0C809B0];
    v56[1] = 3221225472;
    v56[2] = __69__AVConferenceXPCServer_XPCManagement___xpc_handle_incoming_request___block_invoke_188;
    v56[3] = &unk_1E9E57050;
    v56[10] = v28;
    v56[11] = &v57;
    v56[4] = v27;
    v56[5] = v30;
    v56[12] = v76;
    v48 = *(_QWORD *)(v29 + 32);
    v49 = *(_QWORD *)(v29 + 40);
    v56[6] = v19;
    v56[7] = v48;
    v56[8] = a2;
    v56[9] = v49;
    dispatch_async(v30, v56);
    objc_sync_exit(v25);
LABEL_60:

    _Block_object_dispose(&v57, 8);
    v40 = v76;
    goto LABEL_61;
  }
  if (MEMORY[0x1DF089754](a2) != MEMORY[0x1E0C81310])
    return;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3052000000;
  *(_QWORD *)&v72 = __Block_byref_object_copy__28;
  *((_QWORD *)&v72 + 1) = __Block_byref_object_dispose__28;
  v73 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__AVConferenceXPCServer_XPCManagement___xpc_handle_incoming_request___block_invoke_195;
  block[3] = &unk_1E9E527A8;
  v55 = buf;
  v54 = *(_OWORD *)(a1 + 32);
  dispatch_barrier_sync(*(dispatch_queue_t *)(v54 + 48), block);
  if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        string = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x1E0C81270]);
        __69__AVConferenceXPCServer_XPCManagement___xpc_handle_incoming_request___block_invoke_cold_1(v4, (uint64_t)string, v76, v5);
      }
    }
    if (xpc_dictionary_get_BOOL(a2, "USERPERSISTENT"))
      objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setPersistent:", 1);
    v7 = (void *)objc_msgSend(*(id *)(a1 + 32), "newClientDiedDictionary");
    objc_msgSend(*(id *)(a1 + 32), "appendPIDToDictionary:pid:", v7, xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 40)));
    objc_msgSend(*(id *)(a1 + 32), "appendContextToDictionary:forConnection:", v7, *(_QWORD *)(a1 + 40));
    obj = *(id *)(*(_QWORD *)(a1 + 32) + 24);
    objc_sync_enter(obj);
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    v8 = a1;
    v9 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v67, v66, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v68;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v68 != v11)
            objc_enumerationMutation(v9);
          v13 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(v8 + 32) + 24), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * i), obj);
          v14 = objc_msgSend(v13, "block");
          v15 = objc_msgSend(v13, "queue");
          v52[0] = MEMORY[0x1E0C809B0];
          v52[1] = 3221225472;
          v52[2] = __69__AVConferenceXPCServer_XPCManagement___xpc_handle_incoming_request___block_invoke_197;
          v52[3] = &unk_1E9E533D0;
          v52[4] = v7;
          v52[5] = v14;
          dispatch_async(v15, v52);
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v67, v66, 16);
      }
      while (v10);
    }
    objc_sync_exit(obj);

    objc_msgSend(*(id *)(v8 + 32), "_xpc_remove_connection_from_list:", *(_QWORD *)(v8 + 40));
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v38 = VRTraceErrorLogLevelToCSTR();
    v39 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v76 = 136315650;
      *(_QWORD *)&v76[4] = v38;
      *(_WORD *)&v76[12] = 2080;
      *(_QWORD *)&v76[14] = "-[AVConferenceXPCServer(XPCManagement) _xpc_handle_incoming_request:]_block_invoke_2";
      *(_WORD *)&v76[22] = 1024;
      LODWORD(v77) = 899;
      _os_log_impl(&dword_1D8A54000, v39, OS_LOG_TYPE_DEFAULT, "AVConferenceXPCServer [%s] %s:%d VCXPCServer: client connection fully disconnected or error from unrecognized client", v76, 0x1Cu);
    }
  }
  v40 = buf;
LABEL_61:
  _Block_object_dispose(v40, 8);
}

- (void)_xpc_add_connection_to_list:(id)a3
{
  NSObject *clientConnectionsQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    clientConnectionsQueue = self->clientConnectionsQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__AVConferenceXPCServer_XPCManagement___xpc_add_connection_to_list___block_invoke;
    block[3] = &unk_1E9E52238;
    block[4] = self;
    block[5] = a3;
    dispatch_barrier_sync(clientConnectionsQueue, block);
  }
}

- (id)newNSDictionaryFromXPCDictionary:(id)a3
{
  if (a3)
    return (id)_CFXPCCreateCFObjectFromXPCObject();
  else
    return 0;
}

- (void)appendPIDToDictionary:(id)a3 pid:(int)a4
{
  id v5;

  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", *(_QWORD *)&a4);
  objc_msgSend(a3, "setObject:forKeyedSubscript:", v5, CFSTR("CLIENTPID"));

}

- (void)appendContextToDictionary:(id)a3 forConnection:(id)a4
{
  NSObject *clientConnectionsQueue;
  _QWORD v8[8];

  v8[7] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "setObject:forKeyedSubscript:", 0, CFSTR("CONTEXT"));
  if (a4)
  {
    clientConnectionsQueue = self->clientConnectionsQueue;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __65__AVConferenceXPCServer_appendContextToDictionary_forConnection___block_invoke;
    v8[3] = &unk_1E9E527D0;
    v8[4] = self;
    v8[5] = a4;
    v8[6] = a3;
    dispatch_sync(clientConnectionsQueue, v8);
  }
}

uint64_t __69__AVConferenceXPCServer_XPCManagement___xpc_handle_incoming_request___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_xpc_get_connection_from_list_for_connection:", *(_QWORD *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = result;
  return result;
}

void *__65__AVConferenceXPCServer_appendContextToDictionary_forConnection___block_invoke(uint64_t a1)
{
  void *result;
  void *v3;

  result = (void *)objc_msgSend(*(id *)(a1 + 32), "_xpc_get_connection_from_list_for_connection:", *(_QWORD *)(a1 + 40));
  if (result)
  {
    v3 = result;
    result = (void *)objc_msgSend(result, "context");
    if (result)
      return (void *)objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", objc_msgSend(v3, "context"), CFSTR("CONTEXT"));
  }
  return result;
}

void __68__AVConferenceXPCServer_XPCManagement___xpc_add_connection_to_list___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  pid_t pid;
  VCXPCConnection *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  pid_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(*(id *)(a1 + 32), "_xpc_get_connection_from_list_for_connection:", *(_QWORD *)(a1 + 40)))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v2 = VRTraceErrorLogLevelToCSTR();
      v3 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        pid = xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 40));
        v6 = 136315906;
        v7 = v2;
        v8 = 2080;
        v9 = "-[AVConferenceXPCServer(XPCManagement) _xpc_add_connection_to_list:]_block_invoke";
        v10 = 1024;
        v11 = 959;
        v12 = 1024;
        v13 = pid;
        _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, "AVConferenceXPCServer [%s] %s:%d VCXPCServer: _xpc_add_connection_to_list PID %d", (uint8_t *)&v6, 0x22u);
      }
    }
    v5 = objc_alloc_init(VCXPCConnection);
    -[VCXPCConnection setConnection:](v5, "setConnection:", *(_QWORD *)(a1 + 40));
    -[VCXPCConnection setPid:](v5, "setPid:", xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 40)));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", v5);
    -[VCXPCConnection createTimeoutTimer](v5, "createTimeoutTimer");

  }
}

- (void)sendMessageAsync:(char *)a3 arguments:(id)a4
{
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  NSObject *clientConnectionsQueue;
  _QWORD v12[6];
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      v9 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          v14 = v7;
          v15 = 2080;
          v16 = "-[AVConferenceXPCServer sendMessageAsync:arguments:]";
          v17 = 1024;
          v18 = 369;
          v19 = 2080;
          v20 = a3;
          _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "AVConferenceXPCServer [%s] %s:%d VCXPCServer: preparing to send message to clients for service %s", buf, 0x26u);
        }
      }
      else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        -[AVConferenceXPCServer sendMessageAsync:arguments:].cold.1();
      }
    }
    v10 = -[AVConferenceXPCServer newXPCDictionaryFromNSDictionary:forEvent:](self, "newXPCDictionaryFromNSDictionary:forEvent:", a4, 0);
    xpc_dictionary_set_string(v10, "API", a3);
    clientConnectionsQueue = self->clientConnectionsQueue;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __52__AVConferenceXPCServer_sendMessageAsync_arguments___block_invoke;
    v12[3] = &unk_1E9E52238;
    v12[4] = self;
    v12[5] = v10;
    dispatch_sync(clientConnectionsQueue, v12);
  }
}

- (id)newXPCDictionaryFromNSDictionary:(id)a3 forEvent:(id)a4
{
  xpc_object_t reply;
  void *v6;
  void *v7;
  void *v8;

  if (a4)
    reply = xpc_dictionary_create_reply(a4);
  else
    reply = xpc_dictionary_create(0, 0, 0);
  v6 = reply;
  if (a3)
  {
    v7 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    if (v7)
    {
      v8 = v7;
      xpc_dictionary_set_value(v6, "RESULTS", v7);
      xpc_release(v8);
    }
  }
  return v6;
}

+ (id)AVConferenceXPCServerSingleton
{
  void *v3;

  v3 = (void *)objc_opt_class();
  objc_sync_enter(v3);
  if (!_xpcServerSingleton)
    _xpcServerSingleton = (uint64_t)objc_alloc_init((Class)a1);
  objc_sync_exit(v3);
  return (id)_xpcServerSingleton;
}

uint64_t __61__AVConferenceXPCServer__xpc_start_listening_for_connections__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_xpc_handle_incoming_request:", a2);
}

- (void)_xpc_handle_incoming_request:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  __int128 v7;
  const __CFAllocator *v8;
  __SecTask *v9;
  CFTypeRef v10;
  const void *v11;
  BOOL v12;
  CFTypeID v13;
  pid_t pid;
  uint64_t v15;
  NSObject *v16;
  CFErrorRef error;
  _QWORD handler[6];
  audit_token_t v19;
  uint8_t v20[4];
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  audit_token_t *v27;
  __int16 v28;
  pid_t v29;
  __int16 v30;
  const char *v31;
  audit_token_t buf[32];
  audit_token_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      buf[0].val[0] = 136315650;
      *(_QWORD *)&buf[0].val[1] = v5;
      LOWORD(buf[0].val[3]) = 2080;
      *(_QWORD *)((char *)&buf[0].val[3] + 2) = "-[AVConferenceXPCServer(XPCManagement) _xpc_handle_incoming_request:]";
      HIWORD(buf[0].val[5]) = 1024;
      buf[0].val[6] = 702;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVConferenceXPCServer [%s] %s:%d VCXPCServer: AVConferenceXPCServer _xpc_handle_connection incoming request", (uint8_t *)buf, 0x1Cu);
    }
  }
  if (MEMORY[0x1DF089754](a3) == MEMORY[0x1E0C812E0])
  {
    *(_QWORD *)&v7 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&v33.val[4] = v7;
    *(_OWORD *)v33.val = v7;
    error = 0;
    xpc_connection_get_audit_token();
    v8 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    buf[0] = v33;
    v9 = SecTaskCreateWithAuditToken(v8, buf);
    v10 = SecTaskCopyValueForEntitlement(v9, CFSTR("com.apple.videoconference.allow-conferencing"), &error);
    v11 = v10;
    if (v10)
      v12 = error == 0;
    else
      v12 = 0;
    if (v12 && (v13 = CFGetTypeID(v10), v13 == CFBooleanGetTypeID()) && CFBooleanGetValue((CFBooleanRef)v11))
    {
      if (v9)
        CFRelease(v9);
      CFRelease(v11);
      xpc_connection_set_target_queue((xpc_connection_t)a3, (dispatch_queue_t)self->incomingMessageQueue);
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __69__AVConferenceXPCServer_XPCManagement___xpc_handle_incoming_request___block_invoke;
      handler[3] = &unk_1E9E57078;
      handler[4] = self;
      handler[5] = a3;
      v19 = v33;
      xpc_connection_set_event_handler((xpc_connection_t)a3, handler);
      xpc_connection_resume((xpc_connection_t)a3);
    }
    else
    {
      pid = xpc_connection_get_pid((xpc_connection_t)a3);
      bzero((char *)buf[0].val + 3, 0x3FDuLL);
      memset(buf, 63, 3);
      proc_name(pid, buf, 0x400u);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v15 = VRTraceErrorLogLevelToCSTR();
        v16 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v20 = 136316418;
          v21 = v15;
          v22 = 2080;
          v23 = "-[AVConferenceXPCServer(XPCManagement) _xpc_handle_incoming_request:]";
          v24 = 1024;
          v25 = 723;
          v26 = 2080;
          v27 = buf;
          v28 = 1024;
          v29 = pid;
          v30 = 2080;
          v31 = "com.apple.videoconference.allow-conferencing";
          _os_log_error_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_ERROR, "AVConferenceXPCServer [%s] %s:%d Process %s (PID=%d) is missing entitlement %s, ignoring connection", v20, 0x36u);
        }
      }
      CFShow(v11);
      CFShow(error);
      if (v9)
        CFRelease(v9);
      if (v11)
        CFRelease(v11);
      if (error)
        CFRelease(error);
      xpc_connection_cancel((xpc_connection_t)a3);
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[AVConferenceXPCServer(XPCManagement) _xpc_handle_incoming_request:].cold.1();
  }
}

- (AVConferenceXPCServer)init
{
  AVConferenceXPCServer *v2;
  NSObject *CustomRootQueue;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)AVConferenceXPCServer;
  v2 = -[AVConferenceXPCServer init](&v5, sel_init);
  if (v2)
  {
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(47);
    v2->incomingMessageQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.AVConferenceXPCServer.incomingQueue", 0, CustomRootQueue);
    v2->outgoingMessageQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.AVConferenceXPCServer.outgoingQueue", 0, CustomRootQueue);
    v2->clientConnectionsQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.AVConferenceXPCServer.clientConnectionsQueue", MEMORY[0x1E0C80D50], CustomRootQueue);
    v2->clientConnections = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v2->registeredBlocks = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[AVConferenceXPCServer registerBlockForService:block:](v2, "registerBlockForService:block:", "pingServer", &__block_literal_global_67);
  }
  return v2;
}

uint64_t __29__AVConferenceXPCServer_init__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  int ErrorLogLevelForModule;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED"));
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v2)
  {
    if (ErrorLogLevelForModule >= 8)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      v6 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v11 = v4;
          v12 = 2080;
          v13 = "-[AVConferenceXPCServer init]_block_invoke";
          v14 = 1024;
          v15 = 305;
          _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, "AVConferenceXPCServer [%s] %s:%d VCXPCServer: Ping saw client death, ignored by ping", buf, 0x1Cu);
        }
      }
      else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        __29__AVConferenceXPCServer_init__block_invoke_cold_1();
      }
    }
    return 0;
  }
  else
  {
    if (ErrorLogLevelForModule >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v11 = v7;
        v12 = 2080;
        v13 = "-[AVConferenceXPCServer init]_block_invoke";
        v14 = 1024;
        v15 = 307;
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "AVConferenceXPCServer [%s] %s:%d VCXPCServer: Server was pinged successfully", buf, 0x1Cu);
      }
    }
    return objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", CFSTR("SUCCESS"), CFSTR("Ping"), 0);
  }
}

- (void)dealloc
{
  OS_xpc_object *listener;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  dispatch_release((dispatch_object_t)self->incomingMessageQueue);
  dispatch_release((dispatch_object_t)self->outgoingMessageQueue);
  dispatch_release((dispatch_object_t)self->clientConnectionsQueue);
  -[AVConferenceXPCServer _xpc_remove_connections_from_list](self, "_xpc_remove_connections_from_list");

  listener = self->listener;
  if (listener)
  {
    xpc_release(listener);
    self->listener = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)AVConferenceXPCServer;
  -[AVConferenceXPCServer dealloc](&v4, sel_dealloc);
}

- (AVConferenceXPCServer)allocWithZone:(_NSZone *)a3
{
  return (AVConferenceXPCServer *)_xpcServerSingleton;
}

- (unint64_t)retainCount
{
  return -1;
}

- (void)sendMessageAsync:(char *)a3 arguments:(id)a4 xpcArguments:(id)a5 context:(id)a6
{
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  NSObject *clientConnectionsQueue;
  _QWORD block[7];
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      v13 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          v18 = v11;
          v19 = 2080;
          v20 = "-[AVConferenceXPCServer sendMessageAsync:arguments:xpcArguments:context:]";
          v21 = 1024;
          v22 = 394;
          v23 = 2080;
          v24 = a3;
          _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, "AVConferenceXPCServer [%s] %s:%d VCXPCServer: preparing to send message to clients for service %s", buf, 0x26u);
        }
      }
      else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        -[AVConferenceXPCServer sendMessageAsync:arguments:xpcArguments:context:].cold.1();
      }
    }
    v14 = -[AVConferenceXPCServer newXPCDictionaryFromNSDictionary:forEvent:](self, "newXPCDictionaryFromNSDictionary:forEvent:", a4, 0);
    xpc_dictionary_set_string(v14, "API", a3);
    if (a5)
      xpc_dictionary_set_value(v14, "XPCARGUMENTS", a5);
    clientConnectionsQueue = self->clientConnectionsQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73__AVConferenceXPCServer_sendMessageAsync_arguments_xpcArguments_context___block_invoke;
    block[3] = &unk_1E9E527D0;
    block[4] = self;
    block[5] = a6;
    block[6] = v14;
    dispatch_sync(clientConnectionsQueue, block);
  }
}

void __73__AVConferenceXPCServer_sendMessageAsync_arguments_xpcArguments_context___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "_xpc_get_connection_from_list_for_context:", *(_QWORD *)(a1 + 40));
  if (v2)
    xpc_connection_send_message((xpc_connection_t)objc_msgSend(v2, "connection"), *(xpc_object_t *)(a1 + 48));
  xpc_release(*(xpc_object_t *)(a1 + 48));
}

- (void)sendMessageAsync:(char *)a3 arguments:(id)a4 context:(id)a5
{
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  NSObject *clientConnectionsQueue;
  _QWORD block[7];
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (a3 && a5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      v11 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          v16 = v9;
          v17 = 2080;
          v18 = "-[AVConferenceXPCServer sendMessageAsync:arguments:context:]";
          v19 = 1024;
          v20 = 421;
          v21 = 2080;
          v22 = a3;
          _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, "AVConferenceXPCServer [%s] %s:%d VCXPCServer: sending notification to client for service %s", buf, 0x26u);
        }
      }
      else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        -[AVConferenceXPCServer sendMessageAsync:arguments:context:].cold.1();
      }
    }
    v12 = -[AVConferenceXPCServer newXPCDictionaryFromNSDictionary:forEvent:](self, "newXPCDictionaryFromNSDictionary:forEvent:", a4, 0);
    xpc_dictionary_set_string(v12, "API", a3);
    clientConnectionsQueue = self->clientConnectionsQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__AVConferenceXPCServer_sendMessageAsync_arguments_context___block_invoke;
    block[3] = &unk_1E9E527D0;
    block[4] = self;
    block[5] = a5;
    block[6] = v12;
    dispatch_sync(clientConnectionsQueue, block);
  }
}

void __60__AVConferenceXPCServer_sendMessageAsync_arguments_context___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "_xpc_get_connection_from_list_for_context:", *(_QWORD *)(a1 + 40));
  if (v2)
    xpc_connection_send_message((xpc_connection_t)objc_msgSend(v2, "connection"), *(xpc_object_t *)(a1 + 48));
  xpc_release(*(xpc_object_t *)(a1 + 48));
}

- (void)sendMessageAsync:(char *)a3 arguments:(id)a4 toAllClientsWithContext:(id)a5
{
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  NSObject *clientConnectionsQueue;
  _QWORD block[7];
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (a3 && a5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      v11 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          v16 = v9;
          v17 = 2080;
          v18 = "-[AVConferenceXPCServer sendMessageAsync:arguments:toAllClientsWithContext:]";
          v19 = 1024;
          v20 = 446;
          v21 = 2080;
          v22 = a3;
          _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, "AVConferenceXPCServer [%s] %s:%d VCXPCServer: sending notification to all clients for service %s", buf, 0x26u);
        }
      }
      else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        -[AVConferenceXPCServer sendMessageAsync:arguments:toAllClientsWithContext:].cold.1();
      }
    }
    v12 = -[AVConferenceXPCServer newXPCDictionaryFromNSDictionary:forEvent:](self, "newXPCDictionaryFromNSDictionary:forEvent:", a4, 0);
    xpc_dictionary_set_string(v12, "API", a3);
    clientConnectionsQueue = self->clientConnectionsQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __76__AVConferenceXPCServer_sendMessageAsync_arguments_toAllClientsWithContext___block_invoke;
    block[3] = &unk_1E9E527D0;
    block[4] = self;
    block[5] = a5;
    block[6] = v12;
    dispatch_sync(clientConnectionsQueue, block);
  }
}

void __76__AVConferenceXPCServer_sendMessageAsync_arguments_toAllClientsWithContext___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE v9[128];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "_xpc_get_connections_from_list_for_context:", *(_QWORD *)(a1 + 40));
  if ((unint64_t)objc_msgSend(v2, "count") >= 2 && (int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v15 = v3;
      v16 = 2080;
      v17 = "-[AVConferenceXPCServer sendMessageAsync:arguments:toAllClientsWithContext:]_block_invoke";
      v18 = 1024;
      v19 = 459;
      v20 = 2048;
      v21 = objc_msgSend(v2, "count");
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "AVConferenceXPCServer [%s] %s:%d VCXPCServer: XPC connectionsToUse count =%lu", buf, 0x26u);
    }
  }
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v2);
        xpc_connection_send_message((xpc_connection_t)objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "connection"), *(xpc_object_t *)(a1 + 48));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
    }
    while (v6);
  }
  xpc_release(*(xpc_object_t *)(a1 + 48));
}

- (void)registerBlockForService:(const char *)a3 block:(id)a4
{
  -[AVConferenceXPCServer registerBlockForService:block:queue:](self, "registerBlockForService:block:queue:", a3, a4, 0);
}

- (void)registerBlockForService:(const char *)a3 block:(id)a4 queue:(id)a5
{
  -[AVConferenceXPCServer registerBlockForService:block:queue:eventLogLevel:](self, "registerBlockForService:block:queue:eventLogLevel:", a3, a4, a5, 7);
}

- (void)registerBlockForService:(const char *)a3 block:(id)a4 queue:(id)global_queue eventLogLevel:(int)a6
{
  uint64_t v7;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSMutableDictionary *registeredBlocks;
  VCXPCServerUser *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (a3 && a4)
  {
    v7 = *(_QWORD *)&a6;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v17 = 136315906;
        v18 = v11;
        v19 = 2080;
        v20 = "-[AVConferenceXPCServer registerBlockForService:block:queue:eventLogLevel:]";
        v21 = 1024;
        v22 = 482;
        v23 = 2080;
        v24 = a3;
        _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, "AVConferenceXPCServer [%s] %s:%d VCXPCServer: Adding registered block for service %s", (uint8_t *)&v17, 0x26u);
      }
    }
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", a3, 4);
    v14 = (void *)objc_msgSend(a4, "copy");
    if (!global_queue)
      global_queue = dispatch_get_global_queue(2, 0);
    registeredBlocks = self->registeredBlocks;
    objc_sync_enter(registeredBlocks);
    v16 = (VCXPCServerUser *)-[NSMutableDictionary objectForKeyedSubscript:](self->registeredBlocks, "objectForKeyedSubscript:", v13);
    if (!v16)
    {
      v16 = objc_alloc_init(VCXPCServerUser);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->registeredBlocks, "setObject:forKeyedSubscript:", v16, v13);

    }
    -[VCXPCServerUser setBlock:](v16, "setBlock:", v14);
    -[VCXPCServerUser setQueue:](v16, "setQueue:", global_queue);
    -[VCXPCServerUser setEventLogLevel:](v16, "setEventLogLevel:", v7);
    objc_sync_exit(registeredBlocks);

  }
}

- (void)deregisterFromService:(const char *)a3
{
  uint64_t v5;
  NSObject *v6;
  void *v7;
  NSMutableDictionary *registeredBlocks;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v9 = 136315906;
        v10 = v5;
        v11 = 2080;
        v12 = "-[AVConferenceXPCServer deregisterFromService:]";
        v13 = 1024;
        v14 = 517;
        v15 = 2080;
        v16 = a3;
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVConferenceXPCServer [%s] %s:%d VCXPCServer: Removing registered block for service %s", (uint8_t *)&v9, 0x26u);
      }
    }
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", a3, 4);
    registeredBlocks = self->registeredBlocks;
    objc_sync_enter(registeredBlocks);
    -[NSMutableDictionary removeObjectForKey:](self->registeredBlocks, "removeObjectForKey:", v7);
    objc_sync_exit(registeredBlocks);

  }
}

- (id)newNSErrorFromNSDictionary:(id)a3
{
  if (a3)
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ERROR_DOMAIN")), (int)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ERROR_CODE")), "intValue"), objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ERROR_USERINFO")));
  else
    return 0;
}

- (id)newNSDictionaryFromNSError:(id)a3
{
  void *v4;
  void *v5;

  if (!a3)
    return 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", objc_msgSend(a3, "code"));
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", objc_msgSend(a3, "domain"), CFSTR("ERROR_DOMAIN"), v4, CFSTR("ERROR_CODE"), objc_msgSend(a3, "userInfo"), CFSTR("ERROR_USERINFO"), 0);

  return v5;
}

- (id)newNSDictionaryWidthNSDictionary:(id)a3
{
  void *v4;
  _QWORD v6[6];
  _QWORD v7[3];
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x2020000000;
  v8 = 0;
  v4 = (void *)objc_opt_new();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__AVConferenceXPCServer_newNSDictionaryWidthNSDictionary___block_invoke;
  v6[3] = &unk_1E9E57000;
  v6[4] = v4;
  v6[5] = v7;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v6);
  _Block_object_dispose(v7, 8);
  return v4;
}

uint64_t __58__AVConferenceXPCServer_newNSDictionaryWidthNSDictionary___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a2, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("k_%d"), *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)));
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(unsigned int *)(v7 + 24);
  *(_DWORD *)(v7 + 24) = v8 + 1;
  return objc_msgSend(v6, "setObject:forKeyedSubscript:", a3, objc_msgSend(v5, "stringWithFormat:", CFSTR("v_%d"), v8));
}

- (id)newClientDiedDictionary
{
  id v2;

  v2 = objc_alloc(MEMORY[0x1E0C99E08]);
  return (id)objc_msgSend(v2, "initWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0C99E38], "null"), CFSTR("CLIENTDIED"), 0);
}

- (void)_xpc_start_listening_for_connections
{
  const char *v3;
  uint64_t v4;
  NSObject *v5;
  OS_xpc_object *listener;
  OS_xpc_object *v7;
  _QWORD handler[5];
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  OS_xpc_object *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (AVConferenceServer_ProcessIsAVConferenceServer())
    v3 = "com.apple.videoconference.camera";
  else
    v3 = "com.apple.avconference.xpc";
  self->listener = xpc_connection_create_mach_service(v3, (dispatch_queue_t)self->incomingMessageQueue, 1uLL);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      listener = self->listener;
      *(_DWORD *)buf = 136316162;
      v10 = v4;
      v11 = 2080;
      v12 = "-[AVConferenceXPCServer _xpc_start_listening_for_connections]";
      v13 = 1024;
      v14 = 648;
      v15 = 2080;
      v16 = v3;
      v17 = 2048;
      v18 = listener;
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, "AVConferenceXPCServer [%s] %s:%d name=%s, listener=%p", buf, 0x30u);
    }
  }
  v7 = self->listener;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __61__AVConferenceXPCServer__xpc_start_listening_for_connections__block_invoke;
  handler[3] = &unk_1E9E561E0;
  handler[4] = self;
  xpc_connection_set_event_handler(v7, handler);
  xpc_connection_resume(self->listener);
}

- (id)authorizedTokenData
{
  NSObject *clientConnectionsQueue;
  void *v3;
  _QWORD block[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__28;
  v10 = __Block_byref_object_dispose__28;
  v11 = 0;
  clientConnectionsQueue = self->clientConnectionsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__AVConferenceXPCServer_authorizedTokenData__block_invoke;
  block[3] = &unk_1E9E522B0;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(clientConnectionsQueue, block);
  v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __44__AVConferenceXPCServer_authorizedTokenData__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _BYTE v8[128];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v10;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v6);
        if (objc_msgSend(v7, "tokenData"))
        {
          result = objc_msgSend(v7, "tokenData");
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
          return result;
        }
        ++v6;
      }
      while (v4 != v6);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
      v4 = result;
      if (result)
        continue;
      break;
    }
  }
  return result;
}

+ (BOOL)clientWithToken:(id *)a3 hasEntitlement:(id)a4
{
  const __CFAllocator *v6;
  __int128 v7;
  __SecTask *v8;
  CFTypeRef v9;
  BOOL v10;
  BOOL v11;
  CFErrorRef error;
  audit_token_t token;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a4, "length"))
    return 0;
  error = 0;
  v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v7 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)token.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&token.val[4] = v7;
  v8 = SecTaskCreateWithAuditToken(v6, &token);
  v9 = SecTaskCopyValueForEntitlement(v8, (CFStringRef)a4, &error);
  if (v9)
    v10 = error == 0;
  else
    v10 = 0;
  v11 = v10;
  if (v9)
    CFRelease(v9);
  if (v8)
    CFRelease(v8);
  return v11;
}

- (OS_xpc_object)listener
{
  return self->listener;
}

- (NSMutableDictionary)registeredBlocks
{
  return self->registeredBlocks;
}

void __69__AVConferenceXPCServer_XPCManagement___xpc_handle_incoming_request___block_invoke_188(uint64_t a1)
{
  int ErrorLogLevelForModule;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  _QWORD v19[11];
  _QWORD block[6];
  _BYTE buf[12];
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if ((int)objc_msgSend(*(id *)(a1 + 32), "eventLogLevel") > ErrorLogLevelForModule
    || (int)objc_msgSend(*(id *)(a1 + 32), "eventLogLevel") < 1)
  {
    goto LABEL_21;
  }
  objc_msgSend(*(id *)(a1 + 32), "eventLogLevel");
  v3 = VRTraceErrorLogLevelToCSTR();
  if ((int)objc_msgSend(*(id *)(a1 + 32), "eventLogLevel") > 2)
  {
    if ((int)objc_msgSend(*(id *)(a1 + 32), "eventLogLevel") <= 4)
    {
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_21;
      goto LABEL_6;
    }
    if ((int)objc_msgSend(*(id *)(a1 + 32), "eventLogLevel") >= 8)
    {
      if ((int)objc_msgSend(*(id *)(a1 + 32), "eventLogLevel") > 8)
        goto LABEL_21;
      v4 = *MEMORY[0x1E0CF2758];
      v5 = *MEMORY[0x1E0CF2758];
      if (!*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
          __69__AVConferenceXPCServer_XPCManagement___xpc_handle_incoming_request___block_invoke_188_cold_4();
        goto LABEL_21;
      }
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        goto LABEL_21;
    }
    else
    {
      v4 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_21;
    }
    v6 = *(_QWORD *)(a1 + 80);
    v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
    v8 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 136316418;
    *(_QWORD *)&buf[4] = v3;
    v22 = 2080;
    v23 = "-[AVConferenceXPCServer(XPCManagement) _xpc_handle_incoming_request:]_block_invoke";
    v24 = 1024;
    v25 = 803;
    v26 = 2112;
    v27 = v7;
    v28 = 2048;
    v29 = v6;
    v30 = 2048;
    v31 = v8;
    _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "AVConferenceXPCServer [%s] %s:%d VCXPCServer: executing registered block for service %@, block %p, queue %p", buf, 0x3Au);
    goto LABEL_21;
  }
  if ((VRTraceIsOSFaultDisabled() & 1) != 0)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
LABEL_6:
      __69__AVConferenceXPCServer_XPCManagement___xpc_handle_incoming_request___block_invoke_188_cold_1();
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
  {
    __69__AVConferenceXPCServer_XPCManagement___xpc_handle_incoming_request___block_invoke_188_cold_2();
  }
LABEL_21:
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "setLastCalledApiName:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "startTimeoutTimer");
  *(_QWORD *)buf = 0;
  v9 = (void *)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "stopTimeoutTimer");
  v10 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
  v11 = objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
  v12 = MEMORY[0x1E0C809B0];
  if (v11 && v11 != objc_msgSend(MEMORY[0x1E0C99E38], "null"))
  {
    v13 = *(NSObject **)(*(_QWORD *)(a1 + 56) + 48);
    block[0] = v12;
    block[1] = 3221225472;
    block[2] = __69__AVConferenceXPCServer_XPCManagement___xpc_handle_incoming_request___block_invoke_189;
    block[3] = &unk_1E9E52938;
    v14 = *(_QWORD *)(a1 + 96);
    block[4] = v11;
    block[5] = v14;
    dispatch_barrier_sync(v13, block);
  }
  xpc_retain(*(xpc_object_t *)(a1 + 64));
  v15 = *(_QWORD *)(a1 + 56);
  v16 = *(_QWORD *)(a1 + 64);
  v17 = *(NSObject **)(v15 + 40);
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __69__AVConferenceXPCServer_XPCManagement___xpc_handle_incoming_request___block_invoke_2_190;
  v19[3] = &unk_1E9E57028;
  v19[4] = v16;
  v19[5] = v9;
  v19[6] = *(_QWORD *)buf;
  v19[7] = v11;
  v18 = *(_QWORD *)(a1 + 72);
  v19[8] = v15;
  v19[9] = v18;
  v19[10] = *(_QWORD *)(a1 + 96);
  dispatch_async(v17, v19);
  xpc_release(*(xpc_object_t *)(a1 + 64));

}

uint64_t __69__AVConferenceXPCServer_XPCManagement___xpc_handle_incoming_request___block_invoke_189(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setContext:", *(_QWORD *)(a1 + 32));
}

void __69__AVConferenceXPCServer_XPCManagement___xpc_handle_incoming_request___block_invoke_2_190(uint64_t a1)
{
  const char *string;
  _BOOL4 v3;
  _BOOL4 v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  string = xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 32), "API");
  v3 = xpc_dictionary_get_BOOL(*(xpc_object_t *)(a1 + 32), "EXPECTSREPLY");
  v4 = v3;
  if (*(_QWORD *)(a1 + 40) || (*(_QWORD *)(a1 + 48) ? (v5 = 1) : (v5 = v3), v5 == 1))
  {
    v6 = *(_QWORD *)(a1 + 56);
    v7 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v8, "removeObjectForKey:", CFSTR("CONTEXT"));
    if (*(_QWORD *)(a1 + 48))
    {
      v9 = (void *)objc_msgSend(*(id *)(a1 + 64), "newNSDictionaryFromNSError:");
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("ERROR"));

    }
    if (v4)
      v10 = *(_QWORD *)(a1 + 32);
    else
      v10 = 0;
    v11 = (void *)objc_msgSend(*(id *)(a1 + 64), "newXPCDictionaryFromNSDictionary:forEvent:", v8, v10);
    xpc_dictionary_set_string(v11, "API", string);
    if (objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("USERXPCARGUMENTS")))
      xpc_dictionary_set_value(v11, "XPCARGUMENTS", (xpc_object_t)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("USERXPCARGUMENTS")));
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 72), v11);
    if (v6 == v7)
      objc_msgSend(*(id *)(a1 + 64), "_xpc_remove_connection_from_list:", *(_QWORD *)(a1 + 72));

    xpc_release(v11);
    v12 = *(void **)(a1 + 40);
  }
  else
  {
    v12 = 0;
  }

  xpc_release(*(xpc_object_t *)(a1 + 32));
}

uint64_t __69__AVConferenceXPCServer_XPCManagement___xpc_handle_incoming_request___block_invoke_195(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_xpc_get_connection_from_list_for_connection:", *(_QWORD *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = result;
  return result;
}

void __69__AVConferenceXPCServer_XPCManagement___xpc_handle_incoming_request___block_invoke_197(uint64_t a1)
{

}

- (void)_xpc_remove_connection_from_list:(id)a3
{
  NSObject *clientConnectionsQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    clientConnectionsQueue = self->clientConnectionsQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73__AVConferenceXPCServer_XPCManagement___xpc_remove_connection_from_list___block_invoke;
    block[3] = &unk_1E9E52238;
    block[4] = self;
    block[5] = a3;
    dispatch_barrier_sync(clientConnectionsQueue, block);
  }
}

uint64_t __73__AVConferenceXPCServer_XPCManagement___xpc_remove_connection_from_list___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  pid_t pid;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  pid_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(a1 + 32), "_xpc_get_connection_from_list_for_connection:", *(_QWORD *)(a1 + 40));
  if (result)
  {
    v3 = result;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        pid = xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 40));
        v7 = 136315906;
        v8 = v4;
        v9 = 2080;
        v10 = "-[AVConferenceXPCServer(XPCManagement) _xpc_remove_connection_from_list:]_block_invoke";
        v11 = 1024;
        v12 = 987;
        v13 = 1024;
        v14 = pid;
        _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, "AVConferenceXPCServer [%s] %s:%d VCXPCServer: _xpc_remove_connection_from_list PID %d", (uint8_t *)&v7, 0x22u);
      }
    }
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", v3);
  }
  return result;
}

- (void)_xpc_remove_connections_from_list
{
  uint64_t v3;
  NSObject *v4;
  NSObject *clientConnectionsQueue;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v8 = v3;
      v9 = 2080;
      v10 = "-[AVConferenceXPCServer(XPCManagement) _xpc_remove_connections_from_list]";
      v11 = 1024;
      v12 = 994;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "AVConferenceXPCServer [%s] %s:%d ", buf, 0x1Cu);
    }
  }
  clientConnectionsQueue = self->clientConnectionsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__AVConferenceXPCServer_XPCManagement___xpc_remove_connections_from_list__block_invoke;
  block[3] = &unk_1E9E521C0;
  block[4] = self;
  dispatch_barrier_sync(clientConnectionsQueue, block);
}

uint64_t __73__AVConferenceXPCServer_XPCManagement___xpc_remove_connections_from_list__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAllObjects");
}

- (id)_xpc_get_connection_from_list_for_context:(id)a3
{
  NSMutableArray *clientConnections;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _BYTE v12[128];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->clientConnectionsQueue);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  clientConnections = self->clientConnections;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](clientConnections, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
  if (!v6)
    return 0;
  v7 = v6;
  v8 = *(_QWORD *)v14;
LABEL_3:
  v9 = 0;
  while (1)
  {
    if (*(_QWORD *)v14 != v8)
      objc_enumerationMutation(clientConnections);
    v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
    if ((objc_msgSend(a3, "isEqual:", objc_msgSend(v10, "context")) & 1) != 0)
      return v10;
    if (v7 == ++v9)
    {
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](clientConnections, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
      if (v7)
        goto LABEL_3;
      return 0;
    }
  }
}

- (id)_xpc_get_connections_from_list_for_context:(id)a3
{
  id v5;
  NSMutableArray *clientConnections;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  _BYTE v14[128];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->clientConnectionsQueue);
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  clientConnections = self->clientConnections;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](clientConnections, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(clientConnections);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(a3, "isEqual:", objc_msgSend(v11, "context")))
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](clientConnections, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
    }
    while (v8);
  }
  v12 = (void *)objc_msgSend(v5, "copy");

  return v12;
}

void __29__AVConferenceXPCServer_init__block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  int v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  v2 = 305;
  _os_log_debug_impl(&dword_1D8A54000, v0, OS_LOG_TYPE_DEBUG, "AVConferenceXPCServer [%s] %s:%d VCXPCServer: Ping saw client death, ignored by ping", v1, 0x1Cu);
  OUTLINED_FUNCTION_3();
}

- (void)sendMessageAsync:arguments:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  const char *v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7_12();
  OUTLINED_FUNCTION_7_4(&dword_1D8A54000, v0, v1, "AVConferenceXPCServer [%s] %s:%d VCXPCServer: preparing to send message to clients for service %s", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)sendMessageAsync:arguments:xpcArguments:context:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  const char *v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7_12();
  OUTLINED_FUNCTION_7_4(&dword_1D8A54000, v0, v1, "AVConferenceXPCServer [%s] %s:%d VCXPCServer: preparing to send message to clients for service %s", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)sendMessageAsync:arguments:context:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  const char *v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7_12();
  OUTLINED_FUNCTION_7_4(&dword_1D8A54000, v0, v1, "AVConferenceXPCServer [%s] %s:%d VCXPCServer: sending notification to client for service %s", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)sendMessageAsync:arguments:toAllClientsWithContext:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  const char *v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7_12();
  OUTLINED_FUNCTION_7_4(&dword_1D8A54000, v0, v1, "AVConferenceXPCServer [%s] %s:%d VCXPCServer: sending notification to all clients for service %s", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __69__AVConferenceXPCServer_XPCManagement___xpc_handle_incoming_request___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136315906;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2080;
  *(_QWORD *)(buf + 14) = "-[AVConferenceXPCServer(XPCManagement) _xpc_handle_incoming_request:]_block_invoke";
  *((_WORD *)buf + 11) = 1024;
  *((_DWORD *)buf + 6) = 904;
  *((_WORD *)buf + 14) = 2080;
  *(_QWORD *)(buf + 30) = a2;
  _os_log_error_impl(&dword_1D8A54000, log, OS_LOG_TYPE_ERROR, "AVConferenceXPCServer [%s] %s:%d VCXPCServer: XPC Error, %s", buf, 0x26u);
}

void __69__AVConferenceXPCServer_XPCManagement___xpc_handle_incoming_request___block_invoke_188_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_7(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_5_12();
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_10_15(&dword_1D8A54000, v0, v1, "AVConferenceXPCServer [%s] %s:%d VCXPCServer: executing registered block for service %@, block %p, queue %p");
  OUTLINED_FUNCTION_14_3();
}

void __69__AVConferenceXPCServer_XPCManagement___xpc_handle_incoming_request___block_invoke_188_cold_2()
{
  os_log_t v0;
  uint8_t v1[72];

  OUTLINED_FUNCTION_3_7(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_5_12();
  OUTLINED_FUNCTION_0_5();
  _os_log_fault_impl(&dword_1D8A54000, v0, OS_LOG_TYPE_FAULT, "AVConferenceXPCServer [%s] %s:%d VCXPCServer: executing registered block for service %@, block %p, queue %p", v1, 0x3Au);
  OUTLINED_FUNCTION_14_3();
}

void __69__AVConferenceXPCServer_XPCManagement___xpc_handle_incoming_request___block_invoke_188_cold_4()
{
  os_log_t v0;
  uint8_t v1[72];

  OUTLINED_FUNCTION_3_7(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_5_12();
  OUTLINED_FUNCTION_0_5();
  _os_log_debug_impl(&dword_1D8A54000, v0, OS_LOG_TYPE_DEBUG, "AVConferenceXPCServer [%s] %s:%d VCXPCServer: executing registered block for service %@, block %p, queue %p", v1, 0x3Au);
  OUTLINED_FUNCTION_14_3();
}

@end
