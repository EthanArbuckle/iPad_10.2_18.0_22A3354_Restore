@implementation AVCVideoStream

- (AVCVideoStream)initWithNetworkSockets:(id)a3 callID:(id)a4 error:(id *)a5
{
  const char *v9;
  const char *v10;
  const char *v11;
  char *v12;
  os_log_t *v13;
  uint64_t v14;
  NSObject *v15;
  AVCVideoStream *v17;
  id *v18;
  char *__lasts;
  char *__str;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() < 6)
    return -[AVCVideoStream initWithLocalAddress:networkSockets:IDSDestination:connectionClientID:callID:options:error:](self, "initWithLocalAddress:networkSockets:IDSDestination:connectionClientID:callID:options:error:", 0, a3, 0, 0, a4, 0, a5);
  __str = 0;
  if (a3)
  {
    v9 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
    if (a4)
    {
LABEL_4:
      v10 = (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
      goto LABEL_7;
    }
  }
  else
  {
    v9 = "<nil>";
    if (a4)
      goto LABEL_4;
  }
  v10 = "<nil>";
LABEL_7:
  if (*a5)
    v11 = (const char *)objc_msgSend((id)objc_msgSend(*a5, "description"), "UTF8String");
  else
    v11 = "<nil>";
  asprintf(&__str, "socketsDictionary=%s, callID=%s, error=%s", v9, v10, v11);
  if (__str)
  {
    v17 = self;
    v18 = a5;
    __lasts = 0;
    v12 = strtok_r(__str, "\n", &__lasts);
    v13 = (os_log_t *)MEMORY[0x1E0CF2758];
    do
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v14 = VRTraceErrorLogLevelToCSTR();
        v15 = *v13;
        if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          v22 = v14;
          v23 = 2080;
          v24 = "-[AVCVideoStream initWithNetworkSockets:callID:error:]";
          v25 = 1024;
          v26 = 58;
          v27 = 2080;
          v28 = "";
          v29 = 2080;
          v30 = v12;
          _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d %s %s", buf, 0x30u);
        }
      }
      v12 = strtok_r(0, "\n", &__lasts);
    }
    while (v12);
    free(__str);
    self = v17;
    a5 = v18;
  }
  return -[AVCVideoStream initWithLocalAddress:networkSockets:IDSDestination:connectionClientID:callID:options:error:](self, "initWithLocalAddress:networkSockets:IDSDestination:connectionClientID:callID:options:error:", 0, a3, 0, 0, a4, 0, a5);
}

- (AVCVideoStream)initWithNetworkSockets:(id)a3 options:(id)a4 error:(id *)a5
{
  const char *v9;
  const char *v10;
  const char *v11;
  char *v12;
  os_log_t *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  AVCVideoStream *v18;
  id *v19;
  char *__lasts;
  char *__str;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() < 6)
    goto LABEL_17;
  __str = 0;
  if (a3)
  {
    v9 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
    if (a4)
    {
LABEL_4:
      v10 = (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
      goto LABEL_7;
    }
  }
  else
  {
    v9 = "<nil>";
    if (a4)
      goto LABEL_4;
  }
  v10 = "<nil>";
LABEL_7:
  if (*a5)
    v11 = (const char *)objc_msgSend((id)objc_msgSend(*a5, "description"), "UTF8String");
  else
    v11 = "<nil>";
  asprintf(&__str, "socketsDictionary=%s, options=%s, error=%s", v9, v10, v11);
  if (__str)
  {
    v18 = self;
    v19 = a5;
    __lasts = 0;
    v12 = strtok_r(__str, "\n", &__lasts);
    v13 = (os_log_t *)MEMORY[0x1E0CF2758];
    do
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v14 = VRTraceErrorLogLevelToCSTR();
        v15 = *v13;
        if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          v23 = v14;
          v24 = 2080;
          v25 = "-[AVCVideoStream initWithNetworkSockets:options:error:]";
          v26 = 1024;
          v27 = 63;
          v28 = 2080;
          v29 = "";
          v30 = 2080;
          v31 = v12;
          _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d %s %s", buf, 0x30u);
        }
      }
      v12 = strtok_r(0, "\n", &__lasts);
    }
    while (v12);
    free(__str);
    a5 = v19;
    self = v18;
  }
LABEL_17:
  if (a4)
    v16 = objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("avcMediaStreamOptionCallID"));
  else
    v16 = 0;
  return -[AVCVideoStream initWithLocalAddress:networkSockets:IDSDestination:connectionClientID:callID:options:error:](self, "initWithLocalAddress:networkSockets:IDSDestination:connectionClientID:callID:options:error:", 0, a3, 0, 0, v16, a4, a5);
}

- (AVCVideoStream)initWithNWConnectionClientID:(unsigned __int8)a3[16] options:(id)a4 error:(id *)a5
{
  uint64_t v9;
  AVCVideoStream *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  NSObject *v14;
  AVCVideoStream *v15;
  const char *v16;
  char *v17;
  os_log_t *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v22;
  id *v23;
  AVCVideoStream *v24;
  char *__lasts;
  char *__str;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  char *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v9 = objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("avcMediaStreamOptionCallID"));
    v10 = (AVCVideoStream *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", a3);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      __str = 0;
      v11 = (const char *)objc_msgSend((id)-[AVCVideoStream UUIDString](v10, "UUIDString"), "UTF8String");
      v12 = a4 ? (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String") : "<nil>";
      v16 = *a5 ? (const char *)objc_msgSend((id)objc_msgSend(*a5, "description"), "UTF8String") : "<nil>";
      asprintf(&__str, "clientID=%s, options=%s, error=%s", v11, v12, v16);
      if (__str)
      {
        v22 = v9;
        v23 = a5;
        v24 = self;
        __lasts = 0;
        v17 = strtok_r(__str, "\n", &__lasts);
        v18 = (os_log_t *)MEMORY[0x1E0CF2758];
        do
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
          {
            v19 = VRTraceErrorLogLevelToCSTR();
            v20 = *v18;
            if (os_log_type_enabled(*v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316162;
              v28 = v19;
              v29 = 2080;
              v30 = "-[AVCVideoStream initWithNWConnectionClientID:options:error:]";
              v31 = 1024;
              v32 = 86;
              v33 = 2080;
              v34 = "";
              v35 = 2080;
              v36 = v17;
              _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d %s %s", buf, 0x30u);
            }
          }
          v17 = strtok_r(0, "\n", &__lasts);
        }
        while (v17);
        free(__str);
        a5 = v23;
        self = v24;
        v9 = v22;
      }
    }
    v15 = -[AVCVideoStream initWithLocalAddress:networkSockets:IDSDestination:connectionClientID:callID:options:error:](self, "initWithLocalAddress:networkSockets:IDSDestination:connectionClientID:callID:options:error:", 0, 0, 0, -[AVCVideoStream UUIDString](v10, "UUIDString"), v9, a4, a5);
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v28 = v13;
        v29 = 2080;
        v30 = "-[AVCVideoStream initWithNWConnectionClientID:options:error:]";
        v31 = 1024;
        v32 = 76;
        _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d clientID is nil", buf, 0x1Cu);
      }
    }
    v15 = 0;
    if (a5)
      *a5 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "AVConferenceServiceError:detailCode:description:", 32000, 0, CFSTR("clientID may not be nil"));
    v10 = self;
  }

  return v15;
}

- (AVCVideoStream)initWithIDSDestination:(id)a3 callID:(id)a4 error:(id *)a5
{
  uint64_t v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v11 = *a5;
      *(_DWORD *)buf = 136316418;
      v14 = v9;
      v15 = 2080;
      v16 = "-[AVCVideoStream initWithIDSDestination:callID:error:]";
      v17 = 1024;
      v18 = 94;
      v19 = 2112;
      v20 = a3;
      v21 = 2112;
      v22 = a4;
      v23 = 2112;
      v24 = v11;
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d destination=%@, callID=%@, error=%@", buf, 0x3Au);
    }
  }
  return -[AVCVideoStream initWithLocalAddress:networkSockets:IDSDestination:connectionClientID:callID:options:error:](self, "initWithLocalAddress:networkSockets:IDSDestination:connectionClientID:callID:options:error:", 0, 0, a3, 0, a4, 0, a5);
}

- (AVCVideoStream)initWithLocalAddress:(id)a3 networkSockets:(id)a4 IDSDestination:(id)a5 connectionClientID:(id)a6 callID:(id)a7 options:(id)a8 error:(id *)a9
{
  const char *v16;
  const char *v17;
  const char *v18;
  const char *v19;
  const char *v20;
  const char *v21;
  char *v22;
  os_log_t *v23;
  uint64_t v24;
  NSObject *v25;
  AVCVideoStream *v26;
  AVCVideoStream *v27;
  const __CFString *v28;
  uint64_t v29;
  NSObject *v30;
  _BOOL4 shouldUseXPC;
  const char *v32;
  const char *v33;
  NSObject *v34;
  uint32_t v35;
  uint64_t v36;
  NSObject *v37;
  _BOOL4 v38;
  const char *v39;
  id v40;
  NSObject *CustomRootQueue;
  id v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  uint64_t v47;
  NSObject *v48;
  VCVideoStream *v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  int streamToken;
  const __CFString *v54;
  uint64_t v55;
  NSObject *v56;
  id v58;
  uint64_t v59;
  NSObject *v60;
  const char *v61;
  uint64_t v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  objc_super v68;
  char *__lasts;
  char *__str;
  uint8_t buf[4];
  uint64_t v72;
  __int16 v73;
  const char *v74;
  __int16 v75;
  int v76;
  __int16 v77;
  const char *v78;
  __int16 v79;
  uint64_t v80;
  __int16 v81;
  _QWORD v82[3];

  *(_QWORD *)((char *)&v82[1] + 6) = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() < 7)
    goto LABEL_25;
  __str = 0;
  if (a3)
    v16 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
  else
    v16 = "<nil>";
  v66 = a3;
  if (a4)
    v17 = (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
  else
    v17 = "<nil>";
  v67 = a5;
  if (a5)
  {
    v18 = (const char *)objc_msgSend((id)objc_msgSend(a5, "description"), "UTF8String");
    if (a6)
      goto LABEL_10;
  }
  else
  {
    v18 = "<nil>";
    if (a6)
    {
LABEL_10:
      v19 = (const char *)objc_msgSend((id)objc_msgSend(a6, "description"), "UTF8String");
      if (a7)
        goto LABEL_11;
LABEL_15:
      v20 = "<nil>";
      if (a8)
        goto LABEL_12;
LABEL_16:
      v21 = "<nil>";
      goto LABEL_17;
    }
  }
  v19 = "<nil>";
  if (!a7)
    goto LABEL_15;
LABEL_11:
  v20 = (const char *)objc_msgSend((id)objc_msgSend(a7, "description"), "UTF8String");
  if (!a8)
    goto LABEL_16;
LABEL_12:
  v21 = (const char *)objc_msgSend((id)objc_msgSend(a8, "description"), "UTF8String");
LABEL_17:
  asprintf(&__str, "localAddress=%s, socketsDictionary=%s, destination=%s, connectionClientID=%s, callID=%s, options=%s", v16, v17, v18, v19, v20, v21);
  if (__str)
  {
    v63 = a6;
    v64 = a4;
    v65 = a7;
    __lasts = 0;
    v22 = strtok_r(__str, "\n", &__lasts);
    v23 = (os_log_t *)MEMORY[0x1E0CF2758];
    do
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v24 = VRTraceErrorLogLevelToCSTR();
        v25 = *v23;
        if (os_log_type_enabled(*v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          v72 = v24;
          v73 = 2080;
          v74 = "-[AVCVideoStream initWithLocalAddress:networkSockets:IDSDestination:connectionClientID:callID:options:error:]";
          v75 = 1024;
          v76 = 99;
          v77 = 2080;
          v78 = "";
          v79 = 2080;
          v80 = (uint64_t)v22;
          _os_log_impl(&dword_1D8A54000, v25, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d %s %s", buf, 0x30u);
        }
      }
      v22 = strtok_r(0, "\n", &__lasts);
    }
    while (v22);
    free(__str);
    a4 = v64;
    a7 = v65;
    a6 = v63;
  }
  a3 = v66;
  a5 = v67;
LABEL_25:
  v68.receiver = self;
  v68.super_class = (Class)AVCVideoStream;
  v26 = -[AVCVideoStream init](&v68, sel_init);
  if (!v26)
    goto LABEL_86;
  v27 = v26;
  v26->_shouldUseXPC = 1;
  if (objc_msgSend(a8, "objectForKeyedSubscript:", CFSTR("avcMediaStreamOptionRunInProcess")))
    v27->_shouldUseXPC = objc_msgSend((id)objc_msgSend(a8, "objectForKeyedSubscript:", CFSTR("avcMediaStreamOptionRunInProcess")), "BOOLValue") ^ 1;
  if ((AVCVideoStream *)objc_opt_class() == v27)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v29 = VRTraceErrorLogLevelToCSTR();
      v30 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        shouldUseXPC = v27->_shouldUseXPC;
        *(_DWORD *)buf = 136315906;
        if (shouldUseXPC)
          v32 = "out of";
        else
          v32 = "in";
        v72 = v29;
        v73 = 2080;
        v74 = "-[AVCVideoStream initWithLocalAddress:networkSockets:IDSDestination:connectionClientID:callID:options:error:]";
        v75 = 1024;
        v76 = 105;
        v77 = 2080;
        v78 = v32;
        v33 = "AVCVideoStream [%s] %s:%d Will run %s process";
        v34 = v30;
        v35 = 38;
        goto LABEL_44;
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v28 = (const __CFString *)-[AVCVideoStream performSelector:](v27, "performSelector:", sel_logPrefix);
    else
      v28 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v36 = VRTraceErrorLogLevelToCSTR();
      v37 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v38 = v27->_shouldUseXPC;
        *(_DWORD *)buf = 136316418;
        if (v38)
          v39 = "out of";
        else
          v39 = "in";
        v72 = v36;
        v73 = 2080;
        v74 = "-[AVCVideoStream initWithLocalAddress:networkSockets:IDSDestination:connectionClientID:callID:options:error:]";
        v75 = 1024;
        v76 = 105;
        v77 = 2112;
        v78 = (const char *)v28;
        v79 = 2048;
        v80 = (uint64_t)v27;
        v81 = 2080;
        v82[0] = v39;
        v33 = "AVCVideoStream [%s] %s:%d %@(%p) Will run %s process";
        v34 = v37;
        v35 = 58;
LABEL_44:
        _os_log_impl(&dword_1D8A54000, v34, OS_LOG_TYPE_DEFAULT, v33, buf, v35);
      }
    }
  }
  -[AVCVideoStream refreshLoggingParameters](v27, "refreshLoggingParameters");
  v40 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (a3)
  {
    objc_msgSend(v40, "setObject:forKeyedSubscript:", objc_msgSend(a3, "ip"), CFSTR("vcMediaStreamSourceIP"));
    objc_msgSend(v40, "setObject:forKeyedSubscript:", objc_msgSend(a3, "interfaceName"), CFSTR("vcMediaStreamSourceInterfaceName"));
  }
  if (a5)
    objc_msgSend(v40, "setObject:forKeyedSubscript:", a5, CFSTR("vcMediaStreamDestID"));
  if (a6)
    objc_msgSend(v40, "setObject:forKeyedSubscript:", a6, CFSTR("vcMediaStreamConnectionClientID"));
  if (a7)
    objc_msgSend(v40, "setObject:forKeyedSubscript:", a7, CFSTR("vcMediaStreamCallID"));
  if (objc_msgSend(a8, "objectForKeyedSubscript:", CFSTR("avcMediaStreamOptionClientPID")))
    objc_msgSend(v40, "setObject:forKeyedSubscript:", objc_msgSend(a8, "objectForKeyedSubscript:", CFSTR("avcMediaStreamOptionClientPID")), CFSTR("vcMediaStreamClientPID"));
  if (objc_msgSend(a8, "objectForKeyedSubscript:", CFSTR("avcMediaStreamOptionRemoteEndpointInfo")))
    objc_msgSend(v40, "setObject:forKeyedSubscript:", objc_msgSend(a8, "objectForKeyedSubscript:", CFSTR("avcMediaStreamOptionRemoteEndpointInfo")), CFSTR("vcMediaStreamRemoteEndpointInfo"));
  if (objc_msgSend(a8, "objectForKeyedSubscript:", CFSTR("avcMediaStreamOptionClientName")))
    objc_msgSend(v40, "setObject:forKeyedSubscript:", objc_msgSend(a8, "objectForKeyedSubscript:", CFSTR("avcMediaStreamOptionClientName")), CFSTR("vcMediaStreamClientName"));
  if (objc_msgSend(a8, "objectForKeyedSubscript:", CFSTR("avcMediaStreamOptionClientSessionID")))
  {
    objc_msgSend(a8, "objectForKeyedSubscript:", CFSTR("avcMediaStreamOptionClientSessionID"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v40, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(a8, "objectForKeyedSubscript:", CFSTR("avcMediaStreamOptionClientSessionID")), "UUIDString"), CFSTR("vcMediaStreamClientSessionID"));
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCVideoStream initWithLocalAddress:networkSockets:IDSDestination:connectionClientID:callID:options:error:].cold.4();
    }
  }
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
  v27->_callbackQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.avcvideostream.callback.queue", 0, CustomRootQueue);
  if (v27->_shouldUseXPC)
  {
    v27->_connection = objc_alloc_init(AVConferenceXPCClient);
    v42 = objc_alloc(MEMORY[0x1E0C99D80]);
    v43 = (void *)objc_msgSend(v42, "initWithObjectsAndKeys:", v40, CFSTR("vcMediaStreamDictionary"), MEMORY[0x1E0C9AAB0], CFSTR("CACHEAUTHTOKEN"), 0);
    v44 = -[AVConferenceXPCClient sendMessageSync:arguments:xpcArguments:](v27->_connection, "sendMessageSync:arguments:xpcArguments:", "vcMediaStreamInitializeVideo", v43, a4);
    -[AVCVideoStream registerBlocksForDelegateNotifications](v27, "registerBlocksForDelegateNotifications");
    if (v44)
    {
      v45 = (id)objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("ERROR"));
      if (v45 || objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("TIMEOUT")))
      {
        v46 = a7;
        if (a9)
          *a9 = v45;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v47 = VRTraceErrorLogLevelToCSTR();
          v48 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            if (v45)
              v61 = (const char *)objc_msgSend((id)objc_msgSend(v45, "description"), "UTF8String");
            else
              v61 = "<nil>";
            v62 = objc_msgSend((id)objc_msgSend(v44, "description"), "UTF8String");
            *(_DWORD *)buf = 136316162;
            v72 = v47;
            v73 = 2080;
            v74 = "-[AVCVideoStream initWithLocalAddress:networkSockets:IDSDestination:connectionClientID:callID:options:error:]";
            v75 = 1024;
            v76 = 159;
            v77 = 2080;
            v78 = v61;
            v79 = 2080;
            v80 = v62;
            _os_log_error_impl(&dword_1D8A54000, v48, OS_LOG_TYPE_ERROR, "AVCVideoStream [%s] %s:%d AVCVideoStream: error initializing error[%s] resultDict[%s]", buf, 0x30u);
          }
        }

        v27 = 0;
        a7 = v46;
        goto LABEL_80;
      }
      -[AVCVideoStream setCapabilities:](v27, "setCapabilities:", objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("vcMediaStreamStreamCapabilities")));
      if (!-[AVCVideoStream capabilities](v27, "capabilities"))
      {
        v58 = a7;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v59 = VRTraceErrorLogLevelToCSTR();
          v60 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[AVCVideoStream initWithLocalAddress:networkSockets:IDSDestination:connectionClientID:callID:options:error:].cold.2(v59, v44, v60);
        }

        v27 = 0;
        a7 = v58;
LABEL_80:

        if (v27)
          goto LABEL_81;
        goto LABEL_86;
      }
      if (objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("vcMediaStreamToken")))
      {
        v27->_streamToken = objc_msgSend((id)objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("vcMediaStreamToken")), "integerValue");
        goto LABEL_80;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCVideoStream initWithLocalAddress:networkSockets:IDSDestination:connectionClientID:callID:options:error:].cold.3();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCVideoStream initWithLocalAddress:networkSockets:IDSDestination:connectionClientID:callID:options:error:].cold.1();
    }

    v27 = 0;
    goto LABEL_80;
  }
  v49 = objc_alloc_init(VCVideoStream);
  v27->_opaqueStream = v49;
  -[VCMediaStream setDelegate:](v49, "setDelegate:", v27);
  v27->_streamToken = -[VCMediaStream streamToken](v27->_opaqueStream, "streamToken");
  v50 = -[VCMediaStream setLocalParticipantInfo:networkSockets:withError:](v27->_opaqueStream, "setLocalParticipantInfo:networkSockets:withError:", v40, a4, a9);
  if (v50)
  {
    -[AVCVideoStream setCapabilities:](v27, "setCapabilities:", v50);

LABEL_81:
    MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCVideoStream-init");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v51 = VRTraceErrorLogLevelToCSTR();
      v52 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        streamToken = v27->_streamToken;
        if (a9)
          v54 = (const __CFString *)*a9;
        else
          v54 = CFSTR("None");
        *(_DWORD *)buf = 136316674;
        v72 = v51;
        v73 = 2080;
        v74 = "-[AVCVideoStream initWithLocalAddress:networkSockets:IDSDestination:connectionClientID:callID:options:error:]";
        v75 = 1024;
        v76 = 200;
        v77 = 2048;
        v78 = (const char *)v27;
        v79 = 2112;
        v80 = (uint64_t)a7;
        v81 = 1024;
        LODWORD(v82[0]) = streamToken;
        WORD2(v82[0]) = 2112;
        *(_QWORD *)((char *)v82 + 6) = v54;
        _os_log_impl(&dword_1D8A54000, v52, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d @:@ AVCVideoStream-init (%p) callID=%@, streamToken=%d, error=%@", buf, 0x40u);
      }
    }
    return v27;
  }

LABEL_86:
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCVideoStream-init");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v55 = VRTraceErrorLogLevelToCSTR();
    v56 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v72 = v55;
      v73 = 2080;
      v74 = "-[AVCVideoStream initWithLocalAddress:networkSockets:IDSDestination:connectionClientID:callID:options:error:]";
      v75 = 1024;
      v76 = 202;
      v77 = 2048;
      v78 = 0;
      _os_log_impl(&dword_1D8A54000, v56, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d @:@ AVCVideoStream-init (%p)", buf, 0x26u);
    }
  }
  return 0;
}

- (void)terminateSession
{
  if (self->_shouldUseXPC)
  {
    -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcMediaStreamDidServerDie");
    -[AVConferenceXPCClient sendMessageSync:](self->_connection, "sendMessageSync:", "vcMediaStreamTerminateVideo");

    self->_connection = 0;
  }
}

- (void)dealloc
{
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *callbackQueue;
  uint64_t v12;
  NSObject *v13;
  objc_super v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  AVCVideoStream *v22;
  __int16 v23;
  AVCVideoStream *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if ((AVCVideoStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 6)
      goto LABEL_12;
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    *(_DWORD *)buf = 136315650;
    v16 = v4;
    v17 = 2080;
    v18 = "-[AVCVideoStream dealloc]";
    v19 = 1024;
    v20 = 218;
    v6 = "AVCVideoStream [%s] %s:%d ";
    v7 = v5;
    v8 = 28;
    goto LABEL_11;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = (const __CFString *)-[AVCVideoStream performSelector:](self, "performSelector:", sel_logPrefix);
  else
    v3 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v16 = v9;
      v17 = 2080;
      v18 = "-[AVCVideoStream dealloc]";
      v19 = 1024;
      v20 = 218;
      v21 = 2112;
      v22 = (AVCVideoStream *)v3;
      v23 = 2048;
      v24 = self;
      v6 = "AVCVideoStream [%s] %s:%d %@(%p) ";
      v7 = v10;
      v8 = 48;
LABEL_11:
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
    }
  }
LABEL_12:
  -[AVCVideoStream setCapabilities:](self, "setCapabilities:", 0);
  -[AVCVideoStream setConfiguration:](self, "setConfiguration:", 0);
  if (self->_shouldUseXPC)
  {
    -[AVCVideoStream deregisterBlocksForDelegateNotifications](self, "deregisterBlocksForDelegateNotifications");
    -[AVCVideoStream terminateSession](self, "terminateSession");
  }
  else
  {
    -[VCMediaStream stop](self->_opaqueStream, "stop");
    -[VCMediaStream setDelegate:](self->_opaqueStream, "setDelegate:", 0);

  }
  callbackQueue = self->_callbackQueue;
  if (callbackQueue)
  {
    dispatch_release(callbackQueue);
    self->_callbackQueue = 0;
  }
  objc_storeWeak(&self->_delegate, 0);
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCVideoStream-dealloc");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v16 = v12;
      v17 = 2080;
      v18 = "-[AVCVideoStream dealloc]";
      v19 = 1024;
      v20 = 235;
      v21 = 2048;
      v22 = self;
      _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d @:@ AVCVideoStream-dealloc (%p)", buf, 0x26u);
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)AVCVideoStream;
  -[AVCVideoStream dealloc](&v14, sel_dealloc);
}

- (AVCVideoStreamDelegate)delegate
{
  return (AVCVideoStreamDelegate *)objc_loadWeak(&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_delegate, a3);
}

- (void)refreshLoggingParameters
{
  CFPreferencesAppSynchronize(CFSTR("com.apple.AVConference"));
  CFPreferencesAppSynchronize((CFStringRef)*MEMORY[0x1E0C9B248]);
  VRTraceReset();
  VRTracePrintLoggingInfo();
}

- (BOOL)configure:(id)a3 error:(id *)a4
{
  const char *v7;
  const char *v8;
  char *v9;
  os_log_t *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  char v18;
  const __CFString *v19;
  VCVideoStreamConfig *v20;
  VCVideoStream *opaqueStream;
  uint64_t v22;
  char IsOSFaultDisabled;
  NSObject *v24;
  uint64_t v25;
  char v26;
  NSObject *v27;
  const char *v28;
  const char *v29;
  id *v31;
  char *__lasts;
  char *__str;
  VCVideoStreamConfig *v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  AVCVideoStream *v44;
  __int16 v45;
  const char *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    __str = 0;
    v7 = a3 ? (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String") : "<nil>";
    v8 = *a4 ? (const char *)objc_msgSend((id)objc_msgSend(*a4, "description"), "UTF8String") : "<nil>";
    asprintf(&__str, "configuration=%s, error=%s", v7, v8);
    if (__str)
    {
      v31 = a4;
      __lasts = 0;
      v9 = strtok_r(__str, "\n", &__lasts);
      v10 = (os_log_t *)MEMORY[0x1E0CF2758];
      do
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          v11 = VRTraceErrorLogLevelToCSTR();
          v12 = *v10;
          if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            v36 = v11;
            v37 = 2080;
            v38 = "-[AVCVideoStream configure:error:]";
            v39 = 1024;
            v40 = 261;
            v41 = 2080;
            v42 = "";
            v43 = 2080;
            v44 = (AVCVideoStream *)v9;
            _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d %s %s", buf, 0x30u);
          }
        }
        v9 = strtok_r(0, "\n", &__lasts);
      }
      while (v9);
      free(__str);
      a4 = v31;
    }
  }
  if ((objc_msgSend(a3, "isValidVideoConfig") & 1) != 0)
  {
    if (self->_shouldUseXPC)
    {
      v13 = objc_msgSend(a3, "dictionary");
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v13, CFSTR("vcMediaStreamDictionary"), 0);
      v15 = -[AVConferenceXPCClient sendMessageSync:arguments:](self->_connection, "sendMessageSync:arguments:", "vcMediaStreamSetSessionConfig", v14);
      if (v15)
      {
        v16 = (id)objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("ERROR"));
        if (v16)
        {
          v17 = v16;
          -[AVCVideoStream setConfiguration:](self, "setConfiguration:", 0);
          v18 = 0;
          if (a4)
            *a4 = v17;
          goto LABEL_40;
        }
        -[AVCVideoStream setConfiguration:](self, "setConfiguration:", a3);
      }
      v18 = 1;
LABEL_40:

      return v18;
    }
    v20 = -[VCVideoStreamConfig initWithClientDictionary:]([VCVideoStreamConfig alloc], "initWithClientDictionary:", objc_msgSend(a3, "dictionary"));
    opaqueStream = self->_opaqueStream;
    v34 = v20;
    v18 = -[VCMediaStream setStreamConfig:withError:](opaqueStream, "setStreamConfig:withError:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1), a4);

    -[AVCVideoStream setConfiguration:](self, "setConfiguration:", a3);
  }
  else
  {
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a4, 32016, 105, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/AVCVideoStream.m", 268), CFSTR("Invalid Parameter"), CFSTR("Called with an invalid parameter"));
    if ((AVCVideoStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
      {
        v22 = VRTraceErrorLogLevelToCSTR();
        IsOSFaultDisabled = VRTraceIsOSFaultDisabled();
        v24 = *MEMORY[0x1E0CF2758];
        if ((IsOSFaultDisabled & 1) != 0)
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[AVCVideoStream configure:error:].cold.1(v22, a4, v24);
        }
        else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
        {
          -[AVCVideoStream configure:error:].cold.2(v22, a4, v24);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v19 = (const __CFString *)-[AVCVideoStream performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v19 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
      {
        v25 = VRTraceErrorLogLevelToCSTR();
        v26 = VRTraceIsOSFaultDisabled();
        v27 = *MEMORY[0x1E0CF2758];
        if ((v26 & 1) != 0)
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            if (*a4)
              v28 = (const char *)objc_msgSend((id)objc_msgSend(*a4, "description"), "UTF8String");
            else
              v28 = "<nil>";
            *(_DWORD *)buf = 136316418;
            v36 = v25;
            v37 = 2080;
            v38 = "-[AVCVideoStream configure:error:]";
            v39 = 1024;
            v40 = 271;
            v41 = 2112;
            v42 = (const char *)v19;
            v43 = 2048;
            v44 = self;
            v45 = 2080;
            v46 = v28;
            _os_log_error_impl(&dword_1D8A54000, v27, OS_LOG_TYPE_ERROR, "AVCVideoStream [%s] %s:%d %@(%p) Invalid video configuration: error[%s]", buf, 0x3Au);
          }
        }
        else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
        {
          if (*a4)
            v29 = (const char *)objc_msgSend((id)objc_msgSend(*a4, "description"), "UTF8String");
          else
            v29 = "<nil>";
          *(_DWORD *)buf = 136316418;
          v36 = v25;
          v37 = 2080;
          v38 = "-[AVCVideoStream configure:error:]";
          v39 = 1024;
          v40 = 271;
          v41 = 2112;
          v42 = (const char *)v19;
          v43 = 2048;
          v44 = self;
          v45 = 2080;
          v46 = v29;
          _os_log_fault_impl(&dword_1D8A54000, v27, OS_LOG_TYPE_FAULT, "AVCVideoStream [%s] %s:%d %@(%p) Invalid video configuration: error[%s]", buf, 0x3Au);
        }
      }
    }
    return 0;
  }
  return v18;
}

- (void)start
{
  _BOOL4 shouldUseXPC;
  int ErrorLogLevelForModule;
  uint64_t v5;
  NSObject *v6;
  id v7;
  VCVideoStream *opaqueStream;
  AVCVideoStream *v9;
  _BOOL8 v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  AVCVideoStream *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1DF087EC4](&dword_1D8A54000, "-[AVCVideoStream start]");
  if (!-[AVCVideoStream configuration](self, "configuration"))
  {
    v7 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "AVConferenceServiceError:detailCode:description:", 32016, 0, CFSTR("AVCVideoStream hasn't been configured"));
    opaqueStream = self->_opaqueStream;
    v9 = self;
    v10 = 0;
LABEL_12:
    -[AVCVideoStream vcMediaStream:didStartStream:error:](v9, "vcMediaStream:didStartStream:error:", opaqueStream, v10, v7);
    goto LABEL_13;
  }
  shouldUseXPC = self->_shouldUseXPC;
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (!shouldUseXPC)
  {
    if (ErrorLogLevelForModule >= 7)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v15 = 136315650;
        v16 = v11;
        v17 = 2080;
        v18 = "-[AVCVideoStream start]";
        v19 = 1024;
        v20 = 318;
        _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d AVCVideoStream start (not using XPC)", (uint8_t *)&v15, 0x1Cu);
      }
    }
    v7 = -[VCMediaStream start](self->_opaqueStream, "start");
    opaqueStream = self->_opaqueStream;
    v10 = v7 == 0;
    v9 = self;
    goto LABEL_12;
  }
  if (ErrorLogLevelForModule >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v15 = 136315650;
      v16 = v5;
      v17 = 2080;
      v18 = "-[AVCVideoStream start]";
      v19 = 1024;
      v20 = 315;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d AVCVideoStream API_VCMEDIASTREAM_STARTCONFERENCE (client side)", (uint8_t *)&v15, 0x1Cu);
    }
  }
  -[AVConferenceXPCClient sendMessageAsync:](self->_connection, "sendMessageAsync:", "vcMediaStreamStartConference");
LABEL_13:
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCVideoStream-start");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v15 = 136315906;
      v16 = v13;
      v17 = 2080;
      v18 = "-[AVCVideoStream start]";
      v19 = 1024;
      v20 = 327;
      v21 = 2048;
      v22 = self;
      _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d @:@ AVCVideoStream-start (%p)", (uint8_t *)&v15, 0x26u);
    }
  }
}

- (void)stop
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  AVCVideoStream *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1DF087EC4](&dword_1D8A54000, "-[AVCVideoStream stop]");
  if (self->_shouldUseXPC)
  {
    -[AVConferenceXPCClient sendMessageAsync:](self->_connection, "sendMessageAsync:", "vcMediaStreamStopConference");
  }
  else
  {
    -[VCMediaStream stop](self->_opaqueStream, "stop");
    -[AVCVideoStream vcMediaStreamDidStop:](self, "vcMediaStreamDidStop:", self->_opaqueStream);
  }
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCVideoStream-stop");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315906;
      v6 = v3;
      v7 = 2080;
      v8 = "-[AVCVideoStream stop]";
      v9 = 1024;
      v10 = 339;
      v11 = 2048;
      v12 = self;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d @:@ AVCVideoStream-stop (%p)", (uint8_t *)&v5, 0x26u);
    }
  }
}

- (void)pause
{
  void *v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  uint8_t buf[4];
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  AVCVideoStream *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1DF087EC4](&dword_1D8A54000, "-[AVCVideoStream pause]");
  if (self->_shouldUseXPC)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", &unk_1E9EFB4C0, CFSTR("vcMediaStreamDictionary"), 0);
    -[AVConferenceXPCClient sendMessageAsync:arguments:](self->_connection, "sendMessageAsync:arguments:", "vcMediaStreamSetPause", v3);

  }
  else
  {
    v4 = -[VCMediaStream setPause:](self->_opaqueStream, "setPause:", 1);
    -[AVCVideoStream vcMediaStream:didPauseStream:error:](self, "vcMediaStream:didPauseStream:error:", self->_opaqueStream, v4 == 0, v4);
  }
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCVideoStream-pause");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v8 = v5;
      v9 = 2080;
      v10 = "-[AVCVideoStream pause]";
      v11 = 1024;
      v12 = 356;
      v13 = 2048;
      v14 = self;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d @:@ AVCVideoStream-pause (%p)", buf, 0x26u);
    }
  }
}

- (void)resume
{
  void *v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  uint8_t buf[4];
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  AVCVideoStream *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1DF087EC4](&dword_1D8A54000, "-[AVCVideoStream resume]");
  if (self->_shouldUseXPC)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", &unk_1E9EFB4E8, CFSTR("vcMediaStreamDictionary"), 0);
    -[AVConferenceXPCClient sendMessageAsync:arguments:](self->_connection, "sendMessageAsync:arguments:", "vcMediaStreamSetPause", v3);

  }
  else
  {
    v4 = -[VCMediaStream setPause:](self->_opaqueStream, "setPause:", 0);
    -[AVCVideoStream vcMediaStream:didResumeStream:error:](self, "vcMediaStream:didResumeStream:error:", self->_opaqueStream, v4 == 0, v4);
  }
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCVideoStream-resume");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v8 = v5;
      v9 = 2080;
      v10 = "-[AVCVideoStream resume]";
      v11 = 1024;
      v12 = 373;
      v13 = 2048;
      v14 = self;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d @:@ AVCVideoStream-resume (%p)", buf, 0x26u);
    }
  }
}

- (void)updateVideoConfiguration:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char IsOSFaultDisabled;
  NSObject *v8;
  const char *v9;
  const char *v10;
  char *v11;
  os_log_t *v12;
  uint64_t v13;
  NSObject *v14;
  AVCVideoStreamDelegate *v15;
  const char *v16;
  void *v17;
  char *__lasts;
  char *__str;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  AVCVideoStream *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1DF087EC4](&dword_1D8A54000, "-[AVCVideoStream updateVideoConfiguration:]");
  if ((objc_msgSend(a3, "isValidForDirection:", -[AVCVideoStream direction](self, "direction")) & 1) != 0)
  {
    v5 = objc_msgSend(a3, "dictionary");
    if (self->_shouldUseXPC)
    {
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v5, CFSTR("vcMediaStreamDictionary"), 0);
      -[AVConferenceXPCClient sendMessageAsync:arguments:](self->_connection, "sendMessageAsync:arguments:", "vcMediaStreamUpdateVideoConfig");

    }
    else
    {
      -[VCVideoStream updateVideoConfig:](self->_opaqueStream, "updateVideoConfig:", v5);
    }
  }
  else
  {
    v20 = 0;
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", &v20, 32016, 105, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/AVCVideoStream.m", 383), CFSTR("Invalid Parameter"), CFSTR("Called with an invalid parameter"));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      IsOSFaultDisabled = VRTraceIsOSFaultDisabled();
      v8 = *MEMORY[0x1E0CF2758];
      if ((IsOSFaultDisabled & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          if (v20)
            v9 = (const char *)objc_msgSend((id)objc_msgSend(v20, "description"), "UTF8String");
          else
            v9 = "<nil>";
          *(_DWORD *)buf = 136316418;
          v22 = v6;
          v23 = 2080;
          v24 = "-[AVCVideoStream updateVideoConfiguration:]";
          v25 = 1024;
          v26 = 386;
          v27 = 2048;
          v28 = self;
          v29 = 2080;
          v30 = "-[AVCVideoStream updateVideoConfiguration:]";
          v31 = 2080;
          v32 = v9;
          _os_log_error_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_ERROR, "AVCVideoStream [%s] %s:%d AVCVideoStream[%p] %s error[%s]", buf, 0x3Au);
        }
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
      {
        if (v20)
          v16 = (const char *)objc_msgSend((id)objc_msgSend(v20, "description"), "UTF8String");
        else
          v16 = "<nil>";
        *(_DWORD *)buf = 136316418;
        v22 = v6;
        v23 = 2080;
        v24 = "-[AVCVideoStream updateVideoConfiguration:]";
        v25 = 1024;
        v26 = 386;
        v27 = 2048;
        v28 = self;
        v29 = 2080;
        v30 = "-[AVCVideoStream updateVideoConfiguration:]";
        v31 = 2080;
        v32 = v16;
        _os_log_fault_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_FAULT, "AVCVideoStream [%s] %s:%d AVCVideoStream[%p] %s error[%s]", buf, 0x3Au);
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      __str = 0;
      v10 = a3 ? (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String") : "<nil>";
      asprintf(&__str, "videoConfig=%s", v10);
      if (__str)
      {
        __lasts = 0;
        v11 = strtok_r(__str, "\n", &__lasts);
        v12 = (os_log_t *)MEMORY[0x1E0CF2758];
        do
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
          {
            v13 = VRTraceErrorLogLevelToCSTR();
            v14 = *v12;
            if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316162;
              v22 = v13;
              v23 = 2080;
              v24 = "-[AVCVideoStream updateVideoConfiguration:]";
              v25 = 1024;
              v26 = 387;
              v27 = 2080;
              v28 = (AVCVideoStream *)"";
              v29 = 2080;
              v30 = v11;
              _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d %s %s", buf, 0x30u);
            }
          }
          v11 = strtok_r(0, "\n", &__lasts);
        }
        while (v11);
        free(__str);
      }
    }
    -[AVCVideoStream delegate](self, "delegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v15 = -[AVCVideoStream delegate](self, "delegate");
      -[AVCVideoStreamDelegate stream:didUpdateVideoConfiguration:error:](v15, "stream:didUpdateVideoConfiguration:error:", self, 0, v20);
    }
  }
}

- (id)getStats
{
  return 0;
}

- (void)requestLastDecodedFrame
{
  __int16 v0;
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[12];
  __int16 v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v4 = v0;
  v5 = "-[AVCVideoStream requestLastDecodedFrame]";
  v6 = 1024;
  v7 = 415;
  v8 = v0;
  v9 = "-[AVCVideoStream requestLastDecodedFrame]";
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v1, v2, "AVCVideoStream [%s] %s:%d %s only supported in the daemon", v3);
  OUTLINED_FUNCTION_3();
}

- (void)setDirection:(int64_t)a3
{
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  uint64_t v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v12 = v5;
      v13 = 2080;
      v14 = "-[AVCVideoStream setDirection:]";
      v15 = 1024;
      v16 = 422;
      v17 = 2048;
      v18 = a3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d direction=%ld", buf, 0x26u);
    }
  }
  if (-[AVCMediaStreamConfig direction](-[AVCVideoStream configuration](self, "configuration"), "direction") != a3)
  {
    -[AVCMediaStreamConfig setDirection:](-[AVCVideoStream configuration](self, "configuration"), "setDirection:", a3);
    if (self->_shouldUseXPC)
    {
      v9 = CFSTR("vcMediaStreamDirection");
      v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v7 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v7, CFSTR("vcMediaStreamDictionary"), 0);
      -[AVConferenceXPCClient sendMessageAsync:arguments:](self->_connection, "sendMessageAsync:arguments:", "vcMediaStreamSetStreamDirection", v8);

    }
    else
    {
      -[VCMediaStream setStreamDirection:](self->_opaqueStream, "setStreamDirection:", +[AVCMediaStreamConfig streamDirectionWithClientDirection:](AVCMediaStreamConfig, "streamDirectionWithClientDirection:", a3));
    }
  }
}

- (int64_t)direction
{
  return -[AVCMediaStreamConfig direction](-[AVCVideoStream configuration](self, "configuration"), "direction");
}

- (void)setRtcpEnabled:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  uint64_t v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  _BOOL4 v18;
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v12 = v5;
      v13 = 2080;
      v14 = "-[AVCVideoStream setRtcpEnabled:]";
      v15 = 1024;
      v16 = 447;
      v17 = 1024;
      v18 = v3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d rtcpEnabled=%d", buf, 0x22u);
    }
  }
  if (-[AVCMediaStreamConfig isRTCPEnabled](-[AVCVideoStream configuration](self, "configuration"), "isRTCPEnabled") != v3)
  {
    -[AVCMediaStreamConfig setRtcpEnabled:](-[AVCVideoStream configuration](self, "configuration"), "setRtcpEnabled:", v3);
    if (self->_shouldUseXPC)
    {
      v9 = CFSTR("vcMediaStreamRTCPEnabled");
      v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
      v7 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v7, CFSTR("vcMediaStreamDictionary"), 0);
      -[AVConferenceXPCClient sendMessageAsync:arguments:](self->_connection, "sendMessageAsync:arguments:", "vcMediaStreamSetRTCPEnabled", v8);

    }
    else
    {
      -[VCMediaStream setRtcpEnabled:](self->_opaqueStream, "setRtcpEnabled:", v3);
    }
  }
}

- (BOOL)isRTCPEnabled
{
  return -[AVCMediaStreamConfig isRTCPEnabled](-[AVCVideoStream configuration](self, "configuration"), "isRTCPEnabled");
}

- (void)setRtpTimeOutEnabled:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  uint64_t v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  _BOOL4 v18;
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v12 = v5;
      v13 = 2080;
      v14 = "-[AVCVideoStream setRtpTimeOutEnabled:]";
      v15 = 1024;
      v16 = 473;
      v17 = 1024;
      v18 = v3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d rtpTimeOutEnabled=%d", buf, 0x22u);
    }
  }
  if (-[AVCMediaStreamConfig isRTPTimeOutEnabled](-[AVCVideoStream configuration](self, "configuration"), "isRTPTimeOutEnabled") != v3)
  {
    -[AVCMediaStreamConfig setRtpTimeOutEnabled:](-[AVCVideoStream configuration](self, "configuration"), "setRtpTimeOutEnabled:", v3);
    if (self->_shouldUseXPC)
    {
      v9 = CFSTR("vcMediaStreamRTPTimeoutEnabled");
      v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
      v7 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v7, CFSTR("vcMediaStreamDictionary"), 0);
      -[AVConferenceXPCClient sendMessageAsync:arguments:](self->_connection, "sendMessageAsync:arguments:", "vcMediaStreamSetRTPTimeoutEnabled", v8);

    }
    else
    {
      -[VCMediaStream setRtpTimeOutEnabled:](self->_opaqueStream, "setRtpTimeOutEnabled:", v3);
    }
  }
}

- (BOOL)isRTPTimeOutEnabled
{
  return -[AVCMediaStreamConfig isRTPTimeOutEnabled](-[AVCVideoStream configuration](self, "configuration"), "isRTPTimeOutEnabled");
}

- (void)setRtcpTimeOutEnabled:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  uint64_t v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  _BOOL4 v18;
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v12 = v5;
      v13 = 2080;
      v14 = "-[AVCVideoStream setRtcpTimeOutEnabled:]";
      v15 = 1024;
      v16 = 499;
      v17 = 1024;
      v18 = v3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d rtcpTimeOutEnabled=%d", buf, 0x22u);
    }
  }
  if (-[AVCMediaStreamConfig isRTCPTimeOutEnabled](-[AVCVideoStream configuration](self, "configuration"), "isRTCPTimeOutEnabled") != v3)
  {
    -[AVCMediaStreamConfig setRtcpTimeOutEnabled:](-[AVCVideoStream configuration](self, "configuration"), "setRtcpTimeOutEnabled:", v3);
    if (self->_shouldUseXPC)
    {
      v9 = CFSTR("vcMediaStreamRTCPTimeoutEnabled");
      v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
      v7 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v7, CFSTR("vcMediaStreamDictionary"), 0);
      -[AVConferenceXPCClient sendMessageAsync:arguments:](self->_connection, "sendMessageAsync:arguments:", "vcMediaStreamSetRTCPTimeoutEnabled", v8);

    }
    else
    {
      -[VCMediaStream setRtcpTimeOutEnabled:](self->_opaqueStream, "setRtcpTimeOutEnabled:", v3);
    }
  }
}

- (BOOL)isRTCPTimeOutEnabled
{
  return -[AVCMediaStreamConfig isRTCPTimeOutEnabled](-[AVCVideoStream configuration](self, "configuration"), "isRTCPTimeOutEnabled");
}

- (void)setRtpTimeOutIntervalSec:(double)a3
{
  uint64_t v5;
  NSObject *v6;
  double v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  uint64_t v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  double v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v13 = v5;
      v14 = 2080;
      v15 = "-[AVCVideoStream setRtpTimeOutIntervalSec:]";
      v16 = 1024;
      v17 = 525;
      v18 = 2048;
      v19 = a3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d rtpTimeOutIntervalSec=%f", buf, 0x26u);
    }
  }
  -[AVCMediaStreamConfig rtpTimeOutInterval](-[AVCVideoStream configuration](self, "configuration"), "rtpTimeOutInterval");
  if (v7 != a3)
  {
    -[AVCMediaStreamConfig setRtpTimeOutInterval:](-[AVCVideoStream configuration](self, "configuration"), "setRtpTimeOutInterval:", a3);
    if (self->_shouldUseXPC)
    {
      v10 = CFSTR("vcMediaStreamRTPTimeoutInterval");
      v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
      v8 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v8, CFSTR("vcMediaStreamDictionary"), 0);
      -[AVConferenceXPCClient sendMessageAsync:arguments:](self->_connection, "sendMessageAsync:arguments:", "vcMediaStreamSetRTPTimeoutInterval", v9);

    }
    else
    {
      -[VCMediaStream setRtpTimeOutInterval:](self->_opaqueStream, "setRtpTimeOutInterval:", a3);
    }
  }
}

- (double)rtpTimeOutIntervalSec
{
  double result;

  -[AVCMediaStreamConfig rtpTimeOutInterval](-[AVCVideoStream configuration](self, "configuration"), "rtpTimeOutInterval");
  return result;
}

- (void)setRtcpTimeOutIntervalSec:(double)a3
{
  uint64_t v5;
  NSObject *v6;
  double v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  uint64_t v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  double v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v13 = v5;
      v14 = 2080;
      v15 = "-[AVCVideoStream setRtcpTimeOutIntervalSec:]";
      v16 = 1024;
      v17 = 551;
      v18 = 2048;
      v19 = a3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d rtcpTimeOutIntervalSec=%f", buf, 0x26u);
    }
  }
  -[AVCMediaStreamConfig rtcpTimeOutInterval](-[AVCVideoStream configuration](self, "configuration"), "rtcpTimeOutInterval");
  if (v7 != a3)
  {
    -[AVCMediaStreamConfig setRtcpTimeOutInterval:](-[AVCVideoStream configuration](self, "configuration"), "setRtcpTimeOutInterval:", a3);
    if (self->_shouldUseXPC)
    {
      v10 = CFSTR("vcMediaStreamRTCPTimeoutInterval");
      v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
      v8 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v8, CFSTR("vcMediaStreamDictionary"), 0);
      -[AVConferenceXPCClient sendMessageAsync:arguments:](self->_connection, "sendMessageAsync:arguments:", "vcMediaStreamSetRTCPTimeoutInterval", v9);

    }
    else
    {
      -[VCMediaStream setRtcpTimeOutInterval:](self->_opaqueStream, "setRtcpTimeOutInterval:", a3);
    }
  }
}

- (double)rtcpTimeOutIntervalSec
{
  double result;

  -[AVCMediaStreamConfig rtcpTimeOutInterval](-[AVCVideoStream configuration](self, "configuration"), "rtcpTimeOutInterval");
  return result;
}

- (void)setRtcpSendIntervalSec:(double)a3
{
  uint64_t v5;
  NSObject *v6;
  double v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  uint64_t v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  double v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v13 = v5;
      v14 = 2080;
      v15 = "-[AVCVideoStream setRtcpSendIntervalSec:]";
      v16 = 1024;
      v17 = 577;
      v18 = 2048;
      v19 = a3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d rtcpSendIntervalSec=%f", buf, 0x26u);
    }
  }
  -[AVCMediaStreamConfig rtcpSendInterval](-[AVCVideoStream configuration](self, "configuration"), "rtcpSendInterval");
  if (v7 != a3)
  {
    -[AVCMediaStreamConfig setRtcpSendInterval:](-[AVCVideoStream configuration](self, "configuration"), "setRtcpSendInterval:", a3);
    if (self->_shouldUseXPC)
    {
      v10 = CFSTR("vcMediaStreamRTCPSendInterval");
      v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
      v8 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v8, CFSTR("vcMediaStreamDictionary"), 0);
      -[AVConferenceXPCClient sendMessageAsync:arguments:](self->_connection, "sendMessageAsync:arguments:", "vcMediaStreamSetRTCPSendInterval", v9);

    }
    else
    {
      -[VCMediaStream setRtcpSendInterval:](self->_opaqueStream, "setRtcpSendInterval:", a3);
    }
  }
}

- (double)rtcpSendIntervalSec
{
  double result;

  -[AVCMediaStreamConfig rtcpSendInterval](-[AVCVideoStream configuration](self, "configuration"), "rtcpSendInterval");
  return result;
}

- (AVCMediaStreamConfig)configuration
{
  return self->_configuration;
}

- (void)registerBlocksForDelegateNotifications
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[6];

  v17[5] = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
  v4 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __56__AVCVideoStream_registerBlocksForDelegateNotifications__block_invoke;
  v17[3] = &unk_1E9E52730;
  v17[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcMediaStreamDidServerDie", v17, self->_callbackQueue);
  v16[0] = v4;
  v16[1] = 3221225472;
  v16[2] = __56__AVCVideoStream_registerBlocksForDelegateNotifications__block_invoke_118;
  v16[3] = &unk_1E9E52730;
  v16[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcMediaStreamDidStartConnection", v16, self->_callbackQueue);
  v15[0] = v4;
  v15[1] = 3221225472;
  v15[2] = __56__AVCVideoStream_registerBlocksForDelegateNotifications__block_invoke_133;
  v15[3] = &unk_1E9E52730;
  v15[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcMediaStreamDidStopConnection", v15, self->_callbackQueue);
  v14[0] = v4;
  v14[1] = 3221225472;
  v14[2] = __56__AVCVideoStream_registerBlocksForDelegateNotifications__block_invoke_135;
  v14[3] = &unk_1E9E52730;
  v14[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcMediaStreamDidPause", v14, self->_callbackQueue);
  v13[0] = v4;
  v13[1] = 3221225472;
  v13[2] = __56__AVCVideoStream_registerBlocksForDelegateNotifications__block_invoke_141;
  v13[3] = &unk_1E9E52730;
  v13[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcMediaStreamDidResume", v13, self->_callbackQueue);
  v12[0] = v4;
  v12[1] = 3221225472;
  v12[2] = __56__AVCVideoStream_registerBlocksForDelegateNotifications__block_invoke_147;
  v12[3] = &unk_1E9E52730;
  v12[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcMediaStreamRTPPacketTimeout", v12, self->_callbackQueue);
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __56__AVCVideoStream_registerBlocksForDelegateNotifications__block_invoke_151;
  v11[3] = &unk_1E9E52730;
  v11[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcMediaStreamRTCPPacketTimeout", v11, self->_callbackQueue);
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __56__AVCVideoStream_registerBlocksForDelegateNotifications__block_invoke_155;
  v10[3] = &unk_1E9E52730;
  v10[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcMediaStreamDidRecoverFromRTCPTimeout", v10, self->_callbackQueue);
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __56__AVCVideoStream_registerBlocksForDelegateNotifications__block_invoke_159;
  v9[3] = &unk_1E9E52730;
  v9[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcMediaStreamRTCPPacketsReceived", v9, self->_callbackQueue);
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __56__AVCVideoStream_registerBlocksForDelegateNotifications__block_invoke_163;
  v8[3] = &unk_1E9E52730;
  v8[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcMediaStreamDidGetLastDecodedFrame", v8, self->_callbackQueue);
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __56__AVCVideoStream_registerBlocksForDelegateNotifications__block_invoke_170;
  v7[3] = &unk_1E9E52730;
  v7[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcMediaStreamDownlinkQualityDidChange", v7, self->_callbackQueue);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __56__AVCVideoStream_registerBlocksForDelegateNotifications__block_invoke_176;
  v6[3] = &unk_1E9E52730;
  v6[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcMediaStreamUplinkQualityDidChange", v6, self->_callbackQueue);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __56__AVCVideoStream_registerBlocksForDelegateNotifications__block_invoke_182;
  v5[3] = &unk_1E9E52730;
  v5[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcMediaStreamDidUpdateVideoConfiguration", v5, self->_callbackQueue);
}

void __56__AVCVideoStream_registerBlocksForDelegateNotifications__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  int ErrorLogLevelForModule;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(*(id *)(a1 + 32), "strong");
  if (v3)
  {
    v4 = (void *)v3;
    v5 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED"));
    ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (v5)
    {
      if (ErrorLogLevelForModule >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __56__AVCVideoStream_registerBlocksForDelegateNotifications__block_invoke_cold_2();
      }
    }
    else if (ErrorLogLevelForModule >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __56__AVCVideoStream_registerBlocksForDelegateNotifications__block_invoke_cold_1();
    }
    objc_msgSend(v4, "delegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCVideoStream-didServerDie");
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v11 = 136315906;
          v12 = v9;
          v13 = 2080;
          v14 = "-[AVCVideoStream registerBlocksForDelegateNotifications]_block_invoke";
          v15 = 1024;
          v16 = 624;
          v17 = 2048;
          v18 = v4;
          _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d @:@ AVCVideoStream-didServerDie (%p)", (uint8_t *)&v11, 0x26u);
        }
      }
      objc_msgSend((id)objc_msgSend(v4, "delegate"), "streamDidServerDie:", v4);
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315650;
      v12 = v7;
      v13 = 2080;
      v14 = "-[AVCVideoStream registerBlocksForDelegateNotifications]_block_invoke";
      v15 = 1024;
      v16 = 628;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d AVCVideoStream: Server died, but AVCVideoStream has already deallocated, NO-OP", (uint8_t *)&v11, 0x1Cu);
    }
  }
}

void __56__AVCVideoStream_registerBlocksForDelegateNotifications__block_invoke_118(uint64_t a1, void *a2, void *a3)
{
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int ErrorLogLevelForModule;
  os_log_t *v13;
  uint64_t v14;
  NSObject *v15;
  int v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  int v20;
  uint64_t v21;
  os_log_t v22;
  int v23;
  const char *v24;
  NSObject *v25;
  uint32_t v26;
  uint64_t v27;
  NSObject *v28;
  int v29;
  uint64_t v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  _QWORD v38[3];

  v38[2] = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      if (a2)
        v8 = (const char *)objc_msgSend((id)objc_msgSend(a2, "description"), "UTF8String");
      else
        v8 = "<nil>";
      v29 = 136316162;
      v30 = v6;
      v31 = 2080;
      v32 = "-[AVCVideoStream registerBlocksForDelegateNotifications]_block_invoke";
      v33 = 1024;
      v34 = 635;
      v35 = 2048;
      v36 = a3;
      v37 = 2080;
      v38[0] = v8;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d didStartConnectionBlock: error = %p, result = %s", (uint8_t *)&v29, 0x30u);
    }
  }
  if (!a3 && !objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    v9 = objc_msgSend(*(id *)(a1 + 32), "strong");
    if (v9)
    {
      v10 = (void *)v9;
      v11 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcMediaStreamConnectionStarted"));
      ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
      v13 = (os_log_t *)MEMORY[0x1E0CF2758];
      if (ErrorLogLevelForModule >= 7)
      {
        v14 = VRTraceErrorLogLevelToCSTR();
        v15 = *v13;
        if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
        {
          v16 = objc_msgSend(v11, "BOOLValue");
          v29 = 136315906;
          v30 = v14;
          v31 = 2080;
          v32 = "-[AVCVideoStream registerBlocksForDelegateNotifications]_block_invoke";
          v33 = 1024;
          v34 = 646;
          v35 = 1024;
          LODWORD(v36) = v16;
          _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d AVCVideoStream: didStartConnectionBlock strongSelf started(%d)", (uint8_t *)&v29, 0x22u);
        }
      }
      v17 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcMediaStreamError"));
      if (v17)
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("ERROR_DOMAIN")), (int)objc_msgSend((id)objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("ERROR_CODE")), "intValue"), objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("ERROR_USERINFO")));
      objc_msgSend(v10, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        MEMORY[0x1DF087EC4](&dword_1D8A54000, "Calling -stream:didStart:error:");
        MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCVideoStream-didStart");
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          v18 = VRTraceErrorLogLevelToCSTR();
          v19 = *v13;
          if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
          {
            v20 = objc_msgSend(v11, "intValue");
            v29 = 136316418;
            v30 = v18;
            v31 = 2080;
            v32 = "-[AVCVideoStream registerBlocksForDelegateNotifications]_block_invoke";
            v33 = 1024;
            v34 = 659;
            v35 = 2048;
            v36 = v10;
            v37 = 1024;
            LODWORD(v38[0]) = v20;
            WORD2(v38[0]) = 2112;
            *(_QWORD *)((char *)v38 + 6) = v17;
            _os_log_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d @:@ AVCVideoStream-didStart (%p) didSucceed=%d, error=%@", (uint8_t *)&v29, 0x36u);
          }
        }
        objc_msgSend((id)objc_msgSend(v10, "delegate"), "stream:didStart:error:", v10, objc_msgSend(v11, "BOOLValue"), v17);
      }

      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        return;
      v21 = VRTraceErrorLogLevelToCSTR();
      v22 = *v13;
      if (!os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
        return;
      v23 = objc_msgSend(v11, "BOOLValue");
      v29 = 136316162;
      v30 = v21;
      v31 = 2080;
      v32 = "-[AVCVideoStream registerBlocksForDelegateNotifications]_block_invoke";
      v33 = 1024;
      v34 = 664;
      v35 = 2048;
      v36 = v10;
      v37 = 1024;
      LODWORD(v38[0]) = v23;
      v24 = "AVCVideoStream [%s] %s:%d AVCVideoStream: notified client %p of didStart started[%d]";
      v25 = v22;
      v26 = 44;
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        return;
      v27 = VRTraceErrorLogLevelToCSTR();
      v28 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return;
      v29 = 136315650;
      v30 = v27;
      v31 = 2080;
      v32 = "-[AVCVideoStream registerBlocksForDelegateNotifications]_block_invoke";
      v33 = 1024;
      v34 = 640;
      v24 = "AVCVideoStream [%s] %s:%d AVCVideoStream: didStartConnectionBlock: strongSelf == nil";
      v25 = v28;
      v26 = 28;
    }
    _os_log_impl(&dword_1D8A54000, v25, OS_LOG_TYPE_DEFAULT, v24, (uint8_t *)&v29, v26);
  }
}

void __56__AVCVideoStream_registerBlocksForDelegateNotifications__block_invoke_133(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  int ErrorLogLevelForModule;
  os_log_t *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!a3 && !objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
    if (v4)
    {
      v5 = v4;
      objc_msgSend((id)objc_msgSend(v4, "delegate"), "streamDidStop:", v4);
      ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
      v7 = (os_log_t *)MEMORY[0x1E0CF2758];
      if (ErrorLogLevelForModule >= 6)
      {
        v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *v7;
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
        {
          v12 = 136315906;
          v13 = v8;
          v14 = 2080;
          v15 = "-[AVCVideoStream registerBlocksForDelegateNotifications]_block_invoke";
          v16 = 1024;
          v17 = 679;
          v18 = 2048;
          v19 = v5;
          _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d AVCVideoStream: notified client %p of didStop", (uint8_t *)&v12, 0x26u);
        }
      }
      MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCVideoStream-didStop");
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v10 = VRTraceErrorLogLevelToCSTR();
        v11 = *v7;
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
        {
          v12 = 136315906;
          v13 = v10;
          v14 = 2080;
          v15 = "-[AVCVideoStream registerBlocksForDelegateNotifications]_block_invoke";
          v16 = 1024;
          v17 = 680;
          v18 = 2048;
          v19 = v5;
          _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d @:@ AVCVideoStream-didStop (%p)", (uint8_t *)&v12, 0x26u);
        }
      }
    }
  }
}

void __56__AVCVideoStream_registerBlocksForDelegateNotifications__block_invoke_135(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (!a3 && !objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "strong");
    if (v5)
    {
      v6 = (void *)v5;
      v7 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcMediaStreamPaused"));
      v8 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcMediaStreamError"));
      if (v8)
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ERROR_DOMAIN")), (int)objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ERROR_CODE")), "intValue"), objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ERROR_USERINFO")));
      objc_msgSend(v6, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCVideoStream-didPause");
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          v9 = VRTraceErrorLogLevelToCSTR();
          v10 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v14 = 136316418;
            v15 = v9;
            v16 = 2080;
            v17 = "-[AVCVideoStream registerBlocksForDelegateNotifications]_block_invoke";
            v18 = 1024;
            v19 = 705;
            v20 = 2048;
            v21 = v6;
            v22 = 1024;
            v23 = objc_msgSend(v7, "intValue");
            v24 = 2112;
            v25 = v8;
            _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d @:@ AVCVideoStream-didPause (%p) didSucceed=%d, error=%@", (uint8_t *)&v14, 0x36u);
          }
        }
        objc_msgSend((id)objc_msgSend(v6, "delegate"), "stream:didPause:error:", v6, objc_msgSend(v7, "BOOLValue"), v8);
      }

      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v11 = VRTraceErrorLogLevelToCSTR();
        v12 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v13 = objc_msgSend(v7, "BOOLValue");
          v14 = 136316162;
          v15 = v11;
          v16 = 2080;
          v17 = "-[AVCVideoStream registerBlocksForDelegateNotifications]_block_invoke";
          v18 = 1024;
          v19 = 710;
          v20 = 2048;
          v21 = v6;
          v22 = 1024;
          v23 = v13;
          _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d AVCVideoStream: notified client %p of didPause [%d]", (uint8_t *)&v14, 0x2Cu);
        }
      }
    }
  }
}

void __56__AVCVideoStream_registerBlocksForDelegateNotifications__block_invoke_141(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (!a3 && !objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "strong");
    if (v5)
    {
      v6 = (void *)v5;
      v7 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcMediaStreamResumed"));
      v8 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcMediaStreamError"));
      if (v8)
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ERROR_DOMAIN")), (int)objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ERROR_CODE")), "intValue"), objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ERROR_USERINFO")));
      objc_msgSend(v6, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCVideoStream-didResume");
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          v9 = VRTraceErrorLogLevelToCSTR();
          v10 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v14 = 136316418;
            v15 = v9;
            v16 = 2080;
            v17 = "-[AVCVideoStream registerBlocksForDelegateNotifications]_block_invoke";
            v18 = 1024;
            v19 = 735;
            v20 = 2048;
            v21 = v6;
            v22 = 1024;
            v23 = objc_msgSend(v7, "intValue");
            v24 = 2112;
            v25 = v8;
            _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d @:@ AVCVideoStream-didResume (%p) didSucceed=%d, error=%@", (uint8_t *)&v14, 0x36u);
          }
        }
        objc_msgSend((id)objc_msgSend(v6, "delegate"), "stream:didResume:error:", v6, objc_msgSend(v7, "BOOLValue"), v8);
      }

      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v11 = VRTraceErrorLogLevelToCSTR();
        v12 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v13 = objc_msgSend(v7, "BOOLValue");
          v14 = 136316162;
          v15 = v11;
          v16 = 2080;
          v17 = "-[AVCVideoStream registerBlocksForDelegateNotifications]_block_invoke";
          v18 = 1024;
          v19 = 740;
          v20 = 2048;
          v21 = v6;
          v22 = 1024;
          v23 = v13;
          _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d AVCVideoStream: notified client %p of didResume [%d]", (uint8_t *)&v14, 0x2Cu);
        }
      }
    }
  }
}

void __56__AVCVideoStream_registerBlocksForDelegateNotifications__block_invoke_147(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!a3 && !objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
    if (v4)
    {
      v5 = v4;
      objc_msgSend(v4, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend((id)objc_msgSend(v5, "delegate"), "streamDidRTPTimeOut:", v5);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v6 = VRTraceErrorLogLevelToCSTR();
        v7 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v8 = 136315906;
          v9 = v6;
          v10 = 2080;
          v11 = "-[AVCVideoStream registerBlocksForDelegateNotifications]_block_invoke";
          v12 = 1024;
          v13 = 756;
          v14 = 2048;
          v15 = v5;
          _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d AVCVideoStream: notified client %p RTP packet timeout", (uint8_t *)&v8, 0x26u);
        }
      }
    }
  }
}

void __56__AVCVideoStream_registerBlocksForDelegateNotifications__block_invoke_151(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!a3 && !objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
    if (v4)
    {
      v5 = v4;
      objc_msgSend(v4, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend((id)objc_msgSend(v5, "delegate"), "streamDidRTCPTimeOut:", v5);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v6 = VRTraceErrorLogLevelToCSTR();
        v7 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v8 = 136315906;
          v9 = v6;
          v10 = 2080;
          v11 = "-[AVCVideoStream registerBlocksForDelegateNotifications]_block_invoke";
          v12 = 1024;
          v13 = 772;
          v14 = 2048;
          v15 = v5;
          _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d AVCVideoStream: notified client %p RTCP packet timeout", (uint8_t *)&v8, 0x26u);
        }
      }
    }
  }
}

void __56__AVCVideoStream_registerBlocksForDelegateNotifications__block_invoke_155(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!a3 && !objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
    if (v4)
    {
      v5 = v4;
      objc_msgSend(v4, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend((id)objc_msgSend(v5, "delegate"), "streamDidRecoverFromRTCPTimeOut:", v5);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v6 = VRTraceErrorLogLevelToCSTR();
        v7 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v8 = 136315906;
          v9 = v6;
          v10 = 2080;
          v11 = "-[AVCVideoStream registerBlocksForDelegateNotifications]_block_invoke";
          v12 = 1024;
          v13 = 788;
          v14 = 2048;
          v15 = v5;
          _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d AVCVideoStream: notified client=%p RTCP packet timeout", (uint8_t *)&v8, 0x26u);
        }
      }
    }
  }
}

void __56__AVCVideoStream_registerBlocksForDelegateNotifications__block_invoke_159(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!a3 && !objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
    if (v5)
    {
      v6 = v5;
      objc_msgSend(v5, "vcMediaStream:didReceiveRTCPPackets:", 0, objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcMediaStreamRTCPPackets")));
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v9 = 136315906;
          v10 = v7;
          v11 = 2080;
          v12 = "-[AVCVideoStream registerBlocksForDelegateNotifications]_block_invoke";
          v13 = 1024;
          v14 = 803;
          v15 = 2048;
          v16 = v6;
          _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d AVCVideoStream: notified client %p received RTCP packets", (uint8_t *)&v9, 0x26u);
        }
      }
    }
  }
}

void __56__AVCVideoStream_registerBlocksForDelegateNotifications__block_invoke_163(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  NSObject *v7;
  objc_class *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!a3 && !objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
    objc_msgSend(v5, "delegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend((id)objc_msgSend(v5, "delegate"), "stream:didGetLastDecodedFrame:", v5, objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcMediaStreamLastDecodedFrame")));
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v6 = VRTraceErrorLogLevelToCSTR();
        v7 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v8 = (objc_class *)objc_opt_class();
          v9 = 136316162;
          v10 = v6;
          v11 = 2080;
          v12 = "-[AVCVideoStream registerBlocksForDelegateNotifications]_block_invoke";
          v13 = 1024;
          v14 = 813;
          v15 = 2080;
          v16 = -[NSString UTF8String](NSStringFromClass(v8), "UTF8String");
          v17 = 2048;
          v18 = v5;
          _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d %s: notified client %p didGetLastDecodedFrame", (uint8_t *)&v9, 0x30u);
        }
      }
    }
  }
}

void __56__AVCVideoStream_registerBlocksForDelegateNotifications__block_invoke_170(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!a3 && !objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "strong");
    if (v5)
    {
      v6 = (void *)v5;
      v7 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcMediaStreamDownlinkQualityInfo"));
      objc_msgSend(v6, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend((id)objc_msgSend(v6, "delegate"), "stream:downlinkQualityDidChange:", v6, +[AVCVideoStream extractClientDownlinkQualityInfoDictionary:](AVCVideoStream, "extractClientDownlinkQualityInfoDictionary:", v7));
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v10 = 136316162;
          v11 = v8;
          v12 = 2080;
          v13 = "-[AVCVideoStream registerBlocksForDelegateNotifications]_block_invoke";
          v14 = 1024;
          v15 = 833;
          v16 = 2048;
          v17 = v6;
          v18 = 2080;
          v19 = objc_msgSend((id)objc_msgSend(v7, "description"), "UTF8String");
          _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d AVCVideoStream: notified client %p of downlinkQualityDidChange [%s]", (uint8_t *)&v10, 0x30u);
        }
      }
    }
  }
}

void __56__AVCVideoStream_registerBlocksForDelegateNotifications__block_invoke_176(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!a3 && !objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "strong");
    if (v5)
    {
      v6 = (void *)v5;
      v7 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcMediaStreamUplinkQualityInfo"));
      objc_msgSend(v6, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend((id)objc_msgSend(v6, "delegate"), "stream:uplinkQualityDidChange:", v6, +[AVCVideoStream extractClientUplinkQualityInfoDictionary:](AVCVideoStream, "extractClientUplinkQualityInfoDictionary:", v7));
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v10 = 136316162;
          v11 = v8;
          v12 = 2080;
          v13 = "-[AVCVideoStream registerBlocksForDelegateNotifications]_block_invoke";
          v14 = 1024;
          v15 = 852;
          v16 = 2048;
          v17 = v6;
          v18 = 2080;
          v19 = objc_msgSend((id)objc_msgSend(v7, "description"), "UTF8String");
          _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d AVCVideoStream: notified client %p of uplinkQualityDidChange [%s]", (uint8_t *)&v10, 0x30u);
        }
      }
    }
  }
}

void __56__AVCVideoStream_registerBlocksForDelegateNotifications__block_invoke_182(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!a3 && !objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "strong");
    if (v5)
    {
      v6 = (void *)v5;
      v7 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcMediaStreamDidUpdateVideoConfiguration"));
      v8 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcMediaStreamError"));
      v9 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcMediaStreamUpdatedVideoConfiguration"));
      if (v8)
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ERROR_DOMAIN")), (int)objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ERROR_CODE")), "intValue"), objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ERROR_USERINFO")));
      if (v9)
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "configuration"), "video"), "setUpWithDictionary:", v9);
      objc_msgSend(v6, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend((id)objc_msgSend(v6, "delegate"), "stream:didUpdateVideoConfiguration:error:", v6, objc_msgSend(v7, "BOOLValue"), v8);

      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v10 = VRTraceErrorLogLevelToCSTR();
        v11 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v12 = 136316162;
          v13 = v10;
          v14 = 2080;
          v15 = "-[AVCVideoStream registerBlocksForDelegateNotifications]_block_invoke";
          v16 = 1024;
          v17 = 886;
          v18 = 2048;
          v19 = v6;
          v20 = 1024;
          v21 = objc_msgSend(v7, "BOOLValue");
          _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d AVCVideoStream: notified client %p of didUpdateVideoConfiguration [%d]", (uint8_t *)&v12, 0x2Cu);
        }
      }
    }
  }
}

- (void)deregisterBlocksForDelegateNotifications
{
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcMediaStreamDidStartConnection");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcMediaStreamDidStopConnection");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcMediaStreamDidPause");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcMediaStreamDidResume");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcMediaStreamRTPPacketTimeout");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcMediaStreamRTCPPacketTimeout");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcMediaStreamDidRecoverFromRTCPTimeout");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcMediaStreamRTCPPacketsReceived");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcMediaStreamDidGetLastDecodedFrame");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcMediaStreamDownlinkQualityDidChange");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcMediaStreamUplinkQualityDidChange");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcMediaStreamDidUpdateVideoConfiguration");
}

+ (id)extractClientDownlinkQualityInfoDictionary:(id)a3
{
  _QWORD v5[4];
  _QWORD v6[5];

  v6[4] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("avcKeyVideoStreamDownlinkOperatingBitrate");
  v6[0] = objc_msgSend(a3, "objectForKeyedSubscript:", 0x1E9E623E0);
  v5[1] = CFSTR("avcKeyVideoStreamDownlinkOptimalBitrate");
  v6[1] = objc_msgSend(a3, "objectForKeyedSubscript:", 0x1E9E623C0);
  v5[2] = CFSTR("avcKeyVideoStreamDownlinkIsOperatingAtMaxBitrate");
  v6[2] = objc_msgSend(a3, "objectForKeyedSubscript:", 0x1E9E62400);
  v5[3] = CFSTR("avcKeyVideoStreamDownlinkIsOperatingAtMinBitrate");
  v6[3] = objc_msgSend(a3, "objectForKeyedSubscript:", 0x1E9E62420);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 4);
}

+ (id)extractClientUplinkQualityInfoDictionary:(id)a3
{
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("avcKeyVideoStreamUplinkOperatingBitrate");
  v5[0] = objc_msgSend(a3, "objectForKeyedSubscript:", 0x1E9E62440);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
}

- (void)vcMediaStream:(id)a3 didStartStream:(BOOL)a4 error:(id)a5
{
  _BOOL8 v6;
  uint64_t v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  id v18;
  __int16 v19;
  _BOOL4 v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v6 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136316418;
      v12 = v9;
      v13 = 2080;
      v14 = "-[AVCVideoStream vcMediaStream:didStartStream:error:]";
      v15 = 1024;
      v16 = 923;
      v17 = 2112;
      v18 = a3;
      v19 = 1024;
      v20 = v6;
      v21 = 2112;
      v22 = a5;
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d stream=%@, didStartStream=%d, error=%@", (uint8_t *)&v11, 0x36u);
    }
  }
  -[AVCVideoStream delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    MEMORY[0x1DF087EC4](&dword_1D8A54000, "Calling -stream:didStart:error:");
    -[AVCVideoStreamDelegate stream:didStart:error:](-[AVCVideoStream delegate](self, "delegate"), "stream:didStart:error:", self, v6, a5);
  }
}

- (void)vcMediaStreamDidStop:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315906;
      v8 = v5;
      v9 = 2080;
      v10 = "-[AVCVideoStream vcMediaStreamDidStop:]";
      v11 = 1024;
      v12 = 931;
      v13 = 2112;
      v14 = a3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d stream=%@", (uint8_t *)&v7, 0x26u);
    }
  }
  -[AVCVideoStream delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    MEMORY[0x1DF087EC4](&dword_1D8A54000, "Calling -streamDidStop:");
    -[AVCVideoStreamDelegate streamDidStop:](-[AVCVideoStream delegate](self, "delegate"), "streamDidStop:", self);
  }
}

- (void)vcMediaStream:(id)a3 didPauseStream:(BOOL)a4 error:(id)a5
{
  _BOOL8 v6;
  uint64_t v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  id v18;
  __int16 v19;
  _BOOL4 v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v6 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136316418;
      v12 = v9;
      v13 = 2080;
      v14 = "-[AVCVideoStream vcMediaStream:didPauseStream:error:]";
      v15 = 1024;
      v16 = 939;
      v17 = 2112;
      v18 = a3;
      v19 = 1024;
      v20 = v6;
      v21 = 2112;
      v22 = a5;
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d stream=%@, didPauseStream=%d, error=%@", (uint8_t *)&v11, 0x36u);
    }
  }
  -[AVCVideoStream delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[AVCVideoStreamDelegate stream:didPause:error:](-[AVCVideoStream delegate](self, "delegate"), "stream:didPause:error:", self, v6, a5);
}

- (void)vcMediaStream:(id)a3 didResumeStream:(BOOL)a4 error:(id)a5
{
  _BOOL8 v6;
  uint64_t v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  id v18;
  __int16 v19;
  _BOOL4 v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v6 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136316418;
      v12 = v9;
      v13 = 2080;
      v14 = "-[AVCVideoStream vcMediaStream:didResumeStream:error:]";
      v15 = 1024;
      v16 = 946;
      v17 = 2112;
      v18 = a3;
      v19 = 1024;
      v20 = v6;
      v21 = 2112;
      v22 = a5;
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d stream=%@, didResumeStream=%d, error=%@", (uint8_t *)&v11, 0x36u);
    }
  }
  -[AVCVideoStream delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[AVCVideoStreamDelegate stream:didResume:error:](-[AVCVideoStream delegate](self, "delegate"), "stream:didResume:error:", self, v6, a5);
}

- (void)vcMediaStreamDidRTPTimeOut:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315906;
      v8 = v5;
      v9 = 2080;
      v10 = "-[AVCVideoStream vcMediaStreamDidRTPTimeOut:]";
      v11 = 1024;
      v12 = 953;
      v13 = 2112;
      v14 = a3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d stream=%@", (uint8_t *)&v7, 0x26u);
    }
  }
  -[AVCVideoStream delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[AVCVideoStreamDelegate streamDidRTPTimeOut:](-[AVCVideoStream delegate](self, "delegate"), "streamDidRTPTimeOut:", self);
}

- (void)vcMediaStreamDidRTCPTimeOut:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315906;
      v8 = v5;
      v9 = 2080;
      v10 = "-[AVCVideoStream vcMediaStreamDidRTCPTimeOut:]";
      v11 = 1024;
      v12 = 960;
      v13 = 2112;
      v14 = a3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d stream=%@", (uint8_t *)&v7, 0x26u);
    }
  }
  -[AVCVideoStream delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[AVCVideoStreamDelegate streamDidRTCPTimeOut:](-[AVCVideoStream delegate](self, "delegate"), "streamDidRTCPTimeOut:", self);
}

- (void)vcMediaStream:(id)a3 didReceiveRTCPPackets:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  _BYTE v25[128];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v7 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v26, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v27;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(a4);
        v11 = +[AVCRTCPPacket newPacketWithRTCPPacket:packetLength:](AVCRTCPPacket, "newPacketWithRTCPPacket:packetLength:", objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v10), "bytes"), objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v10), "length"));
        if (v11)
          objc_msgSend(v6, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v26, v25, 16);
    }
    while (v8);
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v16 = v12;
      v17 = 2080;
      v18 = "-[AVCVideoStream vcMediaStream:didReceiveRTCPPackets:]";
      v19 = 1024;
      v20 = 979;
      v21 = 2112;
      v22 = a3;
      v23 = 2112;
      v24 = a4;
      _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d conf=%@, rtcpPackets=%@", buf, 0x30u);
    }
  }
  -[AVCVideoStream delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[AVCVideoStreamDelegate stream:didReceiveRTCPPackets:](-[AVCVideoStream delegate](self, "delegate"), "stream:didReceiveRTCPPackets:", self, v6);

}

- (void)vcMediaStream:(id)a3 downlinkQualityDidChange:(id)a4
{
  uint64_t v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136316162;
      v10 = v7;
      v11 = 2080;
      v12 = "-[AVCVideoStream vcMediaStream:downlinkQualityDidChange:]";
      v13 = 1024;
      v14 = 988;
      v15 = 2112;
      v16 = a3;
      v17 = 2112;
      v18 = a4;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d stream=%@, downlinkQualityInfo=%@", (uint8_t *)&v9, 0x30u);
    }
  }
  -[AVCVideoStream delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[AVCVideoStreamDelegate stream:downlinkQualityDidChange:](-[AVCVideoStream delegate](self, "delegate"), "stream:downlinkQualityDidChange:", self, +[AVCVideoStream extractClientDownlinkQualityInfoDictionary:](AVCVideoStream, "extractClientDownlinkQualityInfoDictionary:", a4));
}

- (void)vcMediaStream:(id)a3 uplinkQualityDidChange:(id)a4
{
  uint64_t v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136316162;
      v10 = v7;
      v11 = 2080;
      v12 = "-[AVCVideoStream vcMediaStream:uplinkQualityDidChange:]";
      v13 = 1024;
      v14 = 995;
      v15 = 2112;
      v16 = a3;
      v17 = 2112;
      v18 = a4;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d stream=%@, uplinkQualityInfo=%@", (uint8_t *)&v9, 0x30u);
    }
  }
  -[AVCVideoStream delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[AVCVideoStreamDelegate stream:uplinkQualityDidChange:](-[AVCVideoStream delegate](self, "delegate"), "stream:uplinkQualityDidChange:", self, +[AVCVideoStream extractClientUplinkQualityInfoDictionary:](AVCVideoStream, "extractClientUplinkQualityInfoDictionary:", a4));
}

- (void)vcMediaStream:(id)a3 didUpdateVideoConfiguration:(BOOL)a4 error:(id)a5 dictionary:(id)a6
{
  _BOOL8 v8;
  const char *v11;
  const char *v12;
  const char *v13;
  char *v14;
  os_log_t *v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  char *__lasts;
  char *__str;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  char *v30;
  uint64_t v31;

  v8 = a4;
  v31 = *MEMORY[0x1E0C80C00];
  if (a6 && a4)
    -[AVCVideoStreamConfig setUpWithDictionary:](-[AVCMediaStreamConfig video](-[AVCVideoStream configuration](self, "configuration"), "video"), "setUpWithDictionary:", a6);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    __str = 0;
    if (a3)
    {
      v11 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
      if (a5)
        goto LABEL_7;
    }
    else
    {
      v11 = "<nil>";
      if (a5)
      {
LABEL_7:
        v12 = (const char *)objc_msgSend((id)objc_msgSend(a5, "description"), "UTF8String");
        if (a6)
        {
LABEL_8:
          v13 = (const char *)objc_msgSend((id)objc_msgSend(a6, "description"), "UTF8String");
          goto LABEL_12;
        }
LABEL_11:
        v13 = "<nil>";
LABEL_12:
        asprintf(&__str, "stream=%s, didUpdateVideoConfiguration=%d, error=%s, configDict=%s", v11, v8, v12, v13);
        if (__str)
        {
          v18 = a5;
          __lasts = 0;
          v14 = strtok_r(__str, "\n", &__lasts);
          v15 = (os_log_t *)MEMORY[0x1E0CF2758];
          do
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
            {
              v16 = VRTraceErrorLogLevelToCSTR();
              v17 = *v15;
              if (os_log_type_enabled(*v15, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136316162;
                v22 = v16;
                v23 = 2080;
                v24 = "-[AVCVideoStream vcMediaStream:didUpdateVideoConfiguration:error:dictionary:]";
                v25 = 1024;
                v26 = 1005;
                v27 = 2080;
                v28 = "";
                v29 = 2080;
                v30 = v14;
                _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d %s %s", buf, 0x30u);
              }
            }
            v14 = strtok_r(0, "\n", &__lasts);
          }
          while (v14);
          free(__str);
          a5 = v18;
        }
        goto LABEL_19;
      }
    }
    v12 = "<nil>";
    if (a6)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_19:
  -[AVCVideoStream delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[AVCVideoStreamDelegate stream:didUpdateVideoConfiguration:error:](-[AVCVideoStream delegate](self, "delegate"), "stream:didUpdateVideoConfiguration:error:", self, v8, a5);
}

- (void)vcMediaStreamServerDidDie:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315906;
      v8 = v5;
      v9 = 2080;
      v10 = "-[AVCVideoStream vcMediaStreamServerDidDie:]";
      v11 = 1024;
      v12 = 1016;
      v13 = 2112;
      v14 = a3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVCVideoStream [%s] %s:%d stream=%@, serverDidDie", (uint8_t *)&v7, 0x26u);
    }
  }
  -[AVCVideoStream stop](self, "stop");
}

+ (id)capabilities
{
  return +[VCVideoStream capabilities](VCVideoStream, "capabilities");
}

- (int64_t)streamToken
{
  return self->_streamToken;
}

- (NSDictionary)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (void)initWithLocalAddress:networkSockets:IDSDestination:connectionClientID:callID:options:error:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVCVideoStream [%s] %s:%d AVCVideoStream: error initializing... no results dict", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithLocalAddress:(NSObject *)a3 networkSockets:IDSDestination:connectionClientID:callID:options:error:.cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  __int16 v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7[14];
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_msgSend(a2, "description"), "UTF8String");
  OUTLINED_FUNCTION_12_0();
  v8 = "-[AVCVideoStream initWithLocalAddress:networkSockets:IDSDestination:connectionClientID:callID:options:error:]";
  v9 = 1024;
  v10 = 165;
  v11 = v4;
  v12 = v5;
  OUTLINED_FUNCTION_11(&dword_1D8A54000, a3, v6, "AVCVideoStream [%s] %s:%d AVCVideoStream: error initializing no capabilities dict result[%s]", v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)initWithLocalAddress:networkSockets:IDSDestination:connectionClientID:callID:options:error:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVCVideoStream [%s] %s:%d AVCVideoStream: error initializing... return stream token failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithLocalAddress:networkSockets:IDSDestination:connectionClientID:callID:options:error:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVCVideoStream [%s] %s:%d AVCVideoStream: clientSessionID in the options is not of NSUUIDtype", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)configure:(NSObject *)a3 error:.cold.1(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v4;
  uint8_t v5[40];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (*a2)
    objc_msgSend((id)objc_msgSend(*a2, "description"), "UTF8String");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4_10();
  OUTLINED_FUNCTION_11(&dword_1D8A54000, a3, v4, "AVCVideoStream [%s] %s:%d Invalid video configuration: error[%s]", v5);
  OUTLINED_FUNCTION_3_0();
}

- (void)configure:(NSObject *)a3 error:.cold.2(uint64_t a1, id *a2, NSObject *a3)
{
  uint8_t v4[40];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (*a2)
    objc_msgSend((id)objc_msgSend(*a2, "description"), "UTF8String");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4_10();
  _os_log_fault_impl(&dword_1D8A54000, a3, OS_LOG_TYPE_FAULT, "AVCVideoStream [%s] %s:%d Invalid video configuration: error[%s]", v4, 0x26u);
  OUTLINED_FUNCTION_3_0();
}

void __56__AVCVideoStream_registerBlocksForDelegateNotifications__block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVCVideoStream [%s] %s:%d AVCVideoStream: Media server died, notifying client", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __56__AVCVideoStream_registerBlocksForDelegateNotifications__block_invoke_cold_2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVCVideoStream [%s] %s:%d AVCVideoStream: AVC server died, notifying client", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
