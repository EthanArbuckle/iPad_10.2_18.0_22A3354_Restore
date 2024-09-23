@implementation NetworkUtils

+ (BOOL)createAndStartListener:(id *)a3 withParameters:(id)a4
{
  NSObject *v5;
  NSObject *global_queue;
  NSObject *v7;
  dispatch_time_t v8;
  BOOL v9;
  _QWORD v11[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v5 = nw_listener_create((nw_parameters_t)a4);
  if (!v5)
    goto LABEL_6;
  global_queue = dispatch_get_global_queue(0, 0);
  nw_listener_set_queue(v5, global_queue);
  nw_listener_set_new_connection_handler(v5, &__block_literal_global_89);
  v7 = dispatch_semaphore_create(0);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __54__NetworkUtils_createAndStartListener_withParameters___block_invoke_2;
  v11[3] = &unk_1E9E57CC0;
  v11[5] = v5;
  v11[6] = &v12;
  v11[4] = v7;
  MEMORY[0x1DF088830](v5, v11);
  nw_listener_start(v5);
  v8 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v7, v8))
    goto LABEL_6;
  if (*((_BYTE *)v13 + 24))
  {
    *a3 = v5;
    v9 = 1;
    v5 = 0;
  }
  else
  {
LABEL_6:
    v9 = 0;
  }
  nw_release(v5);
  _Block_object_dispose(&v12, 8);
  return v9;
}

void __54__NetworkUtils_createAndStartListener_withParameters___block_invoke(uint64_t a1, NSObject *a2)
{
  NSLog(CFSTR("Unexpected connection callback"));
  nw_connection_cancel(a2);
}

void __54__NetworkUtils_createAndStartListener_withParameters___block_invoke_2(uint64_t a1, int a2, uint64_t a3)
{
  if (a2 == 3 || a3)
  {
LABEL_6:
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    return;
  }
  if (a2 != 4)
  {
    if (a2 != 2)
      return;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    goto LABEL_6;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  nw_release(*(void **)(a1 + 40));
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
}

+ (void)setUniquePIDOnParameters:(id)a3 shouldRunInProcess:(BOOL)a4
{
  id v4;
  pid_t v5;
  _OWORD v6[3];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    v4 = +[AVCDaemonProcessInfo getDaemonProcessInfo](AVCDaemonProcessInfo, "getDaemonProcessInfo", a3);
    if (!v4)
      return;
    objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("avcKeyDaemonProcessInfoUniquePID")), "longLongValue");
  }
  else
  {
    v7 = 0;
    memset(v6, 0, sizeof(v6));
    v5 = getpid();
    proc_pidinfo(v5, 17, 1uLL, v6, 56);
  }
  nw_parameters_set_delegated_unique_pid();
}

+ (BOOL)createNWPathEvaluator:(id *)a3 withIPAddress:(id)a4 localPort:(int *)a5 remotePort:(int)a6 shouldRunInProcess:(BOOL)a7 useBackingSocket:(BOOL)a8
{
  _BOOL8 v8;
  NSObject *legacy_tcp_socket;
  NSObject *v14;
  NSObject *v15;
  NSObject *options;
  int port;
  NSObject *host_with_numeric_port;
  void *v19;
  void *evaluator_for_endpoint;
  BOOL v21;
  nw_listener_t listener;
  uint64_t v24;

  v8 = a7;
  v24 = *MEMORY[0x1E0C80C00];
  listener = 0;
  if (a8)
    legacy_tcp_socket = nw_parameters_create_legacy_tcp_socket();
  else
    legacy_tcp_socket = nw_parameters_create();
  v14 = legacy_tcp_socket;
  if (legacy_tcp_socket)
  {
    v15 = nw_parameters_copy_default_protocol_stack(legacy_tcp_socket);
    if (v15)
    {
      options = nw_udp_create_options();
      if (options)
      {
        nw_udp_options_set_no_metadata();
        nw_protocol_stack_set_transport_protocol(v15, options);
        nw_parameters_set_reuse_local_address(v14, 1);
        nw_parameters_set_disable_listener_datapath();
        +[VCVTPWrapper connectionContext](VCVTPWrapper, "connectionContext");
        nw_parameters_set_context();
        if (a5 && *a5 != -1)
          goto LABEL_14;
        if (objc_msgSend(a1, "createAndStartListener:withParameters:", &listener, v14))
        {
          port = nw_listener_get_port(listener);
          if (a5 && port)
          {
            *a5 = port;
LABEL_14:
            objc_msgSend(a4, "UTF8String", listener, v24);
            host_with_numeric_port = nw_endpoint_create_host_with_numeric_port();
            if (host_with_numeric_port)
            {
              nw_parameters_set_local_endpoint(v14, host_with_numeric_port);
              objc_msgSend(a1, "setUniquePIDOnParameters:shouldRunInProcess:", v14, v8);
              if (a5)
              {
                objc_msgSend(a4, "UTF8String");
                v19 = (void *)nw_endpoint_create_host_with_numeric_port();
                if (!v19)
                {
LABEL_26:
                  v21 = 0;
                  goto LABEL_21;
                }
              }
              else
              {
                v19 = 0;
              }
              evaluator_for_endpoint = (void *)nw_path_create_evaluator_for_endpoint();
              if (evaluator_for_endpoint)
              {
                *a3 = evaluator_for_endpoint;
                nw_listener_cancel(listener);
                listener = 0;
                v21 = 1;
                goto LABEL_21;
              }
              goto LABEL_26;
            }
            v21 = 0;
LABEL_25:
            v19 = 0;
            goto LABEL_21;
          }
          if (port)
            goto LABEL_14;
        }
      }
      v21 = 0;
      host_with_numeric_port = 0;
      goto LABEL_25;
    }
    v21 = 0;
    host_with_numeric_port = 0;
    v19 = 0;
  }
  else
  {
    v21 = 0;
    host_with_numeric_port = 0;
    v19 = 0;
    v15 = 0;
  }
  options = 0;
LABEL_21:
  nw_release(v15);
  nw_release(options);
  nw_release(host_with_numeric_port);
  nw_release(v19);
  nw_release(v14);
  nw_release(0);
  if (listener)
    nw_release(listener);
  return v21;
}

+ (id)newNWConnectionWithIPAddress:(id)a3 srcPort:(signed __int16)a4
{
  uint64_t v4;
  NSObject *secure_udp;
  NSObject *v6;
  void *v7;

  v4 = objc_msgSend(a1, "connectedSocketWithIPAddress:srcPort:error:", a3, a4, 0);
  if ((_DWORD)v4 == -1)
  {
    v7 = 0;
    v6 = 0;
  }
  else
  {
    secure_udp = nw_parameters_create_secure_udp((nw_parameters_configure_protocol_block_t)*MEMORY[0x1E0CCED20], (nw_parameters_configure_protocol_block_t)*MEMORY[0x1E0CCED18]);
    v6 = secure_udp;
    if (secure_udp)
    {
      nw_parameters_set_reuse_local_address(secure_udp, 1);
      v7 = (void *)nw_connection_create_with_connected_socket_and_parameters();
    }
    else
    {
      v7 = 0;
    }
  }
  VCCloseSocketIfValid(v4);
  nw_release(v6);
  return v7;
}

+ (int)socketWithIPAddress:(id)a3 srcPort:(signed __int16)a4 error:(id *)a5
{
  return +[NetworkUtils socketWithIPAddress:srcPort:shouldConnect:error:](NetworkUtils, "socketWithIPAddress:srcPort:shouldConnect:error:", a3, a4, 0, a5);
}

+ (int)connectedSocketWithIPAddress:(id)a3 srcPort:(signed __int16)a4 error:(id *)a5
{
  return +[NetworkUtils socketWithIPAddress:srcPort:shouldConnect:error:](NetworkUtils, "socketWithIPAddress:srcPort:shouldConnect:error:", a3, a4, 1, a5);
}

+ (int)nonConnectedSocketWithIPAddress:(id)a3 srcPort:(signed __int16)a4 error:(id *)a5
{
  return +[NetworkUtils socketWithIPAddress:srcPort:shouldConnect:error:](NetworkUtils, "socketWithIPAddress:srcPort:shouldConnect:error:", a3, a4, 0, a5);
}

+ (int)socketWithIPAddress:(id)a3 srcPort:(signed __int16)a4 shouldConnect:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v6;
  unsigned int v7;
  int v9;
  int v10;
  const char *v11;
  int v13;
  sockaddr v14;
  uint64_t v15;

  v6 = a5;
  v7 = a4;
  v15 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v14.sa_len = 0;
  *(_QWORD *)&v14.sa_data[6] = 0;
  v9 = socket(2, 2, 0);
  if (v9 < 0)
  {
    perror("cannot create socket");
    return -1;
  }
  v10 = v9;
  v13 = 1;
  setsockopt(v9, 0xFFFF, 512, &v13, 4u);
  v14.sa_family = 2;
  *(_DWORD *)&v14.sa_data[2] = inet_addr((const char *)objc_msgSend(a3, "UTF8String"));
  *(_WORD *)v14.sa_data = bswap32(v7) >> 16;
  if (bind(v10, &v14, 0x10u) < 0)
  {
    v11 = "bind failed";
    goto LABEL_8;
  }
  if (v6 && connect(v10, &v14, 0x10u) < 0)
  {
    v11 = "connect failed";
LABEL_8:
    perror(v11);
    close(v10);
    return -1;
  }
  return v10;
}

+ (id)newRTPSocketDictionary:(BOOL)a3 rtpSourcePort:(signed __int16)a4
{
  _BOOL4 v5;
  int v6;
  int v7;
  xpc_object_t v8;
  void *v9;
  int v10;
  _QWORD v12[2];

  v5 = a3;
  v12[1] = *MEMORY[0x1E0C80C00];
  v12[0] = 0;
  v6 = +[NetworkUtils socketWithIPAddress:srcPort:error:](NetworkUtils, "socketWithIPAddress:srcPort:error:", CFSTR("127.0.0.1"), a4, v12);
  if (v6 < 0)
  {
    perror("rtp socket creation failed");
    return 0;
  }
  v7 = v6;
  v8 = xpc_dictionary_create(0, 0, 0);
  v9 = v8;
  if (!v5)
  {
    v10 = +[NetworkUtils socketWithIPAddress:srcPort:error:](NetworkUtils, "socketWithIPAddress:srcPort:error:", CFSTR("127.0.0.1"), (__int16)(a4 + 1), v12);
    if ((v10 & 0x80000000) == 0)
    {
      xpc_dictionary_set_fd(v9, "avcKeyRTPSocket", v7);
      xpc_dictionary_set_fd(v9, "avcKeyRTCPSocket", v10);
      close(v10);
      goto LABEL_6;
    }
    perror("rtcp socket creation failed");
    xpc_release(v9);
    close(v10);
    close(v7);
    return 0;
  }
  xpc_dictionary_set_fd(v8, "avcKeySharedSocket", v7);
LABEL_6:
  close(v7);
  return v9;
}

+ (id)securityKeyMaterialWithMediaKeyIndex:(id)a3
{
  return +[NetworkUtils securityKeyMaterialWithMediaKeyIndex:participantID:](NetworkUtils, "securityKeyMaterialWithMediaKeyIndex:participantID:", a3, 0);
}

+ (id)securityKeyMaterialWithMediaKeyIndex:(id)a3 participantID:(id)a4
{
  id v4;
  id v5;
  uint64_t v6;
  _QWORD v8[5];
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v4 = +[NetworkUtils newEncryptionInfoWithMediaKeyIndex:participantID:](NetworkUtils, "newEncryptionInfoWithMediaKeyIndex:participantID:", a3, a4);
  v8[0] = CFSTR("SecurityKey");
  v9[0] = objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D340C8]);
  v8[1] = CFSTR("SecuritySalt");
  v9[1] = objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D340D0]);
  v8[2] = CFSTR("SecurityKeyIndex");
  v9[2] = objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D340C0]);
  v8[3] = CFSTR("SecurityKeySetTime");
  v9[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", micro());
  v8[4] = CFSTR("SecurityLocallyGenerated");
  v9[4] = objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D340B8]);
  v5 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 5), "mutableCopy");
  v6 = objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D340D8]);
  if (v6)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("SecurityIDSParticipantID"));

  return v5;
}

+ (id)newEncryptionInfoWithMediaKeyIndex:(id)a3 participantID:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[5];

  v12[4] = *MEMORY[0x1E0C80C00];
  memset(v12, 170, 32);
  HexToByte(&v12[2], 16, "00110011", 32);
  HexToByte(v12, 16, "11100010", 32);
  v6 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v12[2], 16);
  v7 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v12, 16);
  v8 = objc_alloc(MEMORY[0x1E0C99E08]);
  v9 = (void *)objc_msgSend(v8, "initWithObjectsAndKeys:", v6, *MEMORY[0x1E0D340C8], v7, *MEMORY[0x1E0D340D0], a3, *MEMORY[0x1E0D340C0], MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D340B8], 0);
  v10 = v9;
  if (a4)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", a4, *MEMORY[0x1E0D340D8]);
  return v10;
}

+ (id)encryptionInfoForKey:(unint64_t)a3
{
  if (encryptionInfoForKey__once != -1)
    dispatch_once(&encryptionInfoForKey__once, &__block_literal_global_19_0);
  return (id)objc_msgSend((id)encryptionInfoForKey__testKeys, "objectAtIndexedSubscript:", a3 == 1);
}

uint64_t __37__NetworkUtils_encryptionInfoForKey___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  int v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  _QWORD v12[3];
  _QWORD v13[3];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  memset(v14, 170, 32);
  encryptionInfoForKey__testKeys = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
  v0 = *MEMORY[0x1E0D340C8];
  v1 = *MEMORY[0x1E0D340D0];
  v2 = *MEMORY[0x1E0D340C0];
  v3 = 1;
  do
  {
    v4 = v3 & 1;
    if ((v3 & 1) != 0)
      v5 = "00110011";
    else
      v5 = "00110010";
    if ((v3 & 1) != 0)
      v6 = "11100010";
    else
      v6 = "11100011";
    HexToByte(&v14[2], 16, v5, 32);
    HexToByte(v14, 16, v6, 32);
    v7 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v14[2], 16);
    v8 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v14, 16);
    v9 = objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v12[0] = v0;
    v12[1] = v1;
    v13[0] = v7;
    v13[1] = v8;
    v12[2] = v2;
    v13[2] = v9;
    v10 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
    result = objc_msgSend((id)encryptionInfoForKey__testKeys, "addObject:", v10);
    v3 = 0;
  }
  while (v4);
  return result;
}

+ (id)networkEmulationSettings:(id)a3 onUplink:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  const __CFString *v8;
  id result;
  const __CFString *v10;
  const __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  uint64_t v19;
  NSObject *v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v4 = a4;
  v33 = *MEMORY[0x1E0C80C00];
  v7 = +[NetworkUtils networkEmulationSettings:](NetworkUtils, "networkEmulationSettings:");
  if (!v7)
  {
    if ((id)objc_opt_class() == a1)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          +[NetworkUtils networkEmulationSettings:onUplink:].cold.1();
      }
      return 0;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = (const __CFString *)objc_msgSend(a1, "performSelector:", sel_logPrefix);
    else
      v10 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      return 0;
    v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      return 0;
    v21 = 136316418;
    v22 = v14;
    v23 = 2080;
    v24 = "+[NetworkUtils networkEmulationSettings:onUplink:]";
    v25 = 1024;
    v26 = 353;
    v27 = 2112;
    v28 = v10;
    v29 = 2048;
    v30 = a1;
    v31 = 2112;
    v32 = a3;
    v16 = " [%s] %s:%d %@(%p) Empty network emulation settings path=%@";
    v17 = v15;
    v18 = 58;
    goto LABEL_28;
  }
  if (v4)
    v8 = CFSTR("output");
  else
    v8 = CFSTR("input");
  result = (id)objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  if (!result)
  {
    if ((id)objc_opt_class() == a1)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v12 = VRTraceErrorLogLevelToCSTR();
        v13 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          +[NetworkUtils networkEmulationSettings:onUplink:].cold.2(v12, v4, v13);
      }
      return 0;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = (const __CFString *)objc_msgSend(a1, "performSelector:", sel_logPrefix);
    else
      v11 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      return 0;
    v19 = VRTraceErrorLogLevelToCSTR();
    v20 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      return 0;
    v21 = 136316418;
    v22 = v19;
    v23 = 2080;
    v24 = "+[NetworkUtils networkEmulationSettings:onUplink:]";
    v25 = 1024;
    v26 = 357;
    v27 = 2112;
    v28 = v11;
    v29 = 2048;
    v30 = a1;
    v31 = 1024;
    LODWORD(v32) = v4;
    v16 = " [%s] %s:%d %@(%p) Empty network emulation settings for isUplink=%d";
    v17 = v20;
    v18 = 54;
LABEL_28:
    _os_log_error_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v21, v18);
    return 0;
  }
  return result;
}

+ (id)networkEmulationSettings:(id)a3
{
  id result;
  uint64_t v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint32_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    if ((id)objc_opt_class() == a1)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          +[NetworkUtils networkEmulationSettings:].cold.1();
      }
      return 0;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = (const __CFString *)objc_msgSend(a1, "performSelector:", sel_logPrefix);
    else
      v7 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      return 0;
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      return 0;
    *(_DWORD *)buf = 136316162;
    v23 = v10;
    v24 = 2080;
    v25 = "+[NetworkUtils networkEmulationSettings:]";
    v26 = 1024;
    v27 = 364;
    v28 = 2112;
    v29 = (id)v7;
    v30 = 2048;
    v31 = a1;
    v12 = " [%s] %s:%d %@(%p) Network emulation profile path should not be nil";
    v13 = v11;
    goto LABEL_29;
  }
  result = (id)objc_msgSend(a3, "length");
  if (!result)
    return result;
  v21 = 0;
  v6 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", a3, 0, &v21);
  if (!v6)
  {
    if ((id)objc_opt_class() != a1)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v8 = (const __CFString *)objc_msgSend(a1, "performSelector:", sel_logPrefix);
      else
        v8 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        return 0;
      v18 = VRTraceErrorLogLevelToCSTR();
      v19 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        return 0;
      *(_DWORD *)buf = 136316674;
      v23 = v18;
      v24 = 2080;
      v25 = "+[NetworkUtils networkEmulationSettings:]";
      v26 = 1024;
      v27 = 370;
      v28 = 2112;
      v29 = (id)v8;
      v30 = 2048;
      v31 = a1;
      v32 = 2112;
      v33 = a3;
      v34 = 2112;
      v35 = v21;
      v12 = " [%s] %s:%d %@(%p) Error loading network emulation data path=%@ error=%@";
LABEL_38:
      v13 = v19;
      v17 = 68;
      goto LABEL_39;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      return 0;
    v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      return 0;
    *(_DWORD *)buf = 136316162;
    v23 = v14;
    v24 = 2080;
    v25 = "+[NetworkUtils networkEmulationSettings:]";
    v26 = 1024;
    v27 = 370;
    v28 = 2112;
    v29 = a3;
    v30 = 2112;
    v31 = v21;
    v12 = " [%s] %s:%d Error loading network emulation data path=%@ error=%@";
    goto LABEL_28;
  }
  result = (id)objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v6, 0, &v21);
  if (!result)
  {
    if ((id)objc_opt_class() != a1)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v9 = (const __CFString *)objc_msgSend(a1, "performSelector:", sel_logPrefix);
      else
        v9 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        return 0;
      v20 = VRTraceErrorLogLevelToCSTR();
      v19 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        return 0;
      *(_DWORD *)buf = 136316674;
      v23 = v20;
      v24 = 2080;
      v25 = "+[NetworkUtils networkEmulationSettings:]";
      v26 = 1024;
      v27 = 373;
      v28 = 2112;
      v29 = (id)v9;
      v30 = 2048;
      v31 = a1;
      v32 = 2112;
      v33 = a3;
      v34 = 2112;
      v35 = v21;
      v12 = " [%s] %s:%d %@(%p) Error serializing network emulation settings path=%@ error=%@";
      goto LABEL_38;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      return 0;
    v16 = VRTraceErrorLogLevelToCSTR();
    v15 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      return 0;
    *(_DWORD *)buf = 136316162;
    v23 = v16;
    v24 = 2080;
    v25 = "+[NetworkUtils networkEmulationSettings:]";
    v26 = 1024;
    v27 = 373;
    v28 = 2112;
    v29 = a3;
    v30 = 2112;
    v31 = v21;
    v12 = " [%s] %s:%d Error serializing network emulation settings path=%@ error=%@";
LABEL_28:
    v13 = v15;
LABEL_29:
    v17 = 48;
LABEL_39:
    _os_log_error_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_ERROR, v12, buf, v17);
    return 0;
  }
  return result;
}

+ (void)networkEmulationSettings:onUplink:.cold.1()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  uint8_t v3[12];
  __int16 v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v4 = v0;
  v5 = "+[NetworkUtils networkEmulationSettings:onUplink:]";
  v6 = 1024;
  v7 = 353;
  v8 = 2112;
  v9 = v1;
  _os_log_error_impl(&dword_1D8A54000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Empty network emulation settings path=%@", v3, 0x26u);
  OUTLINED_FUNCTION_3();
}

+ (void)networkEmulationSettings:(os_log_t)log onUplink:.cold.2(uint64_t a1, char a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = 136315906;
  v4 = a1;
  v5 = 2080;
  v6 = "+[NetworkUtils networkEmulationSettings:onUplink:]";
  v7 = 1024;
  v8 = 357;
  v9 = 1024;
  v10 = a2 & 1;
  _os_log_error_impl(&dword_1D8A54000, log, OS_LOG_TYPE_ERROR, " [%s] %s:%d Empty network emulation settings for isUplink=%d", (uint8_t *)&v3, 0x22u);
  OUTLINED_FUNCTION_3();
}

+ (void)networkEmulationSettings:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Network emulation profile path should not be nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
