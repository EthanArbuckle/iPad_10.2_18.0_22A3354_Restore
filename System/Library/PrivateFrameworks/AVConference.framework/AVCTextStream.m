@implementation AVCTextStream

- (AVCTextStream)initWithNetworkSockets:(id)a3 callID:(id)a4 error:(id *)a5
{
  uint64_t v9;
  NSObject *v10;
  const __CFString *v11;
  AVCTextStream *v12;
  AVCTextStream *v13;
  NSObject *CustomRootQueue;
  dispatch_queue_t v15;
  AVConferenceXPCClient *v16;
  uint64_t v17;
  NSObject *v18;
  pid_t v19;
  int streamToken;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  uint64_t v25;
  NSObject *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  objc_super v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  id v41;
  __int16 v42;
  _BYTE v43[20];
  __int16 v44;
  const __CFString *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      if (a5)
        v11 = (const __CFString *)*a5;
      else
        v11 = CFSTR("nil");
      *(_DWORD *)buf = 136316418;
      v35 = v9;
      v36 = 2080;
      v37 = "-[AVCTextStream initWithNetworkSockets:callID:error:]";
      v38 = 1024;
      v39 = 58;
      v40 = 2112;
      v41 = a3;
      v42 = 2112;
      *(_QWORD *)v43 = a4;
      *(_WORD *)&v43[8] = 2112;
      *(_QWORD *)&v43[10] = v11;
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d socketsDictionary=%@, callID=%@, error=%@", buf, 0x3Au);
    }
  }
  v33.receiver = self;
  v33.super_class = (Class)AVCTextStream;
  v12 = -[AVCTextStream init](&v33, sel_init);
  if (!v12)
    goto LABEL_47;
  v13 = v12;
  -[AVCTextStream refreshLoggingParameters](v12, "refreshLoggingParameters");
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
  v15 = dispatch_queue_create_with_target_V2("com.apple.AVConference.avctextstream.callback.queue", 0, CustomRootQueue);
  v13->_queue = (OS_dispatch_queue *)v15;
  if (!v15)
  {
    if ((AVCTextStream *)objc_opt_class() == v13)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCTextStream initWithNetworkSockets:callID:error:].cold.1();
      }
      goto LABEL_46;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v22 = (const __CFString *)-[AVCTextStream performSelector:](v13, "performSelector:", sel_logPrefix);
    else
      v22 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_46;
    v25 = VRTraceErrorLogLevelToCSTR();
    v26 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_46;
    *(_DWORD *)buf = 136316162;
    v35 = v25;
    v36 = 2080;
    v37 = "-[AVCTextStream initWithNetworkSockets:callID:error:]";
    v38 = 1024;
    v39 = 64;
    v40 = 2112;
    v41 = (id)v22;
    v42 = 2048;
    *(_QWORD *)v43 = v13;
    v27 = "AVCTextStream [%s] %s:%d %@(%p) Failed to allocate callback queue";
    goto LABEL_53;
  }
  v16 = objc_alloc_init(AVConferenceXPCClient);
  v13->_connection = v16;
  if (!v16)
  {
    if ((AVCTextStream *)objc_opt_class() == v13)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCTextStream initWithNetworkSockets:callID:error:].cold.2();
      }
      goto LABEL_46;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v23 = (const __CFString *)-[AVCTextStream performSelector:](v13, "performSelector:", sel_logPrefix);
    else
      v23 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_46;
    v28 = VRTraceErrorLogLevelToCSTR();
    v26 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_46;
    *(_DWORD *)buf = 136316162;
    v35 = v28;
    v36 = 2080;
    v37 = "-[AVCTextStream initWithNetworkSockets:callID:error:]";
    v38 = 1024;
    v39 = 69;
    v40 = 2112;
    v41 = (id)v23;
    v42 = 2048;
    *(_QWORD *)v43 = v13;
    v27 = "AVCTextStream [%s] %s:%d %@(%p) Failed to allocate callback XPC connection";
LABEL_53:
    _os_log_error_impl(&dword_1D8A54000, v26, OS_LOG_TYPE_ERROR, v27, buf, 0x30u);
    goto LABEL_46;
  }
  -[AVCTextStream registerBlocksForDelegateNotifications](v13, "registerBlocksForDelegateNotifications");
  if (-[AVCTextStream initializeServerWithNetworkSockets:callID:error:](v13, "initializeServerWithNetworkSockets:callID:error:", a3, a4, a5))
  {
    MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCTextStream-init");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v19 = getpid();
        streamToken = v13->_streamToken;
        if (a5)
          v21 = (const __CFString *)*a5;
        else
          v21 = CFSTR("None");
        *(_DWORD *)buf = 136316930;
        v35 = v17;
        v36 = 2080;
        v37 = "-[AVCTextStream initWithNetworkSockets:callID:error:]";
        v38 = 1024;
        v39 = 94;
        v40 = 2048;
        v41 = v13;
        v42 = 1024;
        *(_DWORD *)v43 = v19;
        *(_WORD *)&v43[4] = 2112;
        *(_QWORD *)&v43[6] = a4;
        *(_WORD *)&v43[14] = 1024;
        *(_DWORD *)&v43[16] = streamToken;
        v44 = 2112;
        v45 = v21;
        _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d @:@ AVCTextStream-init (%p) PID=%d, callID=%@, streamToken=%d, error=%@", buf, 0x46u);
      }
    }
    return v13;
  }
  if ((AVCTextStream *)objc_opt_class() == v13)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCTextStream initWithNetworkSockets:callID:error:].cold.3();
    }
    goto LABEL_46;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v24 = (const __CFString *)-[AVCTextStream performSelector:](v13, "performSelector:", sel_logPrefix);
  else
    v24 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v29 = VRTraceErrorLogLevelToCSTR();
    v26 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v35 = v29;
      v36 = 2080;
      v37 = "-[AVCTextStream initWithNetworkSockets:callID:error:]";
      v38 = 1024;
      v39 = 74;
      v40 = 2112;
      v41 = (id)v24;
      v42 = 2048;
      *(_QWORD *)v43 = v13;
      v27 = "AVCTextStream [%s] %s:%d %@(%p) Failed to instantiate servers side object";
      goto LABEL_53;
    }
  }
LABEL_46:

LABEL_47:
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCTextStream-init");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v30 = VRTraceErrorLogLevelToCSTR();
    v31 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v35 = v30;
      v36 = 2080;
      v37 = "-[AVCTextStream initWithNetworkSockets:callID:error:]";
      v38 = 1024;
      v39 = 96;
      v40 = 2048;
      v41 = 0;
      _os_log_impl(&dword_1D8A54000, v31, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d @:@ AVCTextStream-init (%p)", buf, 0x26u);
    }
  }
  return 0;
}

- (AVCTextStream)initWithRTPNWConnectionClientID:(id)a3 rtcpNWConnectionClientID:(id)a4 options:(id)a5 error:(id *)a6
{
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  __CFString *v16;
  const char *v17;
  AVCTextStream *v18;
  AVCTextStream *v19;
  id v20;
  uint64_t v21;
  int v22;
  int v23;
  const __CFString *v24;
  const __CFString *v25;
  uint64_t v26;
  NSObject *v27;
  const char *v28;
  const char *v29;
  NSObject *v30;
  uint32_t v31;
  uint64_t v32;
  NSObject *v33;
  const char *v34;
  uint64_t v35;
  NSObject *CustomRootQueue;
  dispatch_queue_t v37;
  const __CFString *v38;
  uint64_t v39;
  NSObject *v40;
  pid_t v41;
  int streamToken;
  const __CFString *v43;
  uint64_t v44;
  NSObject *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  const __CFString *v51;
  const __CFString *v52;
  uint64_t v53;
  const __CFString *v54;
  uint64_t v55;
  NSObject *v56;
  uint64_t v57;
  uint64_t v58;
  objc_super v59;
  uint8_t buf[4];
  uint64_t v61;
  __int16 v62;
  const char *v63;
  __int16 v64;
  int v65;
  __int16 v66;
  uint64_t v67;
  __int16 v68;
  _BYTE v69[20];
  _DWORD v70[5];

  *(_QWORD *)&v70[3] = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_msgSend(a3, "UUIDString");
      v14 = objc_msgSend(a4, "UUIDString");
      if (a5)
      {
        v15 = (const char *)objc_msgSend((id)objc_msgSend(a5, "description"), "UTF8String");
        if (a6)
          goto LABEL_5;
      }
      else
      {
        v15 = "<nil>";
        if (a6)
        {
LABEL_5:
          v16 = (__CFString *)*a6;
          if (!*a6)
          {
            v17 = "<nil>";
LABEL_10:
            *(_DWORD *)buf = 136316674;
            v61 = v11;
            v62 = 2080;
            v63 = "-[AVCTextStream initWithRTPNWConnectionClientID:rtcpNWConnectionClientID:options:error:]";
            v64 = 1024;
            v65 = 125;
            v66 = 2112;
            v67 = v13;
            v68 = 2112;
            *(_QWORD *)v69 = v14;
            *(_WORD *)&v69[8] = 2080;
            *(_QWORD *)&v69[10] = v15;
            *(_WORD *)&v69[18] = 2080;
            *(_QWORD *)v70 = v17;
            _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d rtpClientID=%@, rtcpClientID=%@, options=%s, error=%s", buf, 0x44u);
            goto LABEL_11;
          }
LABEL_9:
          v17 = (const char *)objc_msgSend((id)-[__CFString description](v16, "description"), "UTF8String");
          goto LABEL_10;
        }
      }
      v16 = CFSTR("nil");
      goto LABEL_9;
    }
  }
LABEL_11:
  v59.receiver = self;
  v59.super_class = (Class)AVCTextStream;
  v18 = -[AVCTextStream init](&v59, sel_init);
  if (!v18)
    goto LABEL_69;
  v19 = v18;
  v20 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (!v20)
  {
    if ((AVCTextStream *)objc_opt_class() == v19)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCTextStream initWithRTPNWConnectionClientID:rtcpNWConnectionClientID:options:error:].cold.1();
      }
      goto LABEL_68;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v51 = (const __CFString *)-[AVCTextStream performSelector:](v19, "performSelector:", sel_logPrefix);
    else
      v51 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_68;
    v53 = VRTraceErrorLogLevelToCSTR();
    v45 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_68;
    *(_DWORD *)buf = 136316162;
    v61 = v53;
    v62 = 2080;
    v63 = "-[AVCTextStream initWithRTPNWConnectionClientID:rtcpNWConnectionClientID:options:error:]";
    v64 = 1024;
    v65 = 129;
    v66 = 2112;
    v67 = (uint64_t)v51;
    v68 = 2048;
    *(_QWORD *)v69 = v19;
    v46 = "AVCTextStream [%s] %s:%d %@(%p) Failed to allocate clientArgs dictionary";
    goto LABEL_77;
  }
  if (objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("avcMediaStreamOptionCallID")))
    v21 = objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("avcMediaStreamOptionCallID"));
  else
    v21 = 0;
  if (objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("avcMediaStreamOptionIsOriginator")))
    objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("avcMediaStreamOptionIsOriginator")), "BOOLValue");
  v22 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("avcMediaStreamOptionRunInProcess")), "BOOLValue");
  if (!a3)
  {
    if (a6)
      *a6 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "AVConferenceServiceError:detailCode:description:", 32000, 0, CFSTR("rtpClientID cannot not be nil"));
    if ((AVCTextStream *)objc_opt_class() == v19)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCTextStream initWithRTPNWConnectionClientID:rtcpNWConnectionClientID:options:error:].cold.2();
      }
      goto LABEL_68;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v25 = (const __CFString *)-[AVCTextStream performSelector:](v19, "performSelector:", sel_logPrefix);
    else
      v25 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_68;
    v44 = VRTraceErrorLogLevelToCSTR();
    v45 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_68;
    *(_DWORD *)buf = 136316162;
    v61 = v44;
    v62 = 2080;
    v63 = "-[AVCTextStream initWithRTPNWConnectionClientID:rtcpNWConnectionClientID:options:error:]";
    v64 = 1024;
    v65 = 132;
    v66 = 2112;
    v67 = (uint64_t)v25;
    v68 = 2048;
    *(_QWORD *)v69 = v19;
    v46 = "AVCTextStream [%s] %s:%d %@(%p) Failed to initialize AVCTextStream because of invalid parameters";
    goto LABEL_77;
  }
  v23 = v22;
  v58 = v21;
  if ((AVCTextStream *)objc_opt_class() == v19)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v26 = VRTraceErrorLogLevelToCSTR();
      v27 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v28 = "out of";
        v61 = v26;
        *(_DWORD *)buf = 136315906;
        v63 = "-[AVCTextStream initWithRTPNWConnectionClientID:rtcpNWConnectionClientID:options:error:]";
        v62 = 2080;
        if (v23)
          v28 = "in";
        v64 = 1024;
        v65 = 134;
        v66 = 2080;
        v67 = (uint64_t)v28;
        v29 = "AVCTextStream [%s] %s:%d AVCTextStream will run %s process";
        v30 = v27;
        v31 = 38;
        goto LABEL_38;
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v24 = (const __CFString *)-[AVCTextStream performSelector:](v19, "performSelector:", sel_logPrefix);
    else
      v24 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v32 = VRTraceErrorLogLevelToCSTR();
      v33 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v34 = "out of";
        v61 = v32;
        *(_DWORD *)buf = 136316418;
        v63 = "-[AVCTextStream initWithRTPNWConnectionClientID:rtcpNWConnectionClientID:options:error:]";
        v62 = 2080;
        if (v23)
          v34 = "in";
        v64 = 1024;
        v65 = 134;
        v66 = 2112;
        v67 = (uint64_t)v24;
        v68 = 2048;
        *(_QWORD *)v69 = v19;
        *(_WORD *)&v69[8] = 2080;
        *(_QWORD *)&v69[10] = v34;
        v29 = "AVCTextStream [%s] %s:%d %@(%p) AVCTextStream will run %s process";
        v30 = v33;
        v31 = 58;
LABEL_38:
        _os_log_impl(&dword_1D8A54000, v30, OS_LOG_TYPE_DEFAULT, v29, buf, v31);
      }
    }
  }
  -[AVCTextStream refreshLoggingParameters](v19, "refreshLoggingParameters");
  objc_msgSend(v20, "setObject:forKeyedSubscript:", objc_msgSend(a3, "UUIDString"), CFSTR("vcMediaStreamConnectionClientID"));
  if (a4)
    objc_msgSend(v20, "setObject:forKeyedSubscript:", objc_msgSend(a4, "UUIDString"), CFSTR("vcMediaStreamRTCPConnectionClientID"));
  v35 = v58;
  if (v58)
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v58, CFSTR("vcMediaStreamCallID"));
  if (objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("avcMediaStreamOptionRemoteEndpointInfo")))
    objc_msgSend(v20, "setObject:forKeyedSubscript:", objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("avcMediaStreamOptionRemoteEndpointInfo")), CFSTR("vcMediaStreamRemoteEndpointInfo"));
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
  v37 = dispatch_queue_create_with_target_V2("com.apple.AVConference.avctextstream.callback.queue", 0, CustomRootQueue);
  v19->_queue = (OS_dispatch_queue *)v37;
  if (v37)
  {
    if ((v23 & 1) != 0)
    {
      if ((AVCTextStream *)objc_opt_class() == v19)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[AVCTextStream initWithRTPNWConnectionClientID:rtcpNWConnectionClientID:options:error:].cold.4();
        }
        goto LABEL_68;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v38 = (const __CFString *)-[AVCTextStream performSelector:](v19, "performSelector:", sel_logPrefix);
      else
        v38 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3
        || (v47 = VRTraceErrorLogLevelToCSTR(),
            v45 = *MEMORY[0x1E0CF2758],
            !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
      {
LABEL_68:

LABEL_69:
        MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCTextStream-init");
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          v48 = VRTraceErrorLogLevelToCSTR();
          v49 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315906;
            v61 = v48;
            v62 = 2080;
            v63 = "-[AVCTextStream initWithRTPNWConnectionClientID:rtcpNWConnectionClientID:options:error:]";
            v64 = 1024;
            v65 = 172;
            v66 = 2048;
            v67 = 0;
            _os_log_impl(&dword_1D8A54000, v49, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d @:@ AVCTextStream-init (%p)", buf, 0x26u);
          }
        }
        return 0;
      }
      *(_DWORD *)buf = 136316162;
      v61 = v47;
      v62 = 2080;
      v63 = "-[AVCTextStream initWithRTPNWConnectionClientID:rtcpNWConnectionClientID:options:error:]";
      v64 = 1024;
      v65 = 159;
      v66 = 2112;
      v67 = (uint64_t)v38;
      v68 = 2048;
      *(_QWORD *)v69 = v19;
      v46 = "AVCTextStream [%s] %s:%d %@(%p) Failed to create in process VCTextStream as it is not supported";
LABEL_77:
      _os_log_error_impl(&dword_1D8A54000, v45, OS_LOG_TYPE_ERROR, v46, buf, 0x30u);
      goto LABEL_68;
    }
    if (!-[AVCTextStream setupTextStreamOutOfProcessWithClientArgs:error:](v19, "setupTextStreamOutOfProcessWithClientArgs:error:", v20, a6))
    {
      if ((AVCTextStream *)objc_opt_class() == v19)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[AVCTextStream initWithRTPNWConnectionClientID:rtcpNWConnectionClientID:options:error:].cold.5();
        }
        goto LABEL_68;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v54 = (const __CFString *)-[AVCTextStream performSelector:](v19, "performSelector:", sel_logPrefix);
      else
        v54 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_68;
      v57 = VRTraceErrorLogLevelToCSTR();
      v45 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_68;
      *(_DWORD *)buf = 136316162;
      v61 = v57;
      v62 = 2080;
      v63 = "-[AVCTextStream initWithRTPNWConnectionClientID:rtcpNWConnectionClientID:options:error:]";
      v64 = 1024;
      v65 = 156;
      v66 = 2112;
      v67 = (uint64_t)v54;
      v68 = 2048;
      *(_QWORD *)v69 = v19;
      v46 = "AVCTextStream [%s] %s:%d %@(%p) Failed to instantiate servers side object";
      goto LABEL_77;
    }
  }
  else if ((AVCTextStream *)objc_opt_class() == v19)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCTextStream initWithRTPNWConnectionClientID:rtcpNWConnectionClientID:options:error:].cold.3();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v52 = (const __CFString *)-[AVCTextStream performSelector:](v19, "performSelector:", sel_logPrefix);
    else
      v52 = &stru_1E9E58EE0;
    v35 = v58;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v55 = VRTraceErrorLogLevelToCSTR();
      v56 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v61 = v55;
        v62 = 2080;
        v63 = "-[AVCTextStream initWithRTPNWConnectionClientID:rtcpNWConnectionClientID:options:error:]";
        v64 = 1024;
        v65 = 152;
        v66 = 2112;
        v67 = (uint64_t)v52;
        v68 = 2048;
        *(_QWORD *)v69 = v19;
        _os_log_error_impl(&dword_1D8A54000, v56, OS_LOG_TYPE_ERROR, "AVCTextStream [%s] %s:%d %@(%p) Failed to allocate callback queue", buf, 0x30u);
      }
    }
  }

  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCTextStream-init");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v39 = VRTraceErrorLogLevelToCSTR();
    v40 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v41 = getpid();
      streamToken = v19->_streamToken;
      if (a6)
        v43 = (const __CFString *)*a6;
      else
        v43 = CFSTR("None");
      *(_DWORD *)buf = 136316930;
      v61 = v39;
      v62 = 2080;
      v63 = "-[AVCTextStream initWithRTPNWConnectionClientID:rtcpNWConnectionClientID:options:error:]";
      v64 = 1024;
      v65 = 170;
      v66 = 2048;
      v67 = (uint64_t)v19;
      v68 = 1024;
      *(_DWORD *)v69 = v41;
      *(_WORD *)&v69[4] = 2112;
      *(_QWORD *)&v69[6] = v35;
      *(_WORD *)&v69[14] = 1024;
      *(_DWORD *)&v69[16] = streamToken;
      LOWORD(v70[0]) = 2112;
      *(_QWORD *)((char *)v70 + 2) = v43;
      _os_log_impl(&dword_1D8A54000, v40, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d @:@ AVCTextStream-init (%p) PID=%d, callID=%@, streamToken=%d, error=%@", buf, 0x46u);
    }
  }
  return v19;
}

- (void)dealloc
{
  NSObject *queue;
  uint64_t v4;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[4];
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  AVCTextStream *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[AVCTextStream setCapabilities:](self, "setCapabilities:", 0);
  -[AVCTextStream setConfiguration:](self, "setConfiguration:", 0);
  -[AVCTextStream deregisterBlocksForDelegateNotifications](self, "deregisterBlocksForDelegateNotifications");
  -[AVConferenceXPCClient sendMessageSync:](self->_connection, "sendMessageSync:", "vcMediaStreamTerminateText");

  self->_connection = 0;
  queue = self->_queue;
  if (queue)
  {
    dispatch_release(queue);
    self->_queue = 0;
  }
  objc_storeWeak(&self->_delegate, 0);
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCTextStream-dealloc");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v8 = v4;
      v9 = 2080;
      v10 = "-[AVCTextStream dealloc]";
      v11 = 1024;
      v12 = 193;
      v13 = 2048;
      v14 = self;
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d @:@ AVCTextStream-dealloc (%p)", buf, 0x26u);
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)AVCTextStream;
  -[AVCTextStream dealloc](&v6, sel_dealloc);
}

- (void)refreshLoggingParameters
{
  CFPreferencesAppSynchronize(CFSTR("com.apple.VideoConference"));
  CFPreferencesAppSynchronize((CFStringRef)*MEMORY[0x1E0C9B248]);
  VRTraceReset();
  VRTracePrintLoggingInfo();
}

- (BOOL)validateResultsDictionary:(id)a3 error:(id *)a4
{
  const __CFString *v7;
  const __CFString *v8;
  id v9;
  void *v10;
  const __CFString *v11;
  _BOOL4 v12;
  uint64_t v13;
  char IsOSFaultDisabled;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  NSObject *v24;
  const char *v25;
  void *v26;
  uint32_t v27;
  int v29;
  uint64_t v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  AVCTextStream *v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    if ((AVCTextStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_58;
      VRTraceErrorLogLevelToCSTR();
      v12 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (v12)
      {
        -[AVCTextStream validateResultsDictionary:error:].cold.1();
        goto LABEL_58;
      }
      return v12;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = (const __CFString *)-[AVCTextStream performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v8 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_58;
    v16 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x1E0CF2758];
    v12 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (!v12)
      return v12;
    v29 = 136316162;
    v30 = v16;
    v31 = 2080;
    v32 = "-[AVCTextStream validateResultsDictionary:error:]";
    v33 = 1024;
    v34 = 211;
    v35 = 2112;
    v36 = (void *)v8;
    v37 = 2048;
    v38 = self;
    v18 = "AVCTextStream [%s] %s:%d %@(%p) no results dict";
    v19 = v17;
LABEL_56:
    v27 = 48;
LABEL_57:
    _os_log_error_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v29, v27);
    goto LABEL_58;
  }
  if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    if ((AVCTextStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
      {
        VRTraceErrorLogLevelToCSTR();
        if ((VRTraceIsOSFaultDisabled() & 1) != 0)
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            -[AVCTextStream validateResultsDictionary:error:].cold.2();
            if (a4)
            {
LABEL_48:
              v26 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "AVConferenceServiceError:detailCode:description:", 32000, 0, CFSTR("server died"));
              LOBYTE(v12) = 0;
              *a4 = v26;
              return v12;
            }
LABEL_58:
            LOBYTE(v12) = 0;
            return v12;
          }
        }
        else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
        {
          -[AVCTextStream validateResultsDictionary:error:].cold.3();
          if (!a4)
            goto LABEL_58;
          goto LABEL_48;
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v7 = (const __CFString *)-[AVCTextStream performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v7 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
      {
        v13 = VRTraceErrorLogLevelToCSTR();
        IsOSFaultDisabled = VRTraceIsOSFaultDisabled();
        v15 = *MEMORY[0x1E0CF2758];
        if ((IsOSFaultDisabled & 1) != 0)
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            v29 = 136316162;
            v30 = v13;
            v31 = 2080;
            v32 = "-[AVCTextStream validateResultsDictionary:error:]";
            v33 = 1024;
            v34 = 216;
            v35 = 2112;
            v36 = (void *)v7;
            v37 = 2048;
            v38 = self;
            _os_log_error_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_ERROR, "AVCTextStream [%s] %s:%d %@(%p) server died", (uint8_t *)&v29, 0x30u);
            if (!a4)
              goto LABEL_58;
            goto LABEL_48;
          }
        }
        else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
        {
          v29 = 136316162;
          v30 = v13;
          v31 = 2080;
          v32 = "-[AVCTextStream validateResultsDictionary:error:]";
          v33 = 1024;
          v34 = 216;
          v35 = 2112;
          v36 = (void *)v7;
          v37 = 2048;
          v38 = self;
          _os_log_fault_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_FAULT, "AVCTextStream [%s] %s:%d %@(%p) server died", (uint8_t *)&v29, 0x30u);
          if (!a4)
            goto LABEL_58;
          goto LABEL_48;
        }
      }
    }
    if (a4)
      goto LABEL_48;
    goto LABEL_58;
  }
  v9 = (id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ERROR"));
  v10 = v9;
  if (a4)
    *a4 = v9;
  if (!v9 && !objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TIMEOUT")))
  {
    LOBYTE(v12) = 1;
    return v12;
  }
  if ((AVCTextStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_58;
    v20 = VRTraceErrorLogLevelToCSTR();
    v21 = *MEMORY[0x1E0CF2758];
    v12 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (!v12)
      return v12;
    if (v10)
      v22 = (const char *)objc_msgSend((id)objc_msgSend(v10, "description"), "UTF8String");
    else
      v22 = "<nil>";
    v29 = 136316162;
    v30 = v20;
    v31 = 2080;
    v32 = "-[AVCTextStream validateResultsDictionary:error:]";
    v33 = 1024;
    v34 = 230;
    v35 = 2080;
    v36 = (void *)v22;
    v37 = 2080;
    v38 = (AVCTextStream *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
    v18 = "AVCTextStream [%s] %s:%d error initializing error[%s] resultDict[%s]";
    v19 = v21;
    goto LABEL_56;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v11 = (const __CFString *)-[AVCTextStream performSelector:](self, "performSelector:", sel_logPrefix);
  else
    v11 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() < 3)
    goto LABEL_58;
  v23 = VRTraceErrorLogLevelToCSTR();
  v24 = *MEMORY[0x1E0CF2758];
  v12 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
  if (v12)
  {
    if (v10)
      v25 = (const char *)objc_msgSend((id)objc_msgSend(v10, "description"), "UTF8String");
    else
      v25 = "<nil>";
    v29 = 136316674;
    v30 = v23;
    v31 = 2080;
    v32 = "-[AVCTextStream validateResultsDictionary:error:]";
    v33 = 1024;
    v34 = 230;
    v35 = 2112;
    v36 = (void *)v11;
    v37 = 2048;
    v38 = self;
    v39 = 2080;
    v40 = v25;
    v41 = 2080;
    v42 = objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
    v18 = "AVCTextStream [%s] %s:%d %@(%p) error initializing error[%s] resultDict[%s]";
    v19 = v24;
    v27 = 68;
    goto LABEL_57;
  }
  return v12;
}

- (BOOL)initializeServerWithNetworkSockets:(id)a3 callID:(id)a4 error:(id *)a5
{
  id v9;
  void *v10;
  void *v11;
  id v12;
  BOOL v13;
  const __CFString *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  const char *v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  AVCTextStream *v30;
  __int16 v31;
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v10 = v9;
  if (a4)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", a4, CFSTR("vcMediaStreamCallID"));
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v10, CFSTR("vcMediaStreamDictionary"), 0);
  v12 = -[AVConferenceXPCClient sendMessageSync:arguments:xpcArguments:](self->_connection, "sendMessageSync:arguments:xpcArguments:", "vcMediaStreamInitializeText", v11, a3);
  if (!-[AVCTextStream validateResultsDictionary:error:](self, "validateResultsDictionary:error:", v12, a5))
    goto LABEL_15;
  -[AVCTextStream setCapabilities:](self, "setCapabilities:", objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("vcMediaStreamStreamCapabilities")));
  self->_streamToken = objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("vcMediaStreamToken")), "integerValue");
  if (!self->_capabilities)
  {
    if ((AVCTextStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v15 = VRTraceErrorLogLevelToCSTR();
        v16 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCTextStream initializeServerWithNetworkSockets:callID:error:].cold.1(v15, v12, v16);
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v14 = (const __CFString *)-[AVCTextStream performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v14 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v17 = VRTraceErrorLogLevelToCSTR();
        v18 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          if (v12)
            v20 = (const char *)objc_msgSend((id)objc_msgSend(v12, "description"), "UTF8String");
          else
            v20 = "<nil>";
          *(_DWORD *)buf = 136316418;
          v22 = v17;
          v23 = 2080;
          v24 = "-[AVCTextStream initializeServerWithNetworkSockets:callID:error:]";
          v25 = 1024;
          v26 = 253;
          v27 = 2112;
          v28 = v14;
          v29 = 2048;
          v30 = self;
          v31 = 2080;
          v32 = v20;
          _os_log_error_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_ERROR, "AVCTextStream [%s] %s:%d %@(%p) error initializing no capabilities dict result[%s]", buf, 0x3Au);
        }
      }
    }
LABEL_15:
    v13 = 0;
    goto LABEL_16;
  }
  v13 = 1;
LABEL_16:

  return v13;
}

- (id)newNSErrorWithErrorDictionary:(id)a3
{
  if (a3)
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ERROR_DOMAIN")), (int)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ERROR_CODE")), "intValue"), objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ERROR_USERINFO")));
  else
    return 0;
}

- (void)registerBlocksForDelegateNotifications
{
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[7];

  v14[6] = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
  v5 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __55__AVCTextStream_registerBlocksForDelegateNotifications__block_invoke;
  v14[3] = &unk_1E9E57A18;
  v14[4] = v4;
  v14[5] = a2;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcMediaStreamDidServerDie", v14, self->_queue);
  v13[0] = v5;
  v13[1] = 3221225472;
  v13[2] = __55__AVCTextStream_registerBlocksForDelegateNotifications__block_invoke_52;
  v13[3] = &unk_1E9E52730;
  v13[4] = v4;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcMediaStreamDidStartConnection", v13, self->_queue);
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __55__AVCTextStream_registerBlocksForDelegateNotifications__block_invoke_58;
  v12[3] = &unk_1E9E52730;
  v12[4] = v4;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcMediaStreamDidStopConnection", v12, self->_queue);
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __55__AVCTextStream_registerBlocksForDelegateNotifications__block_invoke_60;
  v11[3] = &unk_1E9E52730;
  v11[4] = v4;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcMediaStreamDidPause", v11, self->_queue);
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __55__AVCTextStream_registerBlocksForDelegateNotifications__block_invoke_66;
  v10[3] = &unk_1E9E52730;
  v10[4] = v4;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcMediaStreamDidResume", v10, self->_queue);
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __55__AVCTextStream_registerBlocksForDelegateNotifications__block_invoke_72;
  v9[3] = &unk_1E9E52730;
  v9[4] = v4;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcMediaStreamRTPPacketTimeout", v9, self->_queue);
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __55__AVCTextStream_registerBlocksForDelegateNotifications__block_invoke_76;
  v8[3] = &unk_1E9E52730;
  v8[4] = v4;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcMediaStreamRTCPPacketTimeout", v8, self->_queue);
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __55__AVCTextStream_registerBlocksForDelegateNotifications__block_invoke_80;
  v7[3] = &unk_1E9E52730;
  v7[4] = v4;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcMediaStreamDidRecoverFromRTCPTimeout", v7, self->_queue);
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __55__AVCTextStream_registerBlocksForDelegateNotifications__block_invoke_84;
  v6[3] = &unk_1E9E52730;
  v6[4] = v4;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcMediaStreamRTCPPacketsReceived", v6, self->_queue);
}

void __55__AVCTextStream_registerBlocksForDelegateNotifications__block_invoke(uint64_t a1, void *a2)
{
  char *v3;
  int ErrorLogLevelForModule;
  os_log_t *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  objc_class *v13;
  const char *Name;
  const char *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    v3 = (char *)objc_msgSend(*(id *)(a1 + 32), "strong");
    ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (v3)
    {
      v5 = (os_log_t *)MEMORY[0x1E0CF2758];
      if (ErrorLogLevelForModule >= 3)
      {
        v6 = VRTraceErrorLogLevelToCSTR();
        v7 = *v5;
        if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
        {
          v13 = (objc_class *)objc_opt_class();
          Name = class_getName(v13);
          v15 = sel_getName(*(SEL *)(a1 + 40));
          v16 = 136316162;
          v17 = v6;
          v18 = 2080;
          v19 = "-[AVCTextStream registerBlocksForDelegateNotifications]_block_invoke";
          v20 = 1024;
          v21 = 279;
          v22 = 2080;
          v23 = Name;
          v24 = 2080;
          v25 = v15;
          _os_log_error_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_ERROR, "AVCTextStream [%s] %s:%d [%s %s] server died, notifying client", (uint8_t *)&v16, 0x30u);
        }
      }
      MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCTextStream-didServerDie");
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *v5;
        if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
        {
          v16 = 136315906;
          v17 = v8;
          v18 = 2080;
          v19 = "-[AVCTextStream registerBlocksForDelegateNotifications]_block_invoke";
          v20 = 1024;
          v21 = 280;
          v22 = 2048;
          v23 = v3;
          _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d @:@ AVCTextStream-didServerDie (%p)", (uint8_t *)&v16, 0x26u);
        }
      }
      objc_msgSend((id)objc_msgSend(v3, "delegate"), "streamDidServerDie:", v3);
    }
    else if (ErrorLogLevelForModule >= 8)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      v12 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v16 = 136315650;
          v17 = v10;
          v18 = 2080;
          v19 = "-[AVCTextStream registerBlocksForDelegateNotifications]_block_invoke";
          v20 = 1024;
          v21 = 283;
          _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d AVCTextStream: server died, but AVCTextStream has already deallocated, NO-OP", (uint8_t *)&v16, 0x1Cu);
        }
      }
      else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        __55__AVCTextStream_registerBlocksForDelegateNotifications__block_invoke_cold_1();
      }
    }
  }
}

void __55__AVCTextStream_registerBlocksForDelegateNotifications__block_invoke_52(uint64_t a1, void *a2, const char *a3)
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
  objc_class *v16;
  const char *Name;
  int v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  int v22;
  uint64_t v23;
  os_log_t v24;
  objc_class *v25;
  const char *v26;
  int v27;
  const char *v28;
  NSObject *v29;
  uint32_t v30;
  uint64_t v31;
  NSObject *v32;
  int v33;
  uint64_t v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  _BYTE v42[14];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
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
      v33 = 136316162;
      v34 = v6;
      v35 = 2080;
      v36 = "-[AVCTextStream registerBlocksForDelegateNotifications]_block_invoke";
      v37 = 1024;
      v38 = 291;
      v39 = 2048;
      v40 = a3;
      v41 = 2080;
      *(_QWORD *)v42 = v8;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d didStartConnectionBlock: error = %p, result = %s", (uint8_t *)&v33, 0x30u);
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
      if (ErrorLogLevelForModule > 6)
      {
        v14 = VRTraceErrorLogLevelToCSTR();
        v15 = *v13;
        if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
        {
          v16 = (objc_class *)objc_opt_class();
          Name = class_getName(v16);
          v18 = objc_msgSend(v11, "BOOLValue");
          v33 = 136316162;
          v34 = v14;
          v35 = 2080;
          v36 = "-[AVCTextStream registerBlocksForDelegateNotifications]_block_invoke";
          v37 = 1024;
          v38 = 302;
          v39 = 2080;
          v40 = Name;
          v41 = 1024;
          *(_DWORD *)v42 = v18;
          _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d %s: didStartConnectionBlock strongSelf started(%d)", (uint8_t *)&v33, 0x2Cu);
        }
      }
      v19 = (void *)objc_msgSend(v10, "newNSErrorWithErrorDictionary:", objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcMediaStreamError")));
      MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCTextStream-didStart");
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v20 = VRTraceErrorLogLevelToCSTR();
        v21 = *v13;
        if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
        {
          v22 = objc_msgSend(v11, "intValue");
          v33 = 136316418;
          v34 = v20;
          v35 = 2080;
          v36 = "-[AVCTextStream registerBlocksForDelegateNotifications]_block_invoke";
          v37 = 1024;
          v38 = 305;
          v39 = 2048;
          v40 = (const char *)v10;
          v41 = 1024;
          *(_DWORD *)v42 = v22;
          *(_WORD *)&v42[4] = 2112;
          *(_QWORD *)&v42[6] = v19;
          _os_log_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d @:@ AVCTextStream-didStart (%p) didSucceed=%d, error=%@", (uint8_t *)&v33, 0x36u);
        }
      }
      objc_msgSend((id)objc_msgSend(v10, "delegate"), "stream:didStart:error:", v10, objc_msgSend(v11, "BOOLValue"), v19);

      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        return;
      v23 = VRTraceErrorLogLevelToCSTR();
      v24 = *v13;
      if (!os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
        return;
      v25 = (objc_class *)objc_opt_class();
      v26 = class_getName(v25);
      v27 = objc_msgSend(v11, "BOOLValue");
      v33 = 136316418;
      v34 = v23;
      v35 = 2080;
      v36 = "-[AVCTextStream registerBlocksForDelegateNotifications]_block_invoke";
      v37 = 1024;
      v38 = 309;
      v39 = 2080;
      v40 = v26;
      v41 = 2048;
      *(_QWORD *)v42 = v10;
      *(_WORD *)&v42[8] = 1024;
      *(_DWORD *)&v42[10] = v27;
      v28 = "AVCTextStream [%s] %s:%d %s: notified client %p of didStart started[%d]";
      v29 = v24;
      v30 = 54;
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        return;
      v31 = VRTraceErrorLogLevelToCSTR();
      v32 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return;
      v33 = 136315650;
      v34 = v31;
      v35 = 2080;
      v36 = "-[AVCTextStream registerBlocksForDelegateNotifications]_block_invoke";
      v37 = 1024;
      v38 = 296;
      v28 = "AVCTextStream [%s] %s:%d [AVCTextStream]: didStartConnectionBlock: strongSelf == nil";
      v29 = v32;
      v30 = 28;
    }
    _os_log_impl(&dword_1D8A54000, v29, OS_LOG_TYPE_DEFAULT, v28, (uint8_t *)&v33, v30);
  }
}

void __55__AVCTextStream_registerBlocksForDelegateNotifications__block_invoke_58(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  int ErrorLogLevelForModule;
  os_log_t *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  os_log_t v11;
  objc_class *v12;
  const char *Name;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  uint64_t v17;
  NSObject *v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (a3 || objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
    return;
  v4 = objc_msgSend(*(id *)(a1 + 32), "strong");
  if (!v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return;
    v17 = VRTraceErrorLogLevelToCSTR();
    v18 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return;
    v19 = 136315650;
    v20 = v17;
    v21 = 2080;
    v22 = "-[AVCTextStream registerBlocksForDelegateNotifications]_block_invoke";
    v23 = 1024;
    v24 = 319;
    v14 = "AVCTextStream [%s] %s:%d [AVCTextStream]: didStopConnectionBlock: strongSelf == nil";
    v15 = v18;
    v16 = 28;
LABEL_14:
    _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v19, v16);
    return;
  }
  v5 = (char *)v4;
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCTextStream-didStop");
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v7 = (os_log_t *)MEMORY[0x1E0CF2758];
  if (ErrorLogLevelForModule >= 6)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 136315906;
      v20 = v8;
      v21 = 2080;
      v22 = "-[AVCTextStream registerBlocksForDelegateNotifications]_block_invoke";
      v23 = 1024;
      v24 = 322;
      v25 = 2048;
      v26 = v5;
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d @:@ AVCTextStream-didStop (%p)", (uint8_t *)&v19, 0x26u);
    }
  }
  objc_msgSend((id)objc_msgSend(v5, "delegate"), "streamDidStop:", v5);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (objc_class *)objc_opt_class();
      Name = class_getName(v12);
      v19 = 136316162;
      v20 = v10;
      v21 = 2080;
      v22 = "-[AVCTextStream registerBlocksForDelegateNotifications]_block_invoke";
      v23 = 1024;
      v24 = 324;
      v25 = 2080;
      v26 = Name;
      v27 = 2048;
      v28 = v5;
      v14 = "AVCTextStream [%s] %s:%d %s: notified client %p of didStop";
      v15 = v11;
      v16 = 48;
      goto LABEL_14;
    }
  }
}

void __55__AVCTextStream_registerBlocksForDelegateNotifications__block_invoke_60(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  objc_class *v13;
  const char *Name;
  int v15;
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
  const char *v28;
  __int16 v29;
  _BYTE v30[14];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (a3 || objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
    return;
  v5 = objc_msgSend(*(id *)(a1 + 32), "strong");
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return;
    v19 = VRTraceErrorLogLevelToCSTR();
    v20 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return;
    v21 = 136315650;
    v22 = v19;
    v23 = 2080;
    v24 = "-[AVCTextStream registerBlocksForDelegateNotifications]_block_invoke";
    v25 = 1024;
    v26 = 334;
    v16 = "AVCTextStream [%s] %s:%d [AVCTextStream]: didPauseBlock: strongSelf == nil";
    v17 = v20;
    v18 = 28;
LABEL_16:
    _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v21, v18);
    return;
  }
  v6 = (void *)v5;
  v7 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcMediaStreamPaused"));
  v8 = (void *)objc_msgSend(v6, "newNSErrorWithErrorDictionary:", objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcMediaStreamError")));
  objc_msgSend(v6, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCTextStream-didPause");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v21 = 136316418;
        v22 = v9;
        v23 = 2080;
        v24 = "-[AVCTextStream registerBlocksForDelegateNotifications]_block_invoke";
        v25 = 1024;
        v26 = 342;
        v27 = 2048;
        v28 = (const char *)v6;
        v29 = 1024;
        *(_DWORD *)v30 = objc_msgSend(v7, "intValue");
        *(_WORD *)&v30[4] = 2112;
        *(_QWORD *)&v30[6] = v8;
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d @:@ AVCTextStream-didPause (%p) didSucceed=%d, error=%@", (uint8_t *)&v21, 0x36u);
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
      v13 = (objc_class *)objc_opt_class();
      Name = class_getName(v13);
      v15 = objc_msgSend(v7, "BOOLValue");
      v21 = 136316418;
      v22 = v11;
      v23 = 2080;
      v24 = "-[AVCTextStream registerBlocksForDelegateNotifications]_block_invoke";
      v25 = 1024;
      v26 = 347;
      v27 = 2080;
      v28 = Name;
      v29 = 2048;
      *(_QWORD *)v30 = v6;
      *(_WORD *)&v30[8] = 1024;
      *(_DWORD *)&v30[10] = v15;
      v16 = "AVCTextStream [%s] %s:%d %s: notified client %p of didPause [%d]";
      v17 = v12;
      v18 = 54;
      goto LABEL_16;
    }
  }
}

void __55__AVCTextStream_registerBlocksForDelegateNotifications__block_invoke_66(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  objc_class *v13;
  const char *Name;
  int v15;
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
  const char *v28;
  __int16 v29;
  _BYTE v30[14];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (a3 || objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
    return;
  v5 = objc_msgSend(*(id *)(a1 + 32), "strong");
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return;
    v19 = VRTraceErrorLogLevelToCSTR();
    v20 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return;
    v21 = 136315650;
    v22 = v19;
    v23 = 2080;
    v24 = "-[AVCTextStream registerBlocksForDelegateNotifications]_block_invoke";
    v25 = 1024;
    v26 = 357;
    v16 = "AVCTextStream [%s] %s:%d [AVCTextStream]: didResumeBlock: strongSelf == nil";
    v17 = v20;
    v18 = 28;
LABEL_16:
    _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v21, v18);
    return;
  }
  v6 = (void *)v5;
  v7 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcMediaStreamResumed"));
  v8 = (void *)objc_msgSend(v6, "newNSErrorWithErrorDictionary:", objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcMediaStreamError")));
  objc_msgSend(v6, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCTextStream-didResume");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v21 = 136316418;
        v22 = v9;
        v23 = 2080;
        v24 = "-[AVCTextStream registerBlocksForDelegateNotifications]_block_invoke";
        v25 = 1024;
        v26 = 365;
        v27 = 2048;
        v28 = (const char *)v6;
        v29 = 1024;
        *(_DWORD *)v30 = objc_msgSend(v7, "intValue");
        *(_WORD *)&v30[4] = 2112;
        *(_QWORD *)&v30[6] = v8;
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d @:@ AVCTextStream-didResume (%p) didSucceed=%d, error=%@", (uint8_t *)&v21, 0x36u);
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
      v13 = (objc_class *)objc_opt_class();
      Name = class_getName(v13);
      v15 = objc_msgSend(v7, "BOOLValue");
      v21 = 136316418;
      v22 = v11;
      v23 = 2080;
      v24 = "-[AVCTextStream registerBlocksForDelegateNotifications]_block_invoke";
      v25 = 1024;
      v26 = 370;
      v27 = 2080;
      v28 = Name;
      v29 = 2048;
      *(_QWORD *)v30 = v6;
      *(_WORD *)&v30[8] = 1024;
      *(_DWORD *)&v30[10] = v15;
      v16 = "AVCTextStream [%s] %s:%d %s: notified client %p of didSucceed [%d]";
      v17 = v12;
      v18 = 54;
      goto LABEL_16;
    }
  }
}

void __55__AVCTextStream_registerBlocksForDelegateNotifications__block_invoke_72(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  objc_class *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *Name;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (a3 || objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
    return;
  v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
  if (!v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return;
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return;
    v14 = 136315650;
    v15 = v12;
    v16 = 2080;
    v17 = "-[AVCTextStream registerBlocksForDelegateNotifications]_block_invoke";
    v18 = 1024;
    v19 = 381;
    v9 = "AVCTextStream [%s] %s:%d [AVCTextStream]: didRTPPacketTimeoutBlock: strongSelf == nil";
    v10 = v13;
    v11 = 28;
LABEL_13:
    _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v14, v11);
    return;
  }
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
      v8 = (objc_class *)objc_opt_class();
      v14 = 136316162;
      v15 = v6;
      v16 = 2080;
      v17 = "-[AVCTextStream registerBlocksForDelegateNotifications]_block_invoke";
      v18 = 1024;
      v19 = 388;
      v20 = 2080;
      Name = class_getName(v8);
      v22 = 2048;
      v23 = v5;
      v9 = "AVCTextStream [%s] %s:%d %s: notified client %p RTP packet timeout";
      v10 = v7;
      v11 = 48;
      goto LABEL_13;
    }
  }
}

void __55__AVCTextStream_registerBlocksForDelegateNotifications__block_invoke_76(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  objc_class *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *Name;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (a3 || objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
    return;
  v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
  if (!v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return;
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return;
    v14 = 136315650;
    v15 = v12;
    v16 = 2080;
    v17 = "-[AVCTextStream registerBlocksForDelegateNotifications]_block_invoke";
    v18 = 1024;
    v19 = 398;
    v9 = "AVCTextStream [%s] %s:%d [AVCTextStream]: didRTCPPacketTimeoutBlock: strongSelf == nil";
    v10 = v13;
    v11 = 28;
LABEL_13:
    _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v14, v11);
    return;
  }
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
      v8 = (objc_class *)objc_opt_class();
      v14 = 136316162;
      v15 = v6;
      v16 = 2080;
      v17 = "-[AVCTextStream registerBlocksForDelegateNotifications]_block_invoke";
      v18 = 1024;
      v19 = 406;
      v20 = 2080;
      Name = class_getName(v8);
      v22 = 2048;
      v23 = v5;
      v9 = "AVCTextStream [%s] %s:%d %s: notified client %p RTCP packet timeout";
      v10 = v7;
      v11 = 48;
      goto LABEL_13;
    }
  }
}

void __55__AVCTextStream_registerBlocksForDelegateNotifications__block_invoke_80(uint64_t a1, void *a2, uint64_t a3)
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
          v11 = "-[AVCTextStream registerBlocksForDelegateNotifications]_block_invoke";
          v12 = 1024;
          v13 = 422;
          v14 = 2048;
          v15 = v5;
          _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d AVCTextStream: notified client=%p RTCP packet timeout", (uint8_t *)&v8, 0x26u);
        }
      }
    }
  }
}

void __55__AVCTextStream_registerBlocksForDelegateNotifications__block_invoke_84(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  objc_class *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *Name;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!a3 && !objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
    if (v5)
    {
      v6 = v5;
      objc_msgSend(v5, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend((id)objc_msgSend(v6, "delegate"), "stream:didReceiveRTCPPackets:", v6, objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcMediaStreamRTCPPackets")));
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v9 = (objc_class *)objc_opt_class();
          v10 = 136316162;
          v11 = v7;
          v12 = 2080;
          v13 = "-[AVCTextStream registerBlocksForDelegateNotifications]_block_invoke";
          v14 = 1024;
          v15 = 437;
          v16 = 2080;
          Name = class_getName(v9);
          v18 = 2048;
          v19 = v6;
          _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d %s: notified client %p received RTCP packets", (uint8_t *)&v10, 0x30u);
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
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcMediaStreamDidStartSynchronization");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcMediaStreamRTPPacketTimeout");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcMediaStreamRTCPPacketTimeout");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcMediaStreamDidRecoverFromRTCPTimeout");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcMediaStreamRTCPPacketsReceived");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcMediaStreamDidServerDie");
}

- (BOOL)configure:(id)a3 error:(id *)a4
{
  uint64_t v7;
  void *v8;
  _BOOL4 v9;
  id v10;
  const __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  const char *v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  AVCTextStream *v27;
  __int16 v28;
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "isValidTextConfig") & 1) == 0)
  {
    if ((AVCTextStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_15;
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_15;
      -[AVCTextStream configure:error:].cold.1(v12, a4, v13);
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v11 = (const __CFString *)-[AVCTextStream performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v11 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3
        || (v14 = VRTraceErrorLogLevelToCSTR(),
            v15 = *MEMORY[0x1E0CF2758],
            !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
      {
LABEL_15:
        if (!a4)
        {
          LOBYTE(v9) = 0;
          return v9;
        }
        goto LABEL_16;
      }
      if (*a4)
        v17 = (const char *)objc_msgSend((id)objc_msgSend(*a4, "description"), "UTF8String");
      else
        v17 = "<nil>";
      *(_DWORD *)buf = 136316418;
      v19 = v14;
      v20 = 2080;
      v21 = "-[AVCTextStream configure:error:]";
      v22 = 1024;
      v23 = 462;
      v24 = 2112;
      v25 = v11;
      v26 = 2048;
      v27 = self;
      v28 = 2080;
      v29 = v17;
      _os_log_error_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_ERROR, "AVCTextStream [%s] %s:%d %@(%p) Invalid text configuration: error[%s]", buf, 0x3Au);
    }
LABEL_16:
    LOBYTE(v9) = 0;
    *a4 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "AVConferenceServiceError:detailCode:description:", 32016, 0, CFSTR("AVCTextStream configuration is invalid"));
    return v9;
  }
  v7 = objc_msgSend(a3, "dictionary");
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v7, CFSTR("vcMediaStreamDictionary"), 0);
  v9 = -[AVCTextStream validateResultsDictionary:error:](self, "validateResultsDictionary:error:", -[AVConferenceXPCClient sendMessageSync:arguments:](self->_connection, "sendMessageSync:arguments:", "vcMediaStreamSetSessionConfig", v8), a4);

  if (v9)
    v10 = a3;
  else
    v10 = 0;
  -[AVCTextStream setConfiguration:](self, "setConfiguration:", v10);
  return v9;
}

- (void)start
{
  uint64_t v3;
  NSObject *v4;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  _BYTE v15[24];
  __int128 v16;
  AVCTextStream *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1DF087EC4](&dword_1D8A54000, "-[AVCTextStream start]");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v15 = 136315650;
      *(_QWORD *)&v15[4] = v3;
      *(_WORD *)&v15[12] = 2080;
      *(_QWORD *)&v15[14] = "-[AVCTextStream start]";
      *(_WORD *)&v15[22] = 1024;
      LODWORD(v16) = 490;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d ", v15, 0x1Cu);
    }
  }
  if (!self->_configuration)
  {
    -[AVCTextStreamDelegate stream:didStart:error:](-[AVCTextStream delegate](self, "delegate"), "stream:didStart:error:", self, 0, objc_msgSend(MEMORY[0x1E0CB35C8], "AVConferenceServiceError:detailCode:description:", 32016, 0, CFSTR("AVCTextStream hasn't been configured")));
    goto LABEL_18;
  }
  if ((AVCTextStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 6)
      goto LABEL_17;
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_17;
    *(_DWORD *)v15 = 136315650;
    *(_QWORD *)&v15[4] = v6;
    *(_WORD *)&v15[12] = 2080;
    *(_QWORD *)&v15[14] = "-[AVCTextStream start]";
    *(_WORD *)&v15[22] = 1024;
    LODWORD(v16) = 494;
    v8 = "AVCTextStream [%s] %s:%d API_VCMEDIASTREAM_STARTCONFERENCE (client side)";
    v9 = v7;
    v10 = 28;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[AVCTextStream performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 6)
      goto LABEL_17;
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_17;
    *(_DWORD *)v15 = 136316162;
    *(_QWORD *)&v15[4] = v11;
    *(_WORD *)&v15[12] = 2080;
    *(_QWORD *)&v15[14] = "-[AVCTextStream start]";
    *(_WORD *)&v15[22] = 1024;
    LODWORD(v16) = 494;
    WORD2(v16) = 2112;
    *(_QWORD *)((char *)&v16 + 6) = v5;
    HIWORD(v16) = 2048;
    v17 = self;
    v8 = "AVCTextStream [%s] %s:%d %@(%p) API_VCMEDIASTREAM_STARTCONFERENCE (client side)";
    v9 = v12;
    v10 = 48;
  }
  _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, v15, v10);
LABEL_17:
  -[AVConferenceXPCClient sendMessageAsync:](self->_connection, "sendMessageAsync:", "vcMediaStreamStartConference", *(_OWORD *)v15, *(_QWORD *)&v15[16], v16, v17);
LABEL_18:
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCTextStream-start");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v15 = 136315906;
      *(_QWORD *)&v15[4] = v13;
      *(_WORD *)&v15[12] = 2080;
      *(_QWORD *)&v15[14] = "-[AVCTextStream start]";
      *(_WORD *)&v15[22] = 1024;
      LODWORD(v16) = 504;
      WORD2(v16) = 2048;
      *(_QWORD *)((char *)&v16 + 6) = self;
      _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d @:@ AVCTextStream-start (%p)", v15, 0x26u);
    }
  }
}

- (void)stop
{
  int ErrorLogLevelForModule;
  os_log_t *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  AVCTextStream *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1DF087EC4](&dword_1D8A54000, "-[AVCTextStream stop]");
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v4 = (os_log_t *)MEMORY[0x1E0CF2758];
  if (ErrorLogLevelForModule > 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315650;
      v10 = v5;
      v11 = 2080;
      v12 = "-[AVCTextStream stop]";
      v13 = 1024;
      v14 = 509;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d ", (uint8_t *)&v9, 0x1Cu);
    }
  }
  -[AVConferenceXPCClient sendMessageAsync:](self->_connection, "sendMessageAsync:", "vcMediaStreamStopConference");
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCTextStream-stop");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315906;
      v10 = v7;
      v11 = 2080;
      v12 = "-[AVCTextStream stop]";
      v13 = 1024;
      v14 = 516;
      v15 = 2048;
      v16 = self;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d @:@ AVCTextStream-stop (%p)", (uint8_t *)&v9, 0x26u);
    }
  }
}

- (void)pause
{
  int ErrorLogLevelForModule;
  os_log_t *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  AVCTextStream *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1DF087EC4](&dword_1D8A54000, "-[AVCTextStream pause]");
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v4 = (os_log_t *)MEMORY[0x1E0CF2758];
  if (ErrorLogLevelForModule > 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v11 = v5;
      v12 = 2080;
      v13 = "-[AVCTextStream pause]";
      v14 = 1024;
      v15 = 521;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d ", buf, 0x1Cu);
    }
  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", &unk_1E9EFB3D0, CFSTR("vcMediaStreamDictionary"), 0);
  -[AVConferenceXPCClient sendMessageAsync:arguments:](self->_connection, "sendMessageAsync:arguments:", "vcMediaStreamSetPause", v7);

  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCTextStream-pause");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v11 = v8;
      v12 = 2080;
      v13 = "-[AVCTextStream pause]";
      v14 = 1024;
      v15 = 532;
      v16 = 2048;
      v17 = self;
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d @:@ AVCTextStream-pause (%p)", buf, 0x26u);
    }
  }
}

- (void)resume
{
  int ErrorLogLevelForModule;
  os_log_t *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  AVCTextStream *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1DF087EC4](&dword_1D8A54000, "-[AVCTextStream resume]");
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v4 = (os_log_t *)MEMORY[0x1E0CF2758];
  if (ErrorLogLevelForModule > 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v11 = v5;
      v12 = 2080;
      v13 = "-[AVCTextStream resume]";
      v14 = 1024;
      v15 = 537;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d ", buf, 0x1Cu);
    }
  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", &unk_1E9EFB3F8, CFSTR("vcMediaStreamDictionary"), 0);
  -[AVConferenceXPCClient sendMessageAsync:arguments:](self->_connection, "sendMessageAsync:arguments:", "vcMediaStreamSetPause", v7);

  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCTextStream-resume");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v11 = v8;
      v12 = 2080;
      v13 = "-[AVCTextStream resume]";
      v14 = 1024;
      v15 = 548;
      v16 = 2048;
      v17 = self;
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d @:@ AVCTextStream-resume (%p)", buf, 0x26u);
    }
  }
}

- (AVCTextStreamDelegate)delegate
{
  return (AVCTextStreamDelegate *)objc_loadWeak(&self->_delegate);
}

- (void)setDelegate:(id)a3
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
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315906;
      v8 = v5;
      v9 = 2080;
      v10 = "-[AVCTextStream setDelegate:]";
      v11 = 1024;
      v12 = 558;
      v13 = 2048;
      v14 = a3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d delegate=%p", (uint8_t *)&v7, 0x26u);
    }
  }
  objc_storeWeak(&self->_delegate, a3);
}

- (void)setDirection:(int64_t)a3
{
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v15 = v5;
      v16 = 2080;
      v17 = "-[AVCTextStream setDirection:]";
      v18 = 1024;
      v19 = 563;
      v20 = 1024;
      v21 = a3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d direction=%d", buf, 0x22u);
    }
  }
  if (-[AVCMediaStreamConfig direction](self->_configuration, "direction") == a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v9 = -[AVCMediaStreamConfig direction](self->_configuration, "direction");
        *(_DWORD *)buf = 136315906;
        v15 = v7;
        v16 = 2080;
        v17 = "-[AVCTextStream setDirection:]";
        v18 = 1024;
        v19 = 565;
        v20 = 1024;
        v21 = v9;
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d direction is already set to %d", buf, 0x22u);
      }
    }
  }
  else
  {
    -[AVCMediaStreamConfig setDirection:](self->_configuration, "setDirection:", a3);
    v12 = CFSTR("vcMediaStreamDirection");
    v13 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v10 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v10, CFSTR("vcMediaStreamDictionary"), 0);
    -[AVConferenceXPCClient sendMessageAsync:arguments:](self->_connection, "sendMessageAsync:arguments:", "vcMediaStreamSetStreamDirection", v11);

  }
}

- (int64_t)direction
{
  return -[AVCMediaStreamConfig direction](self->_configuration, "direction");
}

- (void)setRtcpEnabled:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  _BOOL4 v11;
  const __CFString *v12;
  uint64_t v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  _BOOL4 v21;
  uint64_t v22;

  v3 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v15 = v5;
      v16 = 2080;
      v17 = "-[AVCTextStream setRtcpEnabled:]";
      v18 = 1024;
      v19 = 587;
      v20 = 1024;
      v21 = v3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d rtcpEnabled=%d", buf, 0x22u);
    }
  }
  if (-[AVCMediaStreamConfig isRTCPEnabled](self->_configuration, "isRTCPEnabled") == v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v11 = -[AVCMediaStreamConfig isRTCPEnabled](self->_configuration, "isRTCPEnabled");
        *(_DWORD *)buf = 136315906;
        v15 = v9;
        v16 = 2080;
        v17 = "-[AVCTextStream setRtcpEnabled:]";
        v18 = 1024;
        v19 = 590;
        v20 = 1024;
        v21 = v11;
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d rtcpEnabled is already set to %d", buf, 0x22u);
      }
    }
  }
  else
  {
    -[AVCMediaStreamConfig setRtcpEnabled:](self->_configuration, "setRtcpEnabled:", v3);
    v12 = CFSTR("vcMediaStreamRTCPEnabled");
    v13 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v7 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v7, CFSTR("vcMediaStreamDictionary"), 0);
    -[AVConferenceXPCClient sendMessageAsync:arguments:](self->_connection, "sendMessageAsync:arguments:", "vcMediaStreamSetRTCPEnabled", v8);

  }
}

- (BOOL)isRTCPEnabled
{
  return -[AVCMediaStreamConfig isRTCPEnabled](self->_configuration, "isRTCPEnabled");
}

- (void)setRtpTimeOutEnabled:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  _BOOL4 v11;
  const __CFString *v12;
  uint64_t v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  _BOOL4 v21;
  uint64_t v22;

  v3 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v15 = v5;
      v16 = 2080;
      v17 = "-[AVCTextStream setRtpTimeOutEnabled:]";
      v18 = 1024;
      v19 = 613;
      v20 = 1024;
      v21 = v3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d rtpTimeOutEnabled=%d", buf, 0x22u);
    }
  }
  if (-[AVCMediaStreamConfig isRTPTimeOutEnabled](self->_configuration, "isRTPTimeOutEnabled") == v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v11 = -[AVCMediaStreamConfig isRTPTimeOutEnabled](self->_configuration, "isRTPTimeOutEnabled");
        *(_DWORD *)buf = 136315906;
        v15 = v9;
        v16 = 2080;
        v17 = "-[AVCTextStream setRtpTimeOutEnabled:]";
        v18 = 1024;
        v19 = 616;
        v20 = 1024;
        v21 = v11;
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d rtpTimeOutEnabled is already set to %d", buf, 0x22u);
      }
    }
  }
  else
  {
    -[AVCMediaStreamConfig setRtpTimeOutEnabled:](self->_configuration, "setRtpTimeOutEnabled:", v3);
    v12 = CFSTR("vcMediaStreamRTPTimeoutEnabled");
    v13 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v7 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v7, CFSTR("vcMediaStreamDictionary"), 0);
    -[AVConferenceXPCClient sendMessageAsync:arguments:](self->_connection, "sendMessageAsync:arguments:", "vcMediaStreamSetRTPTimeoutEnabled", v8);

  }
}

- (BOOL)isRTPTimeOutEnabled
{
  return -[AVCMediaStreamConfig isRTPTimeOutEnabled](self->_configuration, "isRTPTimeOutEnabled");
}

- (void)setRtcpTimeOutEnabled:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  _BOOL4 v11;
  const __CFString *v12;
  uint64_t v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  _BOOL4 v21;
  uint64_t v22;

  v3 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v15 = v5;
      v16 = 2080;
      v17 = "-[AVCTextStream setRtcpTimeOutEnabled:]";
      v18 = 1024;
      v19 = 639;
      v20 = 1024;
      v21 = v3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d rtcpTimeOutEnabled=%d", buf, 0x22u);
    }
  }
  if (-[AVCMediaStreamConfig isRTCPTimeOutEnabled](self->_configuration, "isRTCPTimeOutEnabled") == v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v11 = -[AVCMediaStreamConfig isRTCPTimeOutEnabled](self->_configuration, "isRTCPTimeOutEnabled");
        *(_DWORD *)buf = 136315906;
        v15 = v9;
        v16 = 2080;
        v17 = "-[AVCTextStream setRtcpTimeOutEnabled:]";
        v18 = 1024;
        v19 = 642;
        v20 = 1024;
        v21 = v11;
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d rtcpTimeOutEnabled is already set to %d", buf, 0x22u);
      }
    }
  }
  else
  {
    -[AVCMediaStreamConfig setRtcpTimeOutEnabled:](self->_configuration, "setRtcpTimeOutEnabled:", v3);
    v12 = CFSTR("vcMediaStreamRTCPTimeoutEnabled");
    v13 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v7 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v7, CFSTR("vcMediaStreamDictionary"), 0);
    -[AVConferenceXPCClient sendMessageAsync:arguments:](self->_connection, "sendMessageAsync:arguments:", "vcMediaStreamSetRTCPTimeoutEnabled", v8);

  }
}

- (BOOL)isRTCPTimeOutEnabled
{
  return -[AVCMediaStreamConfig isRTCPTimeOutEnabled](self->_configuration, "isRTCPTimeOutEnabled");
}

- (void)setRtpTimeOutIntervalSec:(double)a3
{
  uint64_t v5;
  NSObject *v6;
  float v7;
  double v8;
  uint64_t v9;
  NSObject *v10;
  double v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  double v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = a3;
      *(_DWORD *)buf = 136315906;
      v17 = v5;
      v18 = 2080;
      v19 = "-[AVCTextStream setRtpTimeOutIntervalSec:]";
      v20 = 1024;
      v21 = 665;
      v22 = 2048;
      v23 = v7;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d rtpTimeOutIntervalSec=%f", buf, 0x26u);
    }
  }
  -[AVCMediaStreamConfig rtpTimeOutInterval](self->_configuration, "rtpTimeOutInterval");
  if (v8 == a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        -[AVCMediaStreamConfig rtpTimeOutInterval](self->_configuration, "rtpTimeOutInterval");
        *(float *)&v11 = v11;
        *(_DWORD *)buf = 136315906;
        v17 = v9;
        v18 = 2080;
        v19 = "-[AVCTextStream setRtpTimeOutIntervalSec:]";
        v20 = 1024;
        v21 = 668;
        v22 = 2048;
        v23 = *(float *)&v11;
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d rtpTimeOutInterval is already set to %f", buf, 0x26u);
      }
    }
  }
  else
  {
    -[AVCMediaStreamConfig setRtpTimeOutInterval:](self->_configuration, "setRtpTimeOutInterval:", a3);
    v14 = CFSTR("vcMediaStreamRTPTimeoutInterval");
    v15 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v12 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v12, CFSTR("vcMediaStreamDictionary"), 0);
    -[AVConferenceXPCClient sendMessageAsync:arguments:](self->_connection, "sendMessageAsync:arguments:", "vcMediaStreamSetRTPTimeoutInterval", v13);

  }
}

- (double)rtpTimeOutIntervalSec
{
  double result;

  -[AVCMediaStreamConfig rtpTimeOutInterval](self->_configuration, "rtpTimeOutInterval");
  return result;
}

- (void)setRtcpTimeOutIntervalSec:(double)a3
{
  uint64_t v5;
  NSObject *v6;
  float v7;
  double v8;
  uint64_t v9;
  NSObject *v10;
  double v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  double v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = a3;
      *(_DWORD *)buf = 136315906;
      v17 = v5;
      v18 = 2080;
      v19 = "-[AVCTextStream setRtcpTimeOutIntervalSec:]";
      v20 = 1024;
      v21 = 692;
      v22 = 2048;
      v23 = v7;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d rtcpTimeOutIntervalSec=%f", buf, 0x26u);
    }
  }
  -[AVCMediaStreamConfig rtcpTimeOutInterval](self->_configuration, "rtcpTimeOutInterval");
  if (v8 == a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        -[AVCMediaStreamConfig rtcpTimeOutInterval](self->_configuration, "rtcpTimeOutInterval");
        *(float *)&v11 = v11;
        *(_DWORD *)buf = 136315906;
        v17 = v9;
        v18 = 2080;
        v19 = "-[AVCTextStream setRtcpTimeOutIntervalSec:]";
        v20 = 1024;
        v21 = 695;
        v22 = 2048;
        v23 = *(float *)&v11;
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d rtcpTimeOutIntervalSec is already set to %f", buf, 0x26u);
      }
    }
  }
  else
  {
    -[AVCMediaStreamConfig setRtcpTimeOutInterval:](self->_configuration, "setRtcpTimeOutInterval:", a3);
    v14 = CFSTR("vcMediaStreamRTCPTimeoutInterval");
    v15 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v12 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v12, CFSTR("vcMediaStreamDictionary"), 0);
    -[AVConferenceXPCClient sendMessageAsync:arguments:](self->_connection, "sendMessageAsync:arguments:", "vcMediaStreamSetRTCPTimeoutInterval", v13);

  }
}

- (double)rtcpTimeOutIntervalSec
{
  double result;

  -[AVCMediaStreamConfig rtcpTimeOutInterval](self->_configuration, "rtcpTimeOutInterval");
  return result;
}

- (void)setRtcpSendIntervalSec:(double)a3
{
  uint64_t v5;
  NSObject *v6;
  float v7;
  double v8;
  uint64_t v9;
  NSObject *v10;
  double v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  double v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = a3;
      *(_DWORD *)buf = 136315906;
      v17 = v5;
      v18 = 2080;
      v19 = "-[AVCTextStream setRtcpSendIntervalSec:]";
      v20 = 1024;
      v21 = 718;
      v22 = 2048;
      v23 = v7;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d rtcpSendIntervalSec=%f", buf, 0x26u);
    }
  }
  -[AVCMediaStreamConfig rtcpSendInterval](self->_configuration, "rtcpSendInterval");
  if (v8 == a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        -[AVCMediaStreamConfig rtcpSendInterval](self->_configuration, "rtcpSendInterval");
        *(float *)&v11 = v11;
        *(_DWORD *)buf = 136315906;
        v17 = v9;
        v18 = 2080;
        v19 = "-[AVCTextStream setRtcpSendIntervalSec:]";
        v20 = 1024;
        v21 = 721;
        v22 = 2048;
        v23 = *(float *)&v11;
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, "AVCTextStream [%s] %s:%d rtcpSendIntervalSec is already set to %f", buf, 0x26u);
      }
    }
  }
  else
  {
    -[AVCMediaStreamConfig setRtcpSendInterval:](self->_configuration, "setRtcpSendInterval:", a3);
    v14 = CFSTR("vcMediaStreamRTCPSendInterval");
    v15 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v12 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v12, CFSTR("vcMediaStreamDictionary"), 0);
    -[AVConferenceXPCClient sendMessageAsync:arguments:](self->_connection, "sendMessageAsync:arguments:", "vcMediaStreamSetRTCPSendInterval", v13);

  }
}

- (double)rtcpSendIntervalSec
{
  double result;

  -[AVCMediaStreamConfig rtcpSendInterval](self->_configuration, "rtcpSendInterval");
  return result;
}

- (AVCMediaStreamConfig)configuration
{
  return self->_configuration;
}

- (id)validateInitializeConnectionResult:(id)a3
{
  uint64_t v4;
  char IsOSFaultDisabled;
  NSObject *v6;
  void *v7;
  const __CFString *v8;

  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if ((VRTraceIsOSFaultDisabled() & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCTextStream validateInitializeConnectionResult:].cold.1();
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
      {
        -[AVCTextStream validateInitializeConnectionResult:].cold.2();
      }
    }
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v8 = CFSTR("Missing result dictionary");
    return (id)objc_msgSend(v7, "AVConferenceServiceError:detailCode:description:", 32000, 0, v8);
  }
  if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if ((VRTraceIsOSFaultDisabled() & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCTextStream validateInitializeConnectionResult:].cold.11();
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
      {
        -[AVCTextStream validateInitializeConnectionResult:].cold.12();
      }
    }
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v8 = CFSTR("Server died");
    return (id)objc_msgSend(v7, "AVConferenceServiceError:detailCode:description:", 32000, 0, v8);
  }
  if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ERROR")))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      IsOSFaultDisabled = VRTraceIsOSFaultDisabled();
      v6 = *MEMORY[0x1E0CF2758];
      if ((IsOSFaultDisabled & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCTextStream validateInitializeConnectionResult:].cold.9(v4, a3, v6);
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
      {
        -[AVCTextStream validateInitializeConnectionResult:].cold.10(v4, a3, v6);
      }
    }
    return (id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ERROR"));
  }
  else
  {
    if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TIMEOUT")))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
      {
        VRTraceErrorLogLevelToCSTR();
        if ((VRTraceIsOSFaultDisabled() & 1) != 0)
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[AVCTextStream validateInitializeConnectionResult:].cold.7();
        }
        else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
        {
          -[AVCTextStream validateInitializeConnectionResult:].cold.8();
        }
      }
      v7 = (void *)MEMORY[0x1E0CB35C8];
      v8 = CFSTR("IPC Timeout");
      return (id)objc_msgSend(v7, "AVConferenceServiceError:detailCode:description:", 32000, 0, v8);
    }
    if (!objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamStreamCapabilities")))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
      {
        VRTraceErrorLogLevelToCSTR();
        if ((VRTraceIsOSFaultDisabled() & 1) != 0)
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[AVCTextStream validateInitializeConnectionResult:].cold.3();
        }
        else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
        {
          -[AVCTextStream validateInitializeConnectionResult:].cold.4();
        }
      }
      v7 = (void *)MEMORY[0x1E0CB35C8];
      v8 = CFSTR("Missing capabilities dictionary");
      return (id)objc_msgSend(v7, "AVConferenceServiceError:detailCode:description:", 32000, 0, v8);
    }
    if (!objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamToken")))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
      {
        VRTraceErrorLogLevelToCSTR();
        if ((VRTraceIsOSFaultDisabled() & 1) != 0)
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[AVCTextStream validateInitializeConnectionResult:].cold.5();
        }
        else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
        {
          -[AVCTextStream validateInitializeConnectionResult:].cold.6();
        }
      }
      v7 = (void *)MEMORY[0x1E0CB35C8];
      v8 = CFSTR("Missing stream token");
      return (id)objc_msgSend(v7, "AVConferenceServiceError:detailCode:description:", 32000, 0, v8);
    }
    return 0;
  }
}

- (BOOL)setupTextStreamOutOfProcessWithClientArgs:(id)a3 error:(id *)a4
{
  AVConferenceXPCClient *v7;
  id v8;
  id v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  const __CFString *v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  AVCTextStream *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = objc_alloc_init(AVConferenceXPCClient);
  self->_connection = v7;
  if (!v7)
  {
    if ((AVCTextStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        LODWORD(v9) = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!(_DWORD)v9)
          return (char)v9;
        -[AVCTextStream setupTextStreamOutOfProcessWithClientArgs:error:].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v11 = (const __CFString *)-[AVCTextStream performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v11 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v12 = VRTraceErrorLogLevelToCSTR();
        v13 = *MEMORY[0x1E0CF2758];
        LODWORD(v9) = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!(_DWORD)v9)
          return (char)v9;
        *(_DWORD *)buf = 136316162;
        v18 = v12;
        v19 = 2080;
        v20 = "-[AVCTextStream setupTextStreamOutOfProcessWithClientArgs:error:]";
        v21 = 1024;
        v22 = 777;
        v23 = 2112;
        v24 = v11;
        v25 = 2048;
        v26 = self;
        _os_log_error_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_ERROR, "AVCTextStream [%s] %s:%d %@(%p) Failed to allocate callback XPC connection", buf, 0x30u);
      }
    }
    goto LABEL_16;
  }
  -[AVCTextStream registerBlocksForDelegateNotifications](self, "registerBlocksForDelegateNotifications");
  v15 = CFSTR("vcMediaStreamDictionary");
  v16 = a3;
  v8 = -[AVConferenceXPCClient sendMessageSync:arguments:](self->_connection, "sendMessageSync:arguments:", "vcMediaStreamInitializeText", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
  v9 = -[AVCTextStream validateInitializeConnectionResult:](self, "validateInitializeConnectionResult:", v8);
  if (!v9)
  {
    -[AVCTextStream setCapabilities:](self, "setCapabilities:", objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("vcMediaStreamStreamCapabilities")));
    self->_streamToken = objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("vcMediaStreamToken")), "integerValue");
    LOBYTE(v9) = 1;
    return (char)v9;
  }
  if (!a4)
  {
LABEL_16:
    LOBYTE(v9) = 0;
    return (char)v9;
  }
  v10 = v9;
  LOBYTE(v9) = 0;
  *a4 = v10;
  return (char)v9;
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
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (void)initWithNetworkSockets:callID:error:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVCTextStream [%s] %s:%d Failed to allocate callback queue", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithNetworkSockets:callID:error:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVCTextStream [%s] %s:%d Failed to allocate callback XPC connection", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithNetworkSockets:callID:error:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVCTextStream [%s] %s:%d Failed to instantiate servers side object", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithRTPNWConnectionClientID:rtcpNWConnectionClientID:options:error:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVCTextStream [%s] %s:%d Failed to allocate clientArgs dictionary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithRTPNWConnectionClientID:rtcpNWConnectionClientID:options:error:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVCTextStream [%s] %s:%d Failed to initialize AVCTextStream because of invalid parameters", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithRTPNWConnectionClientID:rtcpNWConnectionClientID:options:error:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVCTextStream [%s] %s:%d Failed to allocate callback queue", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithRTPNWConnectionClientID:rtcpNWConnectionClientID:options:error:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVCTextStream [%s] %s:%d Failed to create in process VCTextStream as it is not supported", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithRTPNWConnectionClientID:rtcpNWConnectionClientID:options:error:.cold.5()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVCTextStream [%s] %s:%d Failed to instantiate servers side object", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)validateResultsDictionary:error:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVCTextStream [%s] %s:%d no results dict", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)validateResultsDictionary:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_12_10();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVCTextStream [%s] %s:%d server died", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)validateResultsDictionary:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_12_10();
  OUTLINED_FUNCTION_11_3(&dword_1D8A54000, v0, v1, "AVCTextStream [%s] %s:%d server died", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initializeServerWithNetworkSockets:(uint64_t)a1 callID:(void *)a2 error:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  __int16 v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a2)
    objc_msgSend((id)objc_msgSend(a2, "description"), "UTF8String");
  v8 = 136315906;
  v9 = a1;
  OUTLINED_FUNCTION_7_1();
  v10 = "-[AVCTextStream initializeServerWithNetworkSockets:callID:error:]";
  v11 = 1024;
  v12 = 253;
  v13 = v5;
  v14 = v6;
  OUTLINED_FUNCTION_11(&dword_1D8A54000, a3, v7, "AVCTextStream [%s] %s:%d error initializing no capabilities dict result[%s]", (uint8_t *)&v8);
  OUTLINED_FUNCTION_3_0();
}

void __55__AVCTextStream_registerBlocksForDelegateNotifications__block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  int v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  v2 = 283;
  _os_log_debug_impl(&dword_1D8A54000, v0, OS_LOG_TYPE_DEBUG, "AVCTextStream [%s] %s:%d AVCTextStream: server died, but AVCTextStream has already deallocated, NO-OP", v1, 0x1Cu);
  OUTLINED_FUNCTION_3();
}

- (void)configure:(NSObject *)a3 error:.cold.1(uint64_t a1, id *a2, NSObject *a3)
{
  __int16 v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (*a2)
    objc_msgSend((id)objc_msgSend(*a2, "description"), "UTF8String");
  v8 = 136315906;
  v9 = a1;
  OUTLINED_FUNCTION_7_1();
  v10 = "-[AVCTextStream configure:error:]";
  v11 = 1024;
  v12 = 462;
  v13 = v5;
  v14 = v6;
  OUTLINED_FUNCTION_11(&dword_1D8A54000, a3, v7, "AVCTextStream [%s] %s:%d Invalid text configuration: error[%s]", (uint8_t *)&v8);
  OUTLINED_FUNCTION_3_0();
}

- (void)validateInitializeConnectionResult:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_13_9();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVCTextStream [%s] %s:%d Missing result dictionary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)validateInitializeConnectionResult:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_13_9();
  OUTLINED_FUNCTION_11_3(&dword_1D8A54000, v0, v1, "AVCTextStream [%s] %s:%d Missing result dictionary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)validateInitializeConnectionResult:.cold.3()
{
  NSObject *v0;
  uint8_t v1[14];
  const char *v2;
  __int16 v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v2 = "-[AVCTextStream validateInitializeConnectionResult:]";
  v3 = 1024;
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v0, (uint64_t)v0, "AVCTextStream [%s] %s:%d Missing capabilities dictionary: result=%@", v1);
  OUTLINED_FUNCTION_3();
}

- (void)validateInitializeConnectionResult:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_14(&dword_1D8A54000, v0, v1, "AVCTextStream [%s] %s:%d Missing capabilities dictionary: result=%@");
  OUTLINED_FUNCTION_3();
}

- (void)validateInitializeConnectionResult:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_11_16();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVCTextStream [%s] %s:%d Missing stream token", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)validateInitializeConnectionResult:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_11_16();
  OUTLINED_FUNCTION_11_3(&dword_1D8A54000, v0, v1, "AVCTextStream [%s] %s:%d Missing stream token", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)validateInitializeConnectionResult:.cold.7()
{
  NSObject *v0;
  uint8_t v1[14];
  const char *v2;
  __int16 v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v2 = "-[AVCTextStream validateInitializeConnectionResult:]";
  v3 = 1024;
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v0, (uint64_t)v0, "AVCTextStream [%s] %s:%d IPC Timeout: result=%@", v1);
  OUTLINED_FUNCTION_3();
}

- (void)validateInitializeConnectionResult:.cold.8()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_14(&dword_1D8A54000, v0, v1, "AVCTextStream [%s] %s:%d IPC Timeout: result=%@");
  OUTLINED_FUNCTION_3();
}

- (void)validateInitializeConnectionResult:(NSObject *)a3 .cold.9(uint64_t a1, void *a2, NSObject *a3)
{
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("ERROR"));
  v5 = 136316162;
  v6 = a1;
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_6_17();
  _os_log_error_impl(&dword_1D8A54000, a3, OS_LOG_TYPE_ERROR, "AVCTextStream [%s] %s:%d error=%@, result=%@", (uint8_t *)&v5, 0x30u);
  OUTLINED_FUNCTION_9_1();
}

- (void)validateInitializeConnectionResult:(NSObject *)a3 .cold.10(uint64_t a1, void *a2, NSObject *a3)
{
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("ERROR"));
  v5 = 136316162;
  v6 = a1;
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_6_17();
  _os_log_fault_impl(&dword_1D8A54000, a3, OS_LOG_TYPE_FAULT, "AVCTextStream [%s] %s:%d error=%@, result=%@", (uint8_t *)&v5, 0x30u);
  OUTLINED_FUNCTION_9_1();
}

- (void)validateInitializeConnectionResult:.cold.11()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_14_14();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVCTextStream [%s] %s:%d Server died", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)validateInitializeConnectionResult:.cold.12()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_14_14();
  OUTLINED_FUNCTION_11_3(&dword_1D8A54000, v0, v1, "AVCTextStream [%s] %s:%d Server died", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupTextStreamOutOfProcessWithClientArgs:error:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVCTextStream [%s] %s:%d Failed to allocate callback XPC connection", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
