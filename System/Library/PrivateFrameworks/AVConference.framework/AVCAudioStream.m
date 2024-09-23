@implementation AVCAudioStream

- (AVCAudioStream)initWithLocalAddress:(id)a3 error:(id *)a4
{
  uint64_t v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v9 = *a4;
      *(_DWORD *)buf = 136316162;
      v12 = v7;
      v13 = 2080;
      v14 = "-[AVCAudioStream initWithLocalAddress:error:]";
      v15 = 1024;
      v16 = 75;
      v17 = 2112;
      v18 = a3;
      v19 = 2112;
      v20 = v9;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d localAddress=%@, error=%@", buf, 0x30u);
    }
  }
  return -[AVCAudioStream initWithLocalAddress:networkSockets:IDSDestination:rtpConnectionClientID:rtcpConnectionClientID:callID:options:error:](self, "initWithLocalAddress:networkSockets:IDSDestination:rtpConnectionClientID:rtcpConnectionClientID:callID:options:error:", a3, 0, 0, 0, 0, 0, 0, a4);
}

- (AVCAudioStream)initWithLocalAddress:(id)a3 callID:(id)a4 error:(id *)a5
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
      v16 = "-[AVCAudioStream initWithLocalAddress:callID:error:]";
      v17 = 1024;
      v18 = 80;
      v19 = 2112;
      v20 = a3;
      v21 = 2112;
      v22 = a4;
      v23 = 2112;
      v24 = v11;
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d localAddress=%@, callID=%@, error=%@", buf, 0x3Au);
    }
  }
  return -[AVCAudioStream initWithLocalAddress:networkSockets:IDSDestination:rtpConnectionClientID:rtcpConnectionClientID:callID:options:error:](self, "initWithLocalAddress:networkSockets:IDSDestination:rtpConnectionClientID:rtcpConnectionClientID:callID:options:error:", a3, 0, 0, 0, 0, a4, 0, a5);
}

- (AVCAudioStream)initWithLocalAddress:(id)a3 isOriginator:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
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
  _BOOL4 v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v6 = a4;
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
      v16 = "-[AVCAudioStream initWithLocalAddress:isOriginator:error:]";
      v17 = 1024;
      v18 = 85;
      v19 = 2112;
      v20 = a3;
      v21 = 1024;
      v22 = v6;
      v23 = 2112;
      v24 = v11;
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d localAddress=%@, isOriginator=%d, error=%@", buf, 0x36u);
    }
  }
  return -[AVCAudioStream initWithLocalAddress:networkSockets:IDSDestination:rtpConnectionClientID:rtcpConnectionClientID:callID:options:error:](self, "initWithLocalAddress:networkSockets:IDSDestination:rtpConnectionClientID:rtcpConnectionClientID:callID:options:error:", a3, 0, 0, 0, 0, 0, 0, a5);
}

- (AVCAudioStream)initWithLocalAddress:(id)a3 isOriginator:(BOOL)a4 callID:(id)a5 error:(id *)a6
{
  _BOOL4 v8;
  uint64_t v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  id v22;
  __int16 v23;
  _BOOL4 v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v8 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v13 = *a6;
      *(_DWORD *)buf = 136316674;
      v16 = v11;
      v17 = 2080;
      v18 = "-[AVCAudioStream initWithLocalAddress:isOriginator:callID:error:]";
      v19 = 1024;
      v20 = 90;
      v21 = 2112;
      v22 = a3;
      v23 = 1024;
      v24 = v8;
      v25 = 2112;
      v26 = a5;
      v27 = 2112;
      v28 = v13;
      _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d localAddress=%@, isOriginator=%d, callID=%@, error=%@", buf, 0x40u);
    }
  }
  return -[AVCAudioStream initWithLocalAddress:networkSockets:IDSDestination:rtpConnectionClientID:rtcpConnectionClientID:callID:options:error:](self, "initWithLocalAddress:networkSockets:IDSDestination:rtpConnectionClientID:rtcpConnectionClientID:callID:options:error:", a3, 0, 0, 0, 0, a5, 0, a6);
}

- (AVCAudioStream)initWithNetworkSockets:(id)a3 isOriginator:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
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
  _BOOL4 v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v6 = a4;
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
      v16 = "-[AVCAudioStream initWithNetworkSockets:isOriginator:error:]";
      v17 = 1024;
      v18 = 95;
      v19 = 2112;
      v20 = a3;
      v21 = 1024;
      v22 = v6;
      v23 = 2112;
      v24 = v11;
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d socketsDictionary=%@, isOriginator=%d, error=%@", buf, 0x36u);
    }
  }
  return -[AVCAudioStream initWithLocalAddress:networkSockets:IDSDestination:rtpConnectionClientID:rtcpConnectionClientID:callID:options:error:](self, "initWithLocalAddress:networkSockets:IDSDestination:rtpConnectionClientID:rtcpConnectionClientID:callID:options:error:", 0, a3, 0, 0, 0, 0, 0, a5);
}

- (AVCAudioStream)initWithNetworkSockets:(id)a3 isOriginator:(BOOL)a4 callID:(id)a5 error:(id *)a6
{
  _BOOL4 v8;
  uint64_t v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  id v22;
  __int16 v23;
  _BOOL4 v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v8 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v13 = *a6;
      *(_DWORD *)buf = 136316674;
      v16 = v11;
      v17 = 2080;
      v18 = "-[AVCAudioStream initWithNetworkSockets:isOriginator:callID:error:]";
      v19 = 1024;
      v20 = 100;
      v21 = 2112;
      v22 = a3;
      v23 = 1024;
      v24 = v8;
      v25 = 2112;
      v26 = a5;
      v27 = 2112;
      v28 = v13;
      _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d socketsDictionary=%@, isOriginator=%d, callID=%@, error=%@", buf, 0x40u);
    }
  }
  return -[AVCAudioStream initWithLocalAddress:networkSockets:IDSDestination:rtpConnectionClientID:rtcpConnectionClientID:callID:options:error:](self, "initWithLocalAddress:networkSockets:IDSDestination:rtpConnectionClientID:rtcpConnectionClientID:callID:options:error:", 0, a3, 0, 0, 0, a5, 0, a6);
}

- (AVCAudioStream)initWithNetworkSockets:(id)a3 options:(id)a4 error:(id *)a5
{
  void *v9;
  int v10;
  const char *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  char *v15;
  os_log_t *v16;
  uint64_t v17;
  NSObject *v18;
  void *v20;
  AVCAudioStream *v21;
  id v22;
  char *__lasts;
  char *__str;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("avcMediaStreamOptionCallID")))
    v9 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("avcMediaStreamOptionCallID"));
  else
    v9 = 0;
  if (objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("avcMediaStreamOptionIsOriginator")))
    v10 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("avcMediaStreamOptionIsOriginator")), "BOOLValue");
  else
    v10 = 0;
  if ((int)VRTraceGetErrorLogLevelForModule() < 6)
    return -[AVCAudioStream initWithLocalAddress:networkSockets:IDSDestination:rtpConnectionClientID:rtcpConnectionClientID:callID:options:error:](self, "initWithLocalAddress:networkSockets:IDSDestination:rtpConnectionClientID:rtcpConnectionClientID:callID:options:error:", 0, a3, 0, 0, 0, v9, a4, a5);
  __str = 0;
  if (a3)
  {
    v11 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
    if (v9)
      goto LABEL_10;
LABEL_13:
    v12 = "<nil>";
    if (a4)
      goto LABEL_11;
    goto LABEL_14;
  }
  v11 = "<nil>";
  if (!v9)
    goto LABEL_13;
LABEL_10:
  v12 = (const char *)objc_msgSend((id)objc_msgSend(v9, "description"), "UTF8String");
  if (a4)
  {
LABEL_11:
    v13 = (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
    goto LABEL_15;
  }
LABEL_14:
  v13 = "<nil>";
LABEL_15:
  if (*a5)
    v14 = (const char *)objc_msgSend((id)objc_msgSend(*a5, "description"), "UTF8String");
  else
    v14 = "<nil>";
  asprintf(&__str, "socketsDictionary=%s, isOriginator=%d, callID=%s, options=%s, error=%s", v11, v10, v12, v13, v14);
  if (__str)
  {
    v20 = v9;
    v21 = self;
    v22 = a3;
    __lasts = 0;
    v15 = strtok_r(__str, "\n", &__lasts);
    v16 = (os_log_t *)MEMORY[0x1E0CF2758];
    do
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v17 = VRTraceErrorLogLevelToCSTR();
        v18 = *v16;
        if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          v26 = v17;
          v27 = 2080;
          v28 = "-[AVCAudioStream initWithNetworkSockets:options:error:]";
          v29 = 1024;
          v30 = 114;
          v31 = 2080;
          v32 = "";
          v33 = 2080;
          v34 = v15;
          _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d %s %s", buf, 0x30u);
        }
      }
      v15 = strtok_r(0, "\n", &__lasts);
    }
    while (v15);
    free(__str);
    self = v21;
    a3 = v22;
    v9 = v20;
  }
  return -[AVCAudioStream initWithLocalAddress:networkSockets:IDSDestination:rtpConnectionClientID:rtcpConnectionClientID:callID:options:error:](self, "initWithLocalAddress:networkSockets:IDSDestination:rtpConnectionClientID:rtcpConnectionClientID:callID:options:error:", 0, a3, 0, 0, 0, v9, a4, a5);
}

- (AVCAudioStream)initWithIDSDestination:(id)a3 isOriginator:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
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
  _BOOL4 v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v6 = a4;
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
      v16 = "-[AVCAudioStream initWithIDSDestination:isOriginator:error:]";
      v17 = 1024;
      v18 = 120;
      v19 = 2112;
      v20 = a3;
      v21 = 1024;
      v22 = v6;
      v23 = 2112;
      v24 = v11;
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d destination=%@, isOriginator=%d, error=%@", buf, 0x36u);
    }
  }
  return -[AVCAudioStream initWithLocalAddress:networkSockets:IDSDestination:rtpConnectionClientID:rtcpConnectionClientID:callID:options:error:](self, "initWithLocalAddress:networkSockets:IDSDestination:rtpConnectionClientID:rtcpConnectionClientID:callID:options:error:", 0, 0, a3, 0, 0, 0, 0, a5);
}

- (AVCAudioStream)initWithIDSDestination:(id)a3 isOriginator:(BOOL)a4 callID:(id)a5 error:(id *)a6
{
  _BOOL4 v8;
  uint64_t v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  id v22;
  __int16 v23;
  _BOOL4 v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v8 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v13 = *a6;
      *(_DWORD *)buf = 136316674;
      v16 = v11;
      v17 = 2080;
      v18 = "-[AVCAudioStream initWithIDSDestination:isOriginator:callID:error:]";
      v19 = 1024;
      v20 = 125;
      v21 = 2112;
      v22 = a3;
      v23 = 1024;
      v24 = v8;
      v25 = 2112;
      v26 = a5;
      v27 = 2112;
      v28 = v13;
      _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d destination=%@, isOriginator=%d, callID=%@, error=%@", buf, 0x40u);
    }
  }
  return -[AVCAudioStream initWithLocalAddress:networkSockets:IDSDestination:rtpConnectionClientID:rtcpConnectionClientID:callID:options:error:](self, "initWithLocalAddress:networkSockets:IDSDestination:rtpConnectionClientID:rtcpConnectionClientID:callID:options:error:", 0, 0, a3, 0, 0, a5, 0, a6);
}

- (AVCAudioStream)initWithRTPNWConnectionClientID:(id)a3 rtcpNWConnectionClientID:(id)a4 options:(id)a5 error:(id *)a6
{
  uint64_t v11;
  int v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  const char *v16;
  uint64_t v18;
  uint64_t v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  int v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  const char *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("avcMediaStreamOptionCallID")))
    v11 = objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("avcMediaStreamOptionCallID"));
  else
    v11 = 0;
  if (objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("avcMediaStreamOptionIsOriginator")))
    v12 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("avcMediaStreamOptionIsOriginator")), "BOOLValue");
  else
    v12 = 0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v19 = objc_msgSend(a3, "UUIDString");
      v18 = objc_msgSend(a4, "UUIDString");
      if (a5)
        v15 = (const char *)objc_msgSend((id)objc_msgSend(a5, "description"), "UTF8String");
      else
        v15 = "<nil>";
      if (*a6)
        v16 = (const char *)objc_msgSend((id)objc_msgSend(*a6, "description"), "UTF8String");
      else
        v16 = "<nil>";
      *(_DWORD *)buf = 136317186;
      v21 = v13;
      v22 = 2080;
      v23 = "-[AVCAudioStream initWithRTPNWConnectionClientID:rtcpNWConnectionClientID:options:error:]";
      v24 = 1024;
      v25 = 138;
      v26 = 2112;
      v27 = v19;
      v28 = 2112;
      v29 = v18;
      v30 = 1024;
      v31 = v12;
      v32 = 2112;
      v33 = v11;
      v34 = 2080;
      v35 = v15;
      v36 = 2080;
      v37 = v16;
      _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d rtpClientID=%@, rtcpClientID=%@, isOriginator=%d, callID=%@, options=%s, error=%s", buf, 0x54u);
    }
  }
  if (a3)
    return -[AVCAudioStream initWithLocalAddress:networkSockets:IDSDestination:rtpConnectionClientID:rtcpConnectionClientID:callID:options:error:](self, "initWithLocalAddress:networkSockets:IDSDestination:rtpConnectionClientID:rtcpConnectionClientID:callID:options:error:", 0, 0, 0, objc_msgSend(a3, "UUIDString"), objc_msgSend(a4, "UUIDString"), v11, a5, a6);
  if (a6)
    *a6 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "AVConferenceServiceError:detailCode:description:", 32000, 0, CFSTR("rtpClientID cannot not be nil"));

  return 0;
}

- (AVCAudioStream)initWithLocalAddress:(id)a3 networkSockets:(id)a4 IDSDestination:(id)a5 rtpConnectionClientID:(id)a6 rtcpConnectionClientID:(id)a7 callID:(id)a8 options:(id)a9 error:(id *)a10
{
  id v17;
  const char *v18;
  const char *v19;
  const char *v20;
  const char *v21;
  const char *v22;
  const char *v23;
  char *v24;
  os_log_t *v25;
  uint64_t v26;
  NSObject *v27;
  AVCAudioStream *v28;
  AVCAudioStream *v29;
  id v30;
  NSObject *CustomRootQueue;
  BOOL v32;
  BOOL v33;
  uint64_t v34;
  NSObject *v35;
  pid_t v36;
  int streamToken;
  const __CFString *v38;
  uint64_t v39;
  NSObject *v40;
  id v42;
  id v43;
  AVCAudioStream *v44;
  id v45;
  id v46;
  const char *v47;
  objc_super v48;
  char *__lasts;
  char *__str;
  uint8_t buf[4];
  uint64_t v52;
  __int16 v53;
  const char *v54;
  __int16 v55;
  int v56;
  __int16 v57;
  const char *v58;
  __int16 v59;
  _BYTE v60[14];
  __int16 v61;
  int v62;
  __int16 v63;
  const __CFString *v64;
  uint64_t v65;

  v17 = a9;
  v65 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() < 7)
    goto LABEL_28;
  __str = 0;
  if (a3)
  {
    v47 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
    if (a4)
    {
LABEL_4:
      v18 = (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
      goto LABEL_7;
    }
  }
  else
  {
    v47 = "<nil>";
    if (a4)
      goto LABEL_4;
  }
  v18 = "<nil>";
LABEL_7:
  v45 = a3;
  if (a5)
    v19 = (const char *)objc_msgSend((id)objc_msgSend(a5, "description"), "UTF8String");
  else
    v19 = "<nil>";
  v46 = a6;
  if (a6)
    v20 = (const char *)objc_msgSend((id)objc_msgSend(a6, "description"), "UTF8String");
  else
    v20 = "<nil>";
  v44 = self;
  if (a7)
  {
    v21 = (const char *)objc_msgSend((id)objc_msgSend(a7, "description"), "UTF8String");
    if (a8)
      goto LABEL_15;
LABEL_18:
    v22 = "<nil>";
    if (a9)
      goto LABEL_16;
LABEL_19:
    v23 = "<nil>";
    goto LABEL_20;
  }
  v21 = "<nil>";
  if (!a8)
    goto LABEL_18;
LABEL_15:
  v22 = (const char *)objc_msgSend((id)objc_msgSend(a8, "description"), "UTF8String");
  if (!a9)
    goto LABEL_19;
LABEL_16:
  v23 = (const char *)objc_msgSend((id)objc_msgSend(a9, "description"), "UTF8String");
LABEL_20:
  asprintf(&__str, "localAddress=%s, socketsDictionary=%s, destination=%s, rtpConnectionClientID=%s, rtcpConnectionClientID=%s, callID=%s, options=%s", v47, v18, v19, v20, v21, v22, v23);
  if (__str)
  {
    v42 = a7;
    v43 = a4;
    __lasts = 0;
    v24 = strtok_r(__str, "\n", &__lasts);
    v25 = (os_log_t *)MEMORY[0x1E0CF2758];
    do
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v26 = VRTraceErrorLogLevelToCSTR();
        v27 = *v25;
        if (os_log_type_enabled(*v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          v52 = v26;
          v53 = 2080;
          v54 = "-[AVCAudioStream initWithLocalAddress:networkSockets:IDSDestination:rtpConnectionClientID:rtcpConnection"
                "ClientID:callID:options:error:]";
          v55 = 1024;
          v56 = 152;
          v57 = 2080;
          v58 = "";
          v59 = 2080;
          *(_QWORD *)v60 = v24;
          _os_log_impl(&dword_1D8A54000, v27, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d %s %s", buf, 0x30u);
        }
      }
      v24 = strtok_r(0, "\n", &__lasts);
    }
    while (v24);
    free(__str);
    a4 = v43;
    a7 = v42;
    v17 = a9;
  }
  a3 = v45;
  a6 = v46;
  self = v44;
LABEL_28:
  v48.receiver = self;
  v48.super_class = (Class)AVCAudioStream;
  v28 = -[AVCAudioStream init](&v48, sel_init);
  if (v28)
  {
    v29 = v28;
    v28->_isInProcess = -[AVCAudioStream shouldRunInProcessWithOptions:](v28, "shouldRunInProcessWithOptions:", v17);
    -[AVCAudioStream refreshLoggingParameters](v29, "refreshLoggingParameters");
    v30 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (a3)
    {
      objc_msgSend(v30, "setObject:forKeyedSubscript:", objc_msgSend(a3, "ip"), CFSTR("vcMediaStreamSourceIP"));
      objc_msgSend(v30, "setObject:forKeyedSubscript:", objc_msgSend(a3, "interfaceName"), CFSTR("vcMediaStreamSourceInterfaceName"));
    }
    if (a5)
      objc_msgSend(v30, "setObject:forKeyedSubscript:", a5, CFSTR("vcMediaStreamDestID"));
    if (a6)
      objc_msgSend(v30, "setObject:forKeyedSubscript:", a6, CFSTR("vcMediaStreamConnectionClientID"));
    if (a7)
      objc_msgSend(v30, "setObject:forKeyedSubscript:", a7, CFSTR("vcMediaStreamRTCPConnectionClientID"));
    if (a8)
      objc_msgSend(v30, "setObject:forKeyedSubscript:", a8, CFSTR("vcMediaStreamCallID"));
    if (objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("avcMediaStreamOptionRemoteEndpointInfo")))
      objc_msgSend(v30, "setObject:forKeyedSubscript:", objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("avcMediaStreamOptionRemoteEndpointInfo")), CFSTR("vcMediaStreamRemoteEndpointInfo"));
    if (objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("avcMediaStreamOptionClientName")))
      objc_msgSend(v30, "setObject:forKeyedSubscript:", objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("avcMediaStreamOptionClientName")), CFSTR("vcMediaStreamClientName"));
    if (objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("avcMediaStreamOptionClientSessionID")))
    {
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("avcMediaStreamOptionClientSessionID"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v30, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("avcMediaStreamOptionClientSessionID")), "UUIDString"), CFSTR("vcMediaStreamClientSessionID"));
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCAudioStream initWithLocalAddress:networkSockets:IDSDestination:rtpConnectionClientID:rtcpConnectionClientID:callID:options:error:].cold.1();
      }
    }
    objc_msgSend(v30, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", VCFeatureFlagManager_CallRecordingEnabled()), CFSTR("vcMediaStreamSetUpCaptioning"));
    objc_msgSend(v30, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", VCFeatureFlagManager_CallRecordingEnabled()), CFSTR("vcMediaStreamSetUpRecording"));
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    v29->_callbackQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.avcaudiostream.callback.queue", 0, CustomRootQueue);
    if (v29->_isInProcess)
      v32 = -[AVCAudioStream setupAudioStreamInProcessWithClientArgs:networkSockets:error:](v29, "setupAudioStreamInProcessWithClientArgs:networkSockets:error:", v30, a4, a10);
    else
      v32 = -[AVCAudioStream setupAudioStreamOutOfProcessWithClientArgs:networkSockets:error:](v29, "setupAudioStreamOutOfProcessWithClientArgs:networkSockets:error:", v30, a4, a10);
    v33 = v32;

    if (v33)
    {
      MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCAudioStream-init");
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v34 = VRTraceErrorLogLevelToCSTR();
        v35 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v36 = getpid();
          streamToken = v29->_streamToken;
          if (a10)
            v38 = (const __CFString *)*a10;
          else
            v38 = CFSTR("None");
          *(_DWORD *)buf = 136316930;
          v52 = v34;
          v53 = 2080;
          v54 = "-[AVCAudioStream initWithLocalAddress:networkSockets:IDSDestination:rtpConnectionClientID:rtcpConnection"
                "ClientID:callID:options:error:]";
          v55 = 1024;
          v56 = 209;
          v57 = 2048;
          v58 = (const char *)v29;
          v59 = 1024;
          *(_DWORD *)v60 = v36;
          *(_WORD *)&v60[4] = 2112;
          *(_QWORD *)&v60[6] = a8;
          v61 = 1024;
          v62 = streamToken;
          v63 = 2112;
          v64 = v38;
          _os_log_impl(&dword_1D8A54000, v35, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d @:@ AVCAudioStream-init (%p) PID=%d, callID=%@, streamToken=%d, error=%@", buf, 0x46u);
        }
      }
      return v29;
    }

  }
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCAudioStream-init");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v39 = VRTraceErrorLogLevelToCSTR();
    v40 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v52 = v39;
      v53 = 2080;
      v54 = "-[AVCAudioStream initWithLocalAddress:networkSockets:IDSDestination:rtpConnectionClientID:rtcpConnectionClie"
            "ntID:callID:options:error:]";
      v55 = 1024;
      v56 = 211;
      v57 = 2048;
      v58 = 0;
      _os_log_impl(&dword_1D8A54000, v40, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d @:@ AVCAudioStream-init (%p)", buf, 0x26u);
    }
  }
  return 0;
}

- (BOOL)shouldRunInProcessWithOptions:(id)a3
{
  int v4;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  int v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  AVCAudioStream *v25;
  __int16 v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("avcMediaStreamOptionRunInProcess")), "BOOLValue");
  if ((AVCAudioStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v8 = "out of";
        v17 = v6;
        v16 = 136315906;
        v19 = "-[AVCAudioStream shouldRunInProcessWithOptions:]";
        v18 = 2080;
        if (v4)
          v8 = "in";
        v20 = 1024;
        v21 = 218;
        v22 = 2080;
        v23 = (void *)v8;
        v9 = "AVCAudioStream [%s] %s:%d AVCAudioStream will run %s process";
        v10 = v7;
        v11 = 38;
        goto LABEL_15;
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[AVCAudioStream performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v14 = "out of";
        v17 = v12;
        v16 = 136316418;
        v19 = "-[AVCAudioStream shouldRunInProcessWithOptions:]";
        v18 = 2080;
        if (v4)
          v14 = "in";
        v20 = 1024;
        v21 = 218;
        v22 = 2112;
        v23 = (void *)v5;
        v24 = 2048;
        v25 = self;
        v26 = 2080;
        v27 = v14;
        v9 = "AVCAudioStream [%s] %s:%d %@(%p) AVCAudioStream will run %s process";
        v10 = v13;
        v11 = 58;
LABEL_15:
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v16, v11);
      }
    }
  }
  return v4;
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
          -[AVCAudioStream validateInitializeConnectionResult:].cold.1();
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
      {
        -[AVCAudioStream validateInitializeConnectionResult:].cold.2();
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
          -[AVCAudioStream validateInitializeConnectionResult:].cold.15();
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
      {
        -[AVCAudioStream validateInitializeConnectionResult:].cold.16();
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
          -[AVCAudioStream validateInitializeConnectionResult:].cold.13(v4, a3, v6);
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
      {
        -[AVCAudioStream validateInitializeConnectionResult:].cold.14(v4, a3, v6);
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
            -[AVCAudioStream validateInitializeConnectionResult:].cold.11();
        }
        else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
        {
          -[AVCAudioStream validateInitializeConnectionResult:].cold.12();
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
            -[AVCAudioStream validateInitializeConnectionResult:].cold.3();
        }
        else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
        {
          -[AVCAudioStream validateInitializeConnectionResult:].cold.4();
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
            -[AVCAudioStream validateInitializeConnectionResult:].cold.5();
        }
        else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
        {
          -[AVCAudioStream validateInitializeConnectionResult:].cold.6();
        }
      }
      v7 = (void *)MEMORY[0x1E0CB35C8];
      v8 = CFSTR("Missing stream token");
      return (id)objc_msgSend(v7, "AVConferenceServiceError:detailCode:description:", 32000, 0, v8);
    }
    if (!objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamTokenUplink")))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
      {
        VRTraceErrorLogLevelToCSTR();
        if ((VRTraceIsOSFaultDisabled() & 1) != 0)
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[AVCAudioStream validateInitializeConnectionResult:].cold.7();
        }
        else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
        {
          -[AVCAudioStream validateInitializeConnectionResult:].cold.8();
        }
      }
      v7 = (void *)MEMORY[0x1E0CB35C8];
      v8 = CFSTR("Missing stream token (uplink)");
      return (id)objc_msgSend(v7, "AVConferenceServiceError:detailCode:description:", 32000, 0, v8);
    }
    if (!objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamTokenDownlink")))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
      {
        VRTraceErrorLogLevelToCSTR();
        if ((VRTraceIsOSFaultDisabled() & 1) != 0)
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[AVCAudioStream validateInitializeConnectionResult:].cold.9();
        }
        else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
        {
          -[AVCAudioStream validateInitializeConnectionResult:].cold.10();
        }
      }
      v7 = (void *)MEMORY[0x1E0CB35C8];
      v8 = CFSTR("Missing stream token (downlink)");
      return (id)objc_msgSend(v7, "AVConferenceServiceError:detailCode:description:", 32000, 0, v8);
    }
    return 0;
  }
}

- (void)refreshLoggingParameters
{
  CFPreferencesAppSynchronize(CFSTR("com.apple.VideoConference"));
  CFPreferencesAppSynchronize((CFStringRef)*MEMORY[0x1E0C9B248]);
  VRTraceReset();
  VRTracePrintLoggingInfo();
}

- (void)terminateSession
{
  if (!self->_isInProcess)
  {
    -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcMediaStreamDidServerDie");
    -[AVConferenceXPCClient sendMessageSync:](self->_connection, "sendMessageSync:", "vcMediaStreamTerminateAudio");

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
  AVCAudioStream *v22;
  __int16 v23;
  AVCAudioStream *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if ((AVCAudioStream *)objc_opt_class() == self)
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
    v18 = "-[AVCAudioStream dealloc]";
    v19 = 1024;
    v20 = 274;
    v6 = "AVCAudioStream [%s] %s:%d ";
    v7 = v5;
    v8 = 28;
    goto LABEL_11;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = (const __CFString *)-[AVCAudioStream performSelector:](self, "performSelector:", sel_logPrefix);
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
      v18 = "-[AVCAudioStream dealloc]";
      v19 = 1024;
      v20 = 274;
      v21 = 2112;
      v22 = (AVCAudioStream *)v3;
      v23 = 2048;
      v24 = self;
      v6 = "AVCAudioStream [%s] %s:%d %@(%p) ";
      v7 = v10;
      v8 = 48;
LABEL_11:
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
    }
  }
LABEL_12:
  -[AVCAudioStream setCapabilities:](self, "setCapabilities:", 0);
  -[AVCAudioStream setConfiguration:](self, "setConfiguration:", 0);
  if (self->_isInProcess)
  {
    -[VCMediaStream stop](self->_opaqueStream, "stop");
    -[VCMediaStream setDelegate:](self->_opaqueStream, "setDelegate:", 0);

  }
  else
  {
    -[AVCAudioStream deregisterBlocksForDelegateNotifications](self, "deregisterBlocksForDelegateNotifications");
    -[AVCAudioStream terminateSession](self, "terminateSession");
  }
  callbackQueue = self->_callbackQueue;
  if (callbackQueue)
  {
    dispatch_release(callbackQueue);
    self->_callbackQueue = 0;
  }
  objc_storeWeak(&self->_delegate, 0);
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCAudioStream-dealloc");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v16 = v12;
      v17 = 2080;
      v18 = "-[AVCAudioStream dealloc]";
      v19 = 1024;
      v20 = 292;
      v21 = 2048;
      v22 = self;
      _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d @:@ AVCAudioStream-dealloc (%p)", buf, 0x26u);
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)AVCAudioStream;
  -[AVCAudioStream dealloc](&v14, sel_dealloc);
}

- (AVCAudioStreamDelegate)delegate
{
  return (AVCAudioStreamDelegate *)objc_loadWeak(&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_delegate, a3);
}

- (BOOL)configure:(id)a3 error:(id *)a4
{
  const char *v7;
  const char *v8;
  char *v9;
  os_log_t *v10;
  uint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  const __CFString *v14;
  _BOOL4 v15;
  uint64_t v16;
  NSObject *v17;
  const __CFString *v18;
  uint64_t v19;
  char IsOSFaultDisabled;
  NSObject *v21;
  uint64_t v22;
  char v23;
  NSObject *v24;
  const char *v25;
  const char *v26;
  id *v28;
  char *__lasts;
  char *__str;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  AVCAudioStream *v38;
  __int16 v39;
  _BYTE v40[18];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    __str = 0;
    v7 = a3 ? (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String") : "<nil>";
    v8 = *a4 ? (const char *)objc_msgSend((id)objc_msgSend(*a4, "description"), "UTF8String") : "<nil>";
    asprintf(&__str, "configuration=%s, error=%s", v7, v8);
    if (__str)
    {
      v28 = a4;
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
            v32 = v11;
            v33 = 2080;
            v34 = "-[AVCAudioStream configure:error:]";
            v35 = 1024;
            v36 = 307;
            v37 = 2080;
            v38 = (AVCAudioStream *)"";
            v39 = 2080;
            *(_QWORD *)v40 = v9;
            _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d %s %s", buf, 0x30u);
          }
        }
        v9 = strtok_r(0, "\n", &__lasts);
      }
      while (v9);
      free(__str);
      a4 = v28;
    }
  }
  if ((objc_msgSend(a3, "isValidAudioConfig") & 1) != 0)
  {
    if (self->_isInProcess)
      v13 = -[AVCAudioStream configureInProcess:error:](self, "configureInProcess:error:", a3, a4);
    else
      v13 = -[AVCAudioStream configureOutOfProcess:error:](self, "configureOutOfProcess:error:", a3, a4);
    v15 = v13;
    MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCAudioStream-configure");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        if (a4)
          v18 = (const __CFString *)*a4;
        else
          v18 = CFSTR("None");
        *(_DWORD *)buf = 136316418;
        v32 = v16;
        v33 = 2080;
        v34 = "-[AVCAudioStream configure:error:]";
        v35 = 1024;
        v36 = 326;
        v37 = 2048;
        v38 = self;
        v39 = 1024;
        *(_DWORD *)v40 = v15;
        *(_WORD *)&v40[4] = 2112;
        *(_QWORD *)&v40[6] = v18;
        _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d @:@ AVCAudioStream-configure (%p) didSucceed=%d, error=%@", buf, 0x36u);
      }
    }
  }
  else
  {
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a4, 32016, 105, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/AVCAudioStream.m", 314), CFSTR("Invalid Parameter"), CFSTR("Called with an invalid parameter"));
    if ((AVCAudioStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
      {
        v19 = VRTraceErrorLogLevelToCSTR();
        IsOSFaultDisabled = VRTraceIsOSFaultDisabled();
        v21 = *MEMORY[0x1E0CF2758];
        if ((IsOSFaultDisabled & 1) != 0)
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[AVCAudioStream configure:error:].cold.1(v19, a4, v21);
        }
        else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
        {
          -[AVCAudioStream configure:error:].cold.2(v19, a4, v21);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v14 = (const __CFString *)-[AVCAudioStream performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v14 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
      {
        v22 = VRTraceErrorLogLevelToCSTR();
        v23 = VRTraceIsOSFaultDisabled();
        v24 = *MEMORY[0x1E0CF2758];
        if ((v23 & 1) != 0)
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            if (*a4)
              v25 = (const char *)objc_msgSend((id)objc_msgSend(*a4, "description"), "UTF8String");
            else
              v25 = "<nil>";
            *(_DWORD *)buf = 136316418;
            v32 = v22;
            v33 = 2080;
            v34 = "-[AVCAudioStream configure:error:]";
            v35 = 1024;
            v36 = 317;
            v37 = 2112;
            v38 = (AVCAudioStream *)v14;
            v39 = 2048;
            *(_QWORD *)v40 = self;
            *(_WORD *)&v40[8] = 2080;
            *(_QWORD *)&v40[10] = v25;
            _os_log_error_impl(&dword_1D8A54000, v24, OS_LOG_TYPE_ERROR, "AVCAudioStream [%s] %s:%d %@(%p) Invalid audio configuration: error[%s]", buf, 0x3Au);
          }
        }
        else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
        {
          if (*a4)
            v26 = (const char *)objc_msgSend((id)objc_msgSend(*a4, "description"), "UTF8String");
          else
            v26 = "<nil>";
          *(_DWORD *)buf = 136316418;
          v32 = v22;
          v33 = 2080;
          v34 = "-[AVCAudioStream configure:error:]";
          v35 = 1024;
          v36 = 317;
          v37 = 2112;
          v38 = (AVCAudioStream *)v14;
          v39 = 2048;
          *(_QWORD *)v40 = self;
          *(_WORD *)&v40[8] = 2080;
          *(_QWORD *)&v40[10] = v26;
          _os_log_fault_impl(&dword_1D8A54000, v24, OS_LOG_TYPE_FAULT, "AVCAudioStream [%s] %s:%d %@(%p) Invalid audio configuration: error[%s]", buf, 0x3Au);
        }
      }
    }
    LOBYTE(v15) = 0;
  }
  return v15;
}

- (void)start
{
  _BOOL4 isInProcess;
  int ErrorLogLevelForModule;
  uint64_t v5;
  NSObject *v6;
  id v7;
  VCAudioStream *opaqueStream;
  _BOOL8 v9;
  AVCAudioStream *v10;
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
  AVCAudioStream *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1DF087EC4](&dword_1D8A54000, "-[AVCAudioStream start]");
  if (!-[AVCAudioStream configuration](self, "configuration"))
  {
    v7 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "AVConferenceServiceError:detailCode:description:", 32016, 0, CFSTR("AVCAudioStream hasn't been configured"));
    opaqueStream = self->_opaqueStream;
    v10 = self;
    v9 = 0;
LABEL_8:
    -[AVCAudioStream vcMediaStream:didStartStream:error:](v10, "vcMediaStream:didStartStream:error:", opaqueStream, v9, v7);
    goto LABEL_13;
  }
  isInProcess = self->_isInProcess;
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (isInProcess)
  {
    if (ErrorLogLevelForModule >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v15 = 136315650;
        v16 = v5;
        v17 = 2080;
        v18 = "-[AVCAudioStream start]";
        v19 = 1024;
        v20 = 339;
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d AVCAudioStream start (not using XPC)", (uint8_t *)&v15, 0x1Cu);
      }
    }
    v7 = -[VCMediaStream start](self->_opaqueStream, "start");
    opaqueStream = self->_opaqueStream;
    v9 = v7 == 0;
    v10 = self;
    goto LABEL_8;
  }
  if (ErrorLogLevelForModule >= 6)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v15 = 136315650;
      v16 = v11;
      v17 = 2080;
      v18 = "-[AVCAudioStream start]";
      v19 = 1024;
      v20 = 336;
      _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d AVCAudioStream API_VCMEDIASTREAM_STARTCONFERENCE (client side)", (uint8_t *)&v15, 0x1Cu);
    }
  }
  -[AVConferenceXPCClient sendMessageAsync:](self->_connection, "sendMessageAsync:", "vcMediaStreamStartConference");
LABEL_13:
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCAudioStream-start");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v15 = 136315906;
      v16 = v13;
      v17 = 2080;
      v18 = "-[AVCAudioStream start]";
      v19 = 1024;
      v20 = 347;
      v21 = 2048;
      v22 = self;
      _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d @:@ AVCAudioStream-start (%p)", (uint8_t *)&v15, 0x26u);
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
  AVCAudioStream *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1DF087EC4](&dword_1D8A54000, "-[AVCAudioStream stop]");
  if (self->_isInProcess)
  {
    -[VCMediaStream stop](self->_opaqueStream, "stop");
    -[AVCAudioStream vcMediaStreamDidStop:](self, "vcMediaStreamDidStop:", self->_opaqueStream);
  }
  else
  {
    -[AVConferenceXPCClient sendMessageAsync:](self->_connection, "sendMessageAsync:", "vcMediaStreamStopConference");
  }
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCAudioStream-stop");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315906;
      v6 = v3;
      v7 = 2080;
      v8 = "-[AVCAudioStream stop]";
      v9 = 1024;
      v10 = 359;
      v11 = 2048;
      v12 = self;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d @:@ AVCAudioStream-stop (%p)", (uint8_t *)&v5, 0x26u);
    }
  }
}

- (void)pause
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint8_t buf[4];
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  AVCAudioStream *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1DF087EC4](&dword_1D8A54000, "-[AVCAudioStream pause]");
  if (self->_isInProcess)
  {
    v3 = -[VCMediaStream setPause:](self->_opaqueStream, "setPause:", 1);
    -[AVCAudioStream vcMediaStream:didPauseStream:error:](self, "vcMediaStream:didPauseStream:error:", self->_opaqueStream, v3 == 0, v3);
  }
  else
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", &unk_1E9EFB380, CFSTR("vcMediaStreamDictionary"), 0);
    -[AVConferenceXPCClient sendMessageAsync:arguments:](self->_connection, "sendMessageAsync:arguments:", "vcMediaStreamSetPause", v4);

  }
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCAudioStream-pause");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v8 = v5;
      v9 = 2080;
      v10 = "-[AVCAudioStream pause]";
      v11 = 1024;
      v12 = 376;
      v13 = 2048;
      v14 = self;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d @:@ AVCAudioStream-pause (%p)", buf, 0x26u);
    }
  }
}

- (void)resume
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint8_t buf[4];
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  AVCAudioStream *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1DF087EC4](&dword_1D8A54000, "-[AVCAudioStream resume]");
  if (self->_isInProcess)
  {
    v3 = -[VCMediaStream setPause:](self->_opaqueStream, "setPause:", 0);
    -[AVCAudioStream vcMediaStream:didResumeStream:error:](self, "vcMediaStream:didResumeStream:error:", self->_opaqueStream, v3 == 0, v3);
  }
  else
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", &unk_1E9EFB3A8, CFSTR("vcMediaStreamDictionary"), 0);
    -[AVConferenceXPCClient sendMessageAsync:arguments:](self->_connection, "sendMessageAsync:arguments:", "vcMediaStreamSetPause", v4);

  }
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCAudioStream-resume");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v8 = v5;
      v9 = 2080;
      v10 = "-[AVCAudioStream resume]";
      v11 = 1024;
      v12 = 393;
      v13 = 2048;
      v14 = self;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d @:@ AVCAudioStream-resume (%p)", buf, 0x26u);
    }
  }
}

- (void)sendDTMFDigitString:(id)a3 withVolume:(unsigned __int8)a4 duration:(unsigned __int16)a5 interval:(unsigned __int16)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];
  _QWORD v16[4];
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  id v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v31 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316674;
      v18 = v11;
      v19 = 2080;
      v20 = "-[AVCAudioStream sendDTMFDigitString:withVolume:duration:interval:]";
      v21 = 1024;
      v22 = 398;
      v23 = 2112;
      v24 = a3;
      v25 = 1024;
      v26 = v8;
      v27 = 1024;
      v28 = v7;
      v29 = 1024;
      v30 = v6;
      _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d digits=%@, volume=%hhu, duration=%hu, interval=%hu", buf, 0x38u);
    }
  }
  v16[0] = a3;
  v15[0] = CFSTR("event");
  v15[1] = CFSTR("volume");
  v16[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v8);
  v15[2] = CFSTR("duration");
  v16[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v7);
  v15[3] = CFSTR("interval");
  v16[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v6);
  v13 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
  if (self->_isInProcess)
  {
    -[VCAudioStream sendDTMFEvent:](self->_opaqueStream, "sendDTMFEvent:", v13);
  }
  else
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v13, CFSTR("vcMediaStreamDictionary"), 0);
    -[AVConferenceXPCClient sendMessageAsync:arguments:](self->_connection, "sendMessageAsync:arguments:", "vcMediaStreamSendDTMFEvent", v14);

  }
}

- (void)startContinuousDTMFWithDigit:(char)a3 volume:(unsigned __int8)a4
{
  uint64_t v4;
  int v5;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[4];
  _QWORD v13[4];
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v4 = a4;
  v5 = a3;
  v24 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v15 = v7;
      v16 = 2080;
      v17 = "-[AVCAudioStream startContinuousDTMFWithDigit:volume:]";
      v18 = 1024;
      v19 = 416;
      v20 = 1024;
      v21 = v5;
      v22 = 1024;
      v23 = v4;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d digit=%c, volume=%u", buf, 0x28u);
    }
  }
  v12[0] = CFSTR("event");
  v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v5);
  v13[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
  v12[1] = CFSTR("volume");
  v13[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v4);
  v13[2] = &unk_1E9EF6410;
  v12[2] = CFSTR("duration");
  v12[3] = CFSTR("interval");
  v13[3] = &unk_1E9EF6410;
  v9 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 4);
  if (self->_isInProcess)
  {
    -[VCAudioStream sendDTMFEvent:](self->_opaqueStream, "sendDTMFEvent:", v9);
  }
  else
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v9, CFSTR("vcMediaStreamDictionary"), 0);
    -[AVConferenceXPCClient sendMessageAsync:arguments:](self->_connection, "sendMessageAsync:arguments:", "vcMediaStreamSendDTMFEvent", v10);

  }
}

- (void)stopContinuousDTMF
{
  if (self->_isInProcess)
    -[VCAudioStream stopSendDTMFEvent](self->_opaqueStream, "stopSendDTMFEvent");
  else
    -[AVConferenceXPCClient sendMessageAsync:](self->_connection, "sendMessageAsync:", "vcMediaStreamStopSendDTMFEvent");
}

- (void)startSynchronizeWithStream:(int64_t)a3
{
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
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
      v14 = "-[AVCAudioStream startSynchronizeWithStream:]";
      v15 = 1024;
      v16 = 442;
      v17 = 2048;
      v18 = a3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d syncStreamToken=%ld", buf, 0x26u);
    }
  }
  if (!self->_isInProcess)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", a3);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v7, CFSTR("vcMediaStreamToken"), 0);
    -[AVConferenceXPCClient sendMessageAsync:arguments:](self->_connection, "sendMessageAsync:arguments:", "vcMediaStreamStartSynchronization", v8);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v12 = v9;
        v13 = 2080;
        v14 = "-[AVCAudioStream startSynchronizeWithStream:]";
        v15 = 1024;
        v16 = 450;
        v17 = 1024;
        LODWORD(v18) = a3;
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d AVCAudioStream: synchronizeWithStream %u", buf, 0x22u);
      }
    }

  }
}

+ (id)capabilities
{
  return +[VCAudioStream capabilities](VCAudioStream, "capabilities");
}

- (void)setJitterBufferMode:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
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
  int v19;
  uint64_t v20;

  v3 = *(_QWORD *)&a3;
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
      v15 = "-[AVCAudioStream setJitterBufferMode:]";
      v16 = 1024;
      v17 = 463;
      v18 = 1024;
      v19 = v3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d Handover between cellular and wifi AVCJitterBufferMode=%d", buf, 0x22u);
    }
  }
  if (-[AVCMediaStreamConfig jitterBufferMode](-[AVCAudioStream configuration](self, "configuration"), "jitterBufferMode") != (_DWORD)v3)
  {
    -[AVCMediaStreamConfig setJitterBufferMode:](-[AVCAudioStream configuration](self, "configuration"), "setJitterBufferMode:", v3);
    v7 = +[AVCMediaStreamConfig streamJitterBufferModeWithClientJitterBufferMode:](AVCMediaStreamConfig, "streamJitterBufferModeWithClientJitterBufferMode:", v3);
    if (self->_isInProcess)
    {
      -[VCAudioStream setJitterBufferMode:](self->_opaqueStream, "setJitterBufferMode:", v7);
    }
    else
    {
      v10 = CFSTR("vcMediaStreamJitterBufferMode");
      v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v7);
      v8 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v8, CFSTR("vcMediaStreamDictionary"), 0);
      -[AVConferenceXPCClient sendMessageAsync:arguments:](self->_connection, "sendMessageAsync:arguments:", "vcMediaStreamSetJitterBufferMode", v9);

    }
  }
}

- (unsigned)jitterBufferMode
{
  return -[AVCMediaStreamConfig jitterBufferMode](-[AVCAudioStream configuration](self, "configuration"), "jitterBufferMode");
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
      v14 = "-[AVCAudioStream setDirection:]";
      v15 = 1024;
      v16 = 489;
      v17 = 2048;
      v18 = a3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d direction=%ld", buf, 0x26u);
    }
  }
  if (-[AVCMediaStreamConfig direction](-[AVCAudioStream configuration](self, "configuration"), "direction") != a3)
  {
    -[AVCMediaStreamConfig setDirection:](-[AVCAudioStream configuration](self, "configuration"), "setDirection:", a3);
    if (self->_isInProcess)
    {
      -[VCAudioStream setStreamDirection:](self->_opaqueStream, "setStreamDirection:", +[AVCMediaStreamConfig streamDirectionWithClientDirection:](AVCMediaStreamConfig, "streamDirectionWithClientDirection:", a3));
    }
    else
    {
      v9 = CFSTR("vcMediaStreamDirection");
      v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v7 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v7, CFSTR("vcMediaStreamDictionary"), 0);
      -[AVConferenceXPCClient sendMessageAsync:arguments:](self->_connection, "sendMessageAsync:arguments:", "vcMediaStreamSetStreamDirection", v8);

    }
  }
}

- (int64_t)direction
{
  return -[AVCMediaStreamConfig direction](-[AVCAudioStream configuration](self, "configuration"), "direction");
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
      v14 = "-[AVCAudioStream setRtcpEnabled:]";
      v15 = 1024;
      v16 = 513;
      v17 = 1024;
      v18 = v3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d rtcpEnabled=%d", buf, 0x22u);
    }
  }
  if (-[AVCMediaStreamConfig isRTCPEnabled](-[AVCAudioStream configuration](self, "configuration"), "isRTCPEnabled") != v3)
  {
    -[AVCMediaStreamConfig setRtcpEnabled:](-[AVCAudioStream configuration](self, "configuration"), "setRtcpEnabled:", v3);
    if (self->_isInProcess)
    {
      -[VCMediaStream setRtcpEnabled:](self->_opaqueStream, "setRtcpEnabled:", v3);
    }
    else
    {
      v9 = CFSTR("vcMediaStreamRTCPEnabled");
      v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
      v7 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v7, CFSTR("vcMediaStreamDictionary"), 0);
      -[AVConferenceXPCClient sendMessageAsync:arguments:](self->_connection, "sendMessageAsync:arguments:", "vcMediaStreamSetRTCPEnabled", v8);

    }
  }
}

- (BOOL)isRTCPEnabled
{
  return -[AVCMediaStreamConfig isRTCPEnabled](-[AVCAudioStream configuration](self, "configuration"), "isRTCPEnabled");
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
      v14 = "-[AVCAudioStream setRtpTimeOutEnabled:]";
      v15 = 1024;
      v16 = 539;
      v17 = 1024;
      v18 = v3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d rtpTimeOutEnabled=%d", buf, 0x22u);
    }
  }
  if (-[AVCMediaStreamConfig isRTPTimeOutEnabled](-[AVCAudioStream configuration](self, "configuration"), "isRTPTimeOutEnabled") != v3)
  {
    -[AVCMediaStreamConfig setRtpTimeOutEnabled:](-[AVCAudioStream configuration](self, "configuration"), "setRtpTimeOutEnabled:", v3);
    if (self->_isInProcess)
    {
      -[VCMediaStream setRtpTimeOutEnabled:](self->_opaqueStream, "setRtpTimeOutEnabled:", v3);
    }
    else
    {
      v9 = CFSTR("vcMediaStreamRTPTimeoutEnabled");
      v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
      v7 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v7, CFSTR("vcMediaStreamDictionary"), 0);
      -[AVConferenceXPCClient sendMessageAsync:arguments:](self->_connection, "sendMessageAsync:arguments:", "vcMediaStreamSetRTPTimeoutEnabled", v8);

    }
  }
}

- (BOOL)isRTPTimeOutEnabled
{
  return -[AVCMediaStreamConfig isRTPTimeOutEnabled](-[AVCAudioStream configuration](self, "configuration"), "isRTPTimeOutEnabled");
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
      v14 = "-[AVCAudioStream setRtcpTimeOutEnabled:]";
      v15 = 1024;
      v16 = 565;
      v17 = 1024;
      v18 = v3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d rtcpTimeOutEnabled=%d", buf, 0x22u);
    }
  }
  if (-[AVCMediaStreamConfig isRTCPTimeOutEnabled](-[AVCAudioStream configuration](self, "configuration"), "isRTCPTimeOutEnabled") != v3)
  {
    -[AVCMediaStreamConfig setRtcpTimeOutEnabled:](-[AVCAudioStream configuration](self, "configuration"), "setRtcpTimeOutEnabled:", v3);
    if (self->_isInProcess)
    {
      -[VCMediaStream setRtcpTimeOutEnabled:](self->_opaqueStream, "setRtcpTimeOutEnabled:", v3);
    }
    else
    {
      v9 = CFSTR("vcMediaStreamRTCPTimeoutEnabled");
      v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
      v7 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v7, CFSTR("vcMediaStreamDictionary"), 0);
      -[AVConferenceXPCClient sendMessageAsync:arguments:](self->_connection, "sendMessageAsync:arguments:", "vcMediaStreamSetRTCPTimeoutEnabled", v8);

    }
  }
}

- (BOOL)isRTCPTimeOutEnabled
{
  return -[AVCMediaStreamConfig isRTCPTimeOutEnabled](-[AVCAudioStream configuration](self, "configuration"), "isRTCPTimeOutEnabled");
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
      v15 = "-[AVCAudioStream setRtpTimeOutIntervalSec:]";
      v16 = 1024;
      v17 = 591;
      v18 = 2048;
      v19 = a3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d rtpTimeOutIntervalSec=%f", buf, 0x26u);
    }
  }
  -[AVCMediaStreamConfig rtpTimeOutInterval](-[AVCAudioStream configuration](self, "configuration"), "rtpTimeOutInterval");
  if (v7 != a3)
  {
    -[AVCMediaStreamConfig setRtpTimeOutInterval:](-[AVCAudioStream configuration](self, "configuration"), "setRtpTimeOutInterval:", a3);
    if (self->_isInProcess)
    {
      -[VCMediaStream setRtpTimeOutInterval:](self->_opaqueStream, "setRtpTimeOutInterval:", a3);
    }
    else
    {
      v10 = CFSTR("vcMediaStreamRTPTimeoutInterval");
      v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
      v8 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v8, CFSTR("vcMediaStreamDictionary"), 0);
      -[AVConferenceXPCClient sendMessageAsync:arguments:](self->_connection, "sendMessageAsync:arguments:", "vcMediaStreamSetRTPTimeoutInterval", v9);

    }
  }
}

- (double)rtpTimeOutIntervalSec
{
  double result;

  -[AVCMediaStreamConfig rtpTimeOutInterval](-[AVCAudioStream configuration](self, "configuration"), "rtpTimeOutInterval");
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
      v15 = "-[AVCAudioStream setRtcpTimeOutIntervalSec:]";
      v16 = 1024;
      v17 = 617;
      v18 = 2048;
      v19 = a3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d rtcpTimeOutIntervalSec=%f", buf, 0x26u);
    }
  }
  -[AVCMediaStreamConfig rtcpTimeOutInterval](-[AVCAudioStream configuration](self, "configuration"), "rtcpTimeOutInterval");
  if (v7 != a3)
  {
    -[AVCMediaStreamConfig setRtcpTimeOutInterval:](-[AVCAudioStream configuration](self, "configuration"), "setRtcpTimeOutInterval:", a3);
    if (self->_isInProcess)
    {
      -[VCMediaStream setRtcpTimeOutInterval:](self->_opaqueStream, "setRtcpTimeOutInterval:", a3);
    }
    else
    {
      v10 = CFSTR("vcMediaStreamRTCPTimeoutInterval");
      v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
      v8 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v8, CFSTR("vcMediaStreamDictionary"), 0);
      -[AVConferenceXPCClient sendMessageAsync:arguments:](self->_connection, "sendMessageAsync:arguments:", "vcMediaStreamSetRTCPTimeoutInterval", v9);

    }
  }
}

- (double)rtcpTimeOutIntervalSec
{
  double result;

  -[AVCMediaStreamConfig rtcpTimeOutInterval](-[AVCAudioStream configuration](self, "configuration"), "rtcpTimeOutInterval");
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
      v15 = "-[AVCAudioStream setRtcpSendIntervalSec:]";
      v16 = 1024;
      v17 = 643;
      v18 = 2048;
      v19 = a3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d rtcpSendIntervalSec=%f", buf, 0x26u);
    }
  }
  -[AVCMediaStreamConfig rtcpSendInterval](-[AVCAudioStream configuration](self, "configuration"), "rtcpSendInterval");
  if (v7 != a3)
  {
    -[AVCMediaStreamConfig setRtcpSendInterval:](-[AVCAudioStream configuration](self, "configuration"), "setRtcpSendInterval:", a3);
    if (self->_isInProcess)
    {
      -[VCMediaStream setRtcpSendInterval:](self->_opaqueStream, "setRtcpSendInterval:", a3);
    }
    else
    {
      v10 = CFSTR("vcMediaStreamRTCPSendInterval");
      v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
      v8 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v8, CFSTR("vcMediaStreamDictionary"), 0);
      -[AVConferenceXPCClient sendMessageAsync:arguments:](self->_connection, "sendMessageAsync:arguments:", "vcMediaStreamSetRTCPSendInterval", v9);

    }
  }
}

- (double)rtcpSendIntervalSec
{
  double result;

  -[AVCMediaStreamConfig rtcpSendInterval](-[AVCAudioStream configuration](self, "configuration"), "rtcpSendInterval");
  return result;
}

- (float)volume
{
  float result;

  -[AVCAudioStreamConfig volume](-[AVCMediaStreamConfig audio](-[AVCAudioStream configuration](self, "configuration"), "audio"), "volume");
  return result;
}

- (void)setVolume:(float)a3
{
  uint64_t v5;
  NSObject *v6;
  double v7;
  double v8;
  uint64_t v10;
  AVCAudioStreamConfig *v11;
  double v12;
  double v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  double v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v19 = v5;
      v20 = 2080;
      v21 = "-[AVCAudioStream setVolume:]";
      v22 = 1024;
      v23 = 673;
      v24 = 2048;
      v25 = a3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d volume=%f", buf, 0x26u);
    }
  }
  -[AVCAudioStreamConfig volume](-[AVCMediaStreamConfig audio](-[AVCAudioStream configuration](self, "configuration"), "audio"), "volume");
  if (*(float *)&v7 != a3)
  {
    LODWORD(v7) = 0;
    LODWORD(v8) = 1065353216;
    if (a3 < 0.0 || a3 > 1.0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v10 = VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCAudioStream setVolume:].cold.1(v10);
      }
    }
    else
    {
      v11 = -[AVCMediaStreamConfig audio](-[AVCAudioStream configuration](self, "configuration", v7, v8), "audio");
      *(float *)&v12 = a3;
      -[AVCAudioStreamConfig setVolume:](v11, "setVolume:", v12);
      if (self->_isInProcess)
      {
        *(float *)&v13 = a3;
        -[VCAudioStream setVolume:](self->_opaqueStream, "setVolume:", v13);
      }
      else
      {
        v16 = CFSTR("vcMediaStreamVolume");
        *(float *)&v13 = a3;
        v17 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v13);
        v14 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v14, CFSTR("vcMediaStreamDictionary"), 0);
        -[AVConferenceXPCClient sendMessageAsync:arguments:](self->_connection, "sendMessageAsync:arguments:", "vcMediaStreamSetVolume", v15);

      }
    }
  }
}

- (BOOL)isInputFrequencyMeteringEnabled
{
  id v3;
  void *v4;

  if (self->_isInProcess)
    return -[VCAudioStream isFrequencyMeteringEnabled:](self->_opaqueStream, "isFrequencyMeteringEnabled:", 0);
  v3 = -[AVConferenceXPCClient sendMessageSync:arguments:](self->_connection, "sendMessageSync:arguments:", "vcMediaStreamGetInputFrequencyMeteringEnabled", 0);
  if (v3
    && (v4 = (void *)objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamInputFreqMeterEnabled"))) != 0)
  {
    return objc_msgSend(v4, "BOOLValue");
  }
  else
  {
    return 0;
  }
}

- (void)setInputFrequencyMeteringEnabled:(BOOL)a3
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
      v14 = "-[AVCAudioStream setInputFrequencyMeteringEnabled:]";
      v15 = 1024;
      v16 = 716;
      v17 = 1024;
      v18 = v3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d isEnabled=%d", buf, 0x22u);
    }
  }
  if (self->_isInProcess)
  {
    -[VCAudioStream setFrequencyMeteringEnabled:meterType:](self->_opaqueStream, "setFrequencyMeteringEnabled:meterType:", v3, 0);
  }
  else
  {
    v9 = CFSTR("vcMediaStreamInputFreqMeterEnabled");
    v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v7 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v7, CFSTR("vcMediaStreamDictionary"), 0);
    -[AVConferenceXPCClient sendMessageAsync:arguments:](self->_connection, "sendMessageAsync:arguments:", "vcMediaStreamSetInputFrequencyMeteringEnabled", v8);

  }
}

- (BOOL)isOutputFrequencyMeteringEnabled
{
  id v3;
  void *v4;

  if (self->_isInProcess)
    return -[VCAudioStream isFrequencyMeteringEnabled:](self->_opaqueStream, "isFrequencyMeteringEnabled:", 1);
  v3 = -[AVConferenceXPCClient sendMessageSync:arguments:](self->_connection, "sendMessageSync:arguments:", "vcMediaStreamGetOutputFrequencyMeteringEnabled", 0);
  if (v3
    && (v4 = (void *)objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamOutputFreqMeterEnabled"))) != 0)
  {
    return objc_msgSend(v4, "BOOLValue");
  }
  else
  {
    return 0;
  }
}

- (void)setOutputFrequencyMeteringEnabled:(BOOL)a3
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
      v14 = "-[AVCAudioStream setOutputFrequencyMeteringEnabled:]";
      v15 = 1024;
      v16 = 746;
      v17 = 1024;
      v18 = v3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d isEnabled=%d", buf, 0x22u);
    }
  }
  if (self->_isInProcess)
  {
    -[VCAudioStream setFrequencyMeteringEnabled:meterType:](self->_opaqueStream, "setFrequencyMeteringEnabled:meterType:", v3, 1);
  }
  else
  {
    v9 = CFSTR("vcMediaStreamOutputFreqMeterEnabled");
    v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v7 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v7, CFSTR("vcMediaStreamDictionary"), 0);
    -[AVConferenceXPCClient sendMessageAsync:arguments:](self->_connection, "sendMessageAsync:arguments:", "vcMediaStreamSetOutputFrequencyMeteringEnabled", v8);

  }
}

- (AVCMediaStreamConfig)configuration
{
  return self->_configuration;
}

- (void)didInterruptionBeginHandler
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  const void *v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_7_4(&dword_1D8A54000, v0, v1, "AVCAudioStream [%s] %s:%d AVCAudioStream: notified client %p interruption begin", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)didInterruptionEndHandler
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  const void *v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_7_4(&dword_1D8A54000, v0, v1, "AVCAudioStream [%s] %s:%d AVCAudioStream: notified client %p interruption end", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)processDTMFEventWithDigit:(id)a3
{
  uint64_t v4;
  AVCAudioStreamDelegate *v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  AVCAudioStream *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a3, "charValue");
  v5 = -[AVCAudioStream delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCAudioStream-didReceiveDTMFEventWithDigit");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v8 = 136316162;
        v9 = v6;
        v10 = 2080;
        v11 = "-[AVCAudioStream processDTMFEventWithDigit:]";
        v12 = 1024;
        v13 = 785;
        v14 = 2048;
        v15 = self;
        v16 = 1024;
        v17 = v4;
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d @:@ AVCAudioStream-didReceiveDTMFEventWithDigit (%p) dtmfDigit=%c", (uint8_t *)&v8, 0x2Cu);
      }
    }
    -[AVCAudioStreamDelegate stream:didReceiveDTMFEventWithDigit:](v5, "stream:didReceiveDTMFEventWithDigit:", self, v4);
  }
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
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[6];

  v19[5] = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
  v4 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke;
  v19[3] = &unk_1E9E52730;
  v19[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcMediaStreamDidServerDie", v19, self->_callbackQueue);
  v18[0] = v4;
  v18[1] = 3221225472;
  v18[2] = __56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke_159;
  v18[3] = &unk_1E9E52730;
  v18[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcMediaStreamDidStartConnection", v18, self->_callbackQueue);
  v17[0] = v4;
  v17[1] = 3221225472;
  v17[2] = __56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke_173;
  v17[3] = &unk_1E9E52730;
  v17[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcMediaStreamDidStopConnection", v17, self->_callbackQueue);
  v16[0] = v4;
  v16[1] = 3221225472;
  v16[2] = __56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke_175;
  v16[3] = &unk_1E9E52730;
  v16[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcMediaStreamDidPause", v16, self->_callbackQueue);
  v15[0] = v4;
  v15[1] = 3221225472;
  v15[2] = __56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke_181;
  v15[3] = &unk_1E9E52730;
  v15[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcMediaStreamDidResume", v15, self->_callbackQueue);
  v14[0] = v4;
  v14[1] = 3221225472;
  v14[2] = __56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke_187;
  v14[3] = &unk_1E9E52730;
  v14[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcMediaStreamDidStartSynchronization", v14, self->_callbackQueue);
  v13[0] = v4;
  v13[1] = 3221225472;
  v13[2] = __56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke_193;
  v13[3] = &unk_1E9E52730;
  v13[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcMediaStreamRTPPacketTimeout", v13, self->_callbackQueue);
  v12[0] = v4;
  v12[1] = 3221225472;
  v12[2] = __56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke_195;
  v12[3] = &unk_1E9E52730;
  v12[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcMediaStreamRTCPPacketTimeout", v12, self->_callbackQueue);
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke_197;
  v11[3] = &unk_1E9E52730;
  v11[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcMediaStreamDidRecoverFromRTCPTimeout", v11, self->_callbackQueue);
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke_201;
  v10[3] = &unk_1E9E52730;
  v10[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcMediaStreamRTCPPacketsReceived", v10, self->_callbackQueue);
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke_205;
  v9[3] = &unk_1E9E52730;
  v9[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcMediaStreamUpdateInputFrequencyMetering", v9, self->_callbackQueue);
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke_209;
  v8[3] = &unk_1E9E52730;
  v8[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcMediaStreamUpdateOutputFrequencyMetering", v8, self->_callbackQueue);
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke_213;
  v7[3] = &unk_1E9E52730;
  v7[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcMediaStreamDidInterruptionBegin", v7, self->_callbackQueue);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke_2;
  v6[3] = &unk_1E9E52730;
  v6[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcMediaStreamDidInterruptionEnd", v6, self->_callbackQueue);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke_3;
  v5[3] = &unk_1E9E52730;
  v5[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcMediaStreamDTMFDigitReceived", v5, self->_callbackQueue);
}

void __56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke(uint64_t a1, void *a2)
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
          __56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke_cold_2();
      }
    }
    else if (ErrorLogLevelForModule >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke_cold_1();
    }
    objc_msgSend(v4, "delegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCAudioStream-didServerDie");
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v11 = 136315906;
          v12 = v9;
          v13 = 2080;
          v14 = "-[AVCAudioStream registerBlocksForDelegateNotifications]_block_invoke";
          v15 = 1024;
          v16 = 808;
          v17 = 2048;
          v18 = v4;
          _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d @:@ AVCAudioStream-didServerDie (%p)", (uint8_t *)&v11, 0x26u);
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
      v14 = "-[AVCAudioStream registerBlocksForDelegateNotifications]_block_invoke";
      v15 = 1024;
      v16 = 812;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d AVCAudioStream: Server died, but AVCAudioStream has already deallocated, NO-OP", (uint8_t *)&v11, 0x1Cu);
    }
  }
}

void __56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke_159(uint64_t a1, void *a2, void *a3)
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
      v32 = "-[AVCAudioStream registerBlocksForDelegateNotifications]_block_invoke";
      v33 = 1024;
      v34 = 819;
      v35 = 2048;
      v36 = a3;
      v37 = 2080;
      v38[0] = v8;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d didStartConnectionBlock: error = %p, result = %s", (uint8_t *)&v29, 0x30u);
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
          v32 = "-[AVCAudioStream registerBlocksForDelegateNotifications]_block_invoke";
          v33 = 1024;
          v34 = 830;
          v35 = 1024;
          LODWORD(v36) = v16;
          _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d AVCAudioStream: didStartConnectionBlock strongSelf started(%d)", (uint8_t *)&v29, 0x22u);
        }
      }
      v17 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcMediaStreamError"));
      if (v17)
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("ERROR_DOMAIN")), (int)objc_msgSend((id)objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("ERROR_CODE")), "intValue"), objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("ERROR_USERINFO")));
      objc_msgSend(v10, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCAudioStream-didStart");
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
            v32 = "-[AVCAudioStream registerBlocksForDelegateNotifications]_block_invoke";
            v33 = 1024;
            v34 = 842;
            v35 = 2048;
            v36 = v10;
            v37 = 1024;
            LODWORD(v38[0]) = v20;
            WORD2(v38[0]) = 2112;
            *(_QWORD *)((char *)v38 + 6) = v17;
            _os_log_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d @:@ AVCAudioStream-didStart (%p) didSucceed=%d, error=%@", (uint8_t *)&v29, 0x36u);
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
      v32 = "-[AVCAudioStream registerBlocksForDelegateNotifications]_block_invoke";
      v33 = 1024;
      v34 = 847;
      v35 = 2048;
      v36 = v10;
      v37 = 1024;
      LODWORD(v38[0]) = v23;
      v24 = "AVCAudioStream [%s] %s:%d AVCAudioStream: notified client %p of didStart started[%d]";
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
      v32 = "-[AVCAudioStream registerBlocksForDelegateNotifications]_block_invoke";
      v33 = 1024;
      v34 = 824;
      v24 = "AVCAudioStream [%s] %s:%d AVCAudioStream: didStartConnectionBlock: strongSelf == nil";
      v25 = v28;
      v26 = 28;
    }
    _os_log_impl(&dword_1D8A54000, v25, OS_LOG_TYPE_DEFAULT, v24, (uint8_t *)&v29, v26);
  }
}

void __56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke_173(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
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
    v4 = objc_msgSend(*(id *)(a1 + 32), "strong");
    if (v4)
    {
      v5 = (void *)v4;
      MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCAudioStream-didStop");
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
          v15 = "-[AVCAudioStream registerBlocksForDelegateNotifications]_block_invoke";
          v16 = 1024;
          v17 = 859;
          v18 = 2048;
          v19 = v5;
          _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d @:@ AVCAudioStream-didStop (%p)", (uint8_t *)&v12, 0x26u);
        }
      }
      objc_msgSend((id)objc_msgSend(v5, "delegate"), "streamDidStop:", v5);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v10 = VRTraceErrorLogLevelToCSTR();
        v11 = *v7;
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
        {
          v12 = 136315906;
          v13 = v10;
          v14 = 2080;
          v15 = "-[AVCAudioStream registerBlocksForDelegateNotifications]_block_invoke";
          v16 = 1024;
          v17 = 862;
          v18 = 2048;
          v19 = v5;
          _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d AVCAudioStream: notified client %p of didStop", (uint8_t *)&v12, 0x26u);
        }
      }
    }
  }
}

void __56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke_175(uint64_t a1, void *a2, uint64_t a3)
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
        MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCAudioStream-didPause");
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          v9 = VRTraceErrorLogLevelToCSTR();
          v10 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v14 = 136316418;
            v15 = v9;
            v16 = 2080;
            v17 = "-[AVCAudioStream registerBlocksForDelegateNotifications]_block_invoke";
            v18 = 1024;
            v19 = 887;
            v20 = 2048;
            v21 = v6;
            v22 = 1024;
            v23 = objc_msgSend(v7, "intValue");
            v24 = 2112;
            v25 = v8;
            _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d @:@ AVCAudioStream-didPause (%p) didSucceed=%d, error=%@", (uint8_t *)&v14, 0x36u);
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
          v17 = "-[AVCAudioStream registerBlocksForDelegateNotifications]_block_invoke";
          v18 = 1024;
          v19 = 892;
          v20 = 2048;
          v21 = v6;
          v22 = 1024;
          v23 = v13;
          _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d AVCAudioStream: notified client %p of didPause [%d]", (uint8_t *)&v14, 0x2Cu);
        }
      }
    }
  }
}

void __56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke_181(uint64_t a1, void *a2, uint64_t a3)
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
        MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCAudioStream-didResume");
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          v9 = VRTraceErrorLogLevelToCSTR();
          v10 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v14 = 136316418;
            v15 = v9;
            v16 = 2080;
            v17 = "-[AVCAudioStream registerBlocksForDelegateNotifications]_block_invoke";
            v18 = 1024;
            v19 = 917;
            v20 = 2048;
            v21 = v6;
            v22 = 1024;
            v23 = objc_msgSend(v7, "intValue");
            v24 = 2112;
            v25 = v8;
            _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d @:@ AVCAudioStream-didResume (%p) didSucceed=%d, error=%@", (uint8_t *)&v14, 0x36u);
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
          v17 = "-[AVCAudioStream registerBlocksForDelegateNotifications]_block_invoke";
          v18 = 1024;
          v19 = 922;
          v20 = 2048;
          v21 = v6;
          v22 = 1024;
          v23 = v13;
          _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d AVCAudioStream: notified client %p of didResume [%d]", (uint8_t *)&v14, 0x2Cu);
        }
      }
    }
  }
}

void __56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke_187(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
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
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!a3 && !objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "strong");
    if (v5)
    {
      v6 = (void *)v5;
      v7 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcMediaStreamSynchronizationStarted"));
      v8 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcMediaStreamError"));
      if (v8)
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ERROR_DOMAIN")), (int)objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ERROR_CODE")), "intValue"), objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ERROR_USERINFO")));
      objc_msgSend(v6, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend((id)objc_msgSend(v6, "delegate"), "stream:didStartSynchronizer:error:", v6, objc_msgSend(v7, "BOOLValue"), v8);

      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v11 = 136316162;
          v12 = v9;
          v13 = 2080;
          v14 = "-[AVCAudioStream registerBlocksForDelegateNotifications]_block_invoke";
          v15 = 1024;
          v16 = 952;
          v17 = 2048;
          v18 = v6;
          v19 = 1024;
          v20 = objc_msgSend(v7, "BOOLValue");
          _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d AVCAudioStream: notified client %p of didStartSynchronizer [%d]", (uint8_t *)&v11, 0x2Cu);
        }
      }
    }
  }
}

void __56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke_193(uint64_t a1, void *a2, uint64_t a3)
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
      objc_msgSend((id)objc_msgSend(v4, "delegate"), "streamDidRTPTimeOut:", v4);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v6 = VRTraceErrorLogLevelToCSTR();
        v7 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v8 = 136315906;
          v9 = v6;
          v10 = 2080;
          v11 = "-[AVCAudioStream registerBlocksForDelegateNotifications]_block_invoke";
          v12 = 1024;
          v13 = 967;
          v14 = 2048;
          v15 = v5;
          _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d AVCAudioStream: notified client %p RTP packet timeout", (uint8_t *)&v8, 0x26u);
        }
      }
    }
  }
}

void __56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke_195(uint64_t a1, void *a2, uint64_t a3)
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
      objc_msgSend((id)objc_msgSend(v4, "delegate"), "streamDidRTCPTimeOut:", v4);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v6 = VRTraceErrorLogLevelToCSTR();
        v7 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v8 = 136315906;
          v9 = v6;
          v10 = 2080;
          v11 = "-[AVCAudioStream registerBlocksForDelegateNotifications]_block_invoke";
          v12 = 1024;
          v13 = 982;
          v14 = 2048;
          v15 = v5;
          _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d AVCAudioStream: notified client %p RTCP packet timeout", (uint8_t *)&v8, 0x26u);
        }
      }
    }
  }
}

void __56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke_197(uint64_t a1, void *a2, uint64_t a3)
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
          v11 = "-[AVCAudioStream registerBlocksForDelegateNotifications]_block_invoke";
          v12 = 1024;
          v13 = 998;
          v14 = 2048;
          v15 = v5;
          _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d AVCAudioStream: notified client=%p RTCP packet timeout", (uint8_t *)&v8, 0x26u);
        }
      }
    }
  }
}

void __56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke_201(uint64_t a1, void *a2, uint64_t a3)
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
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v9 = 136315906;
          v10 = v7;
          v11 = 2080;
          v12 = "-[AVCAudioStream registerBlocksForDelegateNotifications]_block_invoke";
          v13 = 1024;
          v14 = 1013;
          v15 = 2048;
          v16 = v6;
          _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d AVCAudioStream: notified client %p received RTCP packets", (uint8_t *)&v9, 0x26u);
        }
      }
    }
  }
}

void __56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke_205(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!a3 && !objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
    if (v5)
    {
      v6 = v5;
      objc_msgSend(v5, "vcMediaStream:updateInputFrequencyLevel:", 0, objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcMediaStreamInputFreqMetering")));
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x1E0CF2758];
        v9 = *MEMORY[0x1E0CF2758];
        if (*MEMORY[0x1E0CF2748])
        {
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            v10 = 136315906;
            v11 = v7;
            v12 = 2080;
            v13 = "-[AVCAudioStream registerBlocksForDelegateNotifications]_block_invoke";
            v14 = 1024;
            v15 = 1030;
            v16 = 2048;
            v17 = v6;
            _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d AVCAudioStream: notified client %p received input frequency metering packets", (uint8_t *)&v10, 0x26u);
          }
        }
        else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          __56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke_205_cold_1();
        }
      }
    }
  }
}

void __56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke_209(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!a3 && !objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
    if (v5)
    {
      v6 = v5;
      objc_msgSend(v5, "vcMediaStream:updateOutputFrequencyLevel:", 0, objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcMediaStreamOutputFreqMetering")));
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x1E0CF2758];
        v9 = *MEMORY[0x1E0CF2758];
        if (*MEMORY[0x1E0CF2748])
        {
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            v10 = 136315906;
            v11 = v7;
            v12 = 2080;
            v13 = "-[AVCAudioStream registerBlocksForDelegateNotifications]_block_invoke";
            v14 = 1024;
            v15 = 1047;
            v16 = 2048;
            v17 = v6;
            _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d AVCAudioStream: notified client %p received input frequency metering packets", (uint8_t *)&v10, 0x26u);
          }
        }
        else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          __56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke_209_cold_1();
        }
      }
    }
  }
}

id *__56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke_213(id *result, void *a2, uint64_t a3)
{
  id *v3;

  if (!a3)
  {
    v3 = result;
    result = (id *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED"));
    if (!result)
    {
      result = (id *)objc_msgSend(v3[4], "strong");
      if (result)
        return (id *)objc_msgSend(result, "didInterruptionBeginHandler");
    }
  }
  return result;
}

id *__56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke_2(id *result, void *a2, uint64_t a3)
{
  id *v3;

  if (!a3)
  {
    v3 = result;
    result = (id *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED"));
    if (!result)
    {
      result = (id *)objc_msgSend(v3[4], "strong");
      if (result)
        return (id *)objc_msgSend(result, "didInterruptionEndHandler");
    }
  }
  return result;
}

void __56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
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
      v12 = 136316162;
      v13 = v6;
      v14 = 2080;
      v15 = "-[AVCAudioStream registerBlocksForDelegateNotifications]_block_invoke_3";
      v16 = 1024;
      v17 = 1075;
      v18 = 2048;
      v19 = a3;
      v20 = 2080;
      v21 = v8;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d didReceiveDTMFEventWithDigitBlock: error=%p, result=%s", (uint8_t *)&v12, 0x30u);
    }
  }
  if (!a3 && !objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    v9 = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
    if (v9)
    {
      objc_msgSend(v9, "processDTMFEventWithDigit:", objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcMediaStreamDTMFDigitReceived")));
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v12 = 136315650;
        v13 = v10;
        v14 = 2080;
        v15 = "-[AVCAudioStream registerBlocksForDelegateNotifications]_block_invoke";
        v16 = 1024;
        v17 = 1080;
        _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d AVCAudioStream: didReceiveDTMFEventWithDigit: strongSelf == nil", (uint8_t *)&v12, 0x1Cu);
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
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcMediaStreamUpdateInputFrequencyMetering");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcMediaStreamUpdateOutputFrequencyMetering");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcMediaStreamDidInterruptionBegin");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcMediaStreamDidInterruptionEnd");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcMediaStreamDTMFDigitReceived");
}

- (BOOL)setupAudioStreamInProcessWithClientArgs:(id)a3 networkSockets:(id)a4 error:(id *)a5
{
  VCAudioStream *v9;
  VCAudioStream *v10;
  id v11;
  BOOL v12;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v9 = [VCAudioStream alloc];
  v10 = -[VCAudioStream initWithClientPid:](v9, "initWithClientPid:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "processIdentifier"));
  self->_opaqueStream = v10;
  if (!v10)
  {
    v12 = 0;
    if (!a5)
      return v12;
    goto LABEL_5;
  }
  -[VCMediaStream setDelegate:](v10, "setDelegate:", self);
  -[VCMediaStream setDelegateFunctions:](self->_opaqueStream, "setDelegateFunctions:", _AVCAudioStream_UpdateFrequencyLevel);
  v11 = -[VCAudioStream setLocalParticipantInfo:networkSockets:withError:](self->_opaqueStream, "setLocalParticipantInfo:networkSockets:withError:", a3, a4, a5);
  v12 = v11 != 0;
  if (v11)
    -[AVCAudioStream setCapabilities:](self, "setCapabilities:", v11);
  self->_streamToken = -[VCMediaStream streamToken](self->_opaqueStream, "streamToken");
  if (a5)
  {
LABEL_5:
    if (!v12 && !*a5)
    {
      v14 = *MEMORY[0x1E0CB2D68];
      v15[0] = CFSTR("Failed to create VCAudioStream");
      *a5 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AVCAudioStream"), -2, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1));
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCAudioStream setupAudioStreamInProcessWithClientArgs:networkSockets:error:].cold.1();
      }
    }
  }
  return v12;
}

- (BOOL)configureInProcess:(id)a3 error:(id *)a4
{
  VCAudioStreamConfig *v7;
  VCAudioStreamConfig *v8;
  VCAudioStream *opaqueStream;
  uint64_t v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v7 = -[VCAudioStreamConfig initWithClientDictionary:]([VCAudioStreamConfig alloc], "initWithClientDictionary:", objc_msgSend(a3, "dictionary"));
  v8 = v7;
  if (v7
    && (opaqueStream = self->_opaqueStream,
        v13[0] = v7,
        -[VCMediaStream setStreamConfig:withError:](opaqueStream, "setStreamConfig:withError:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1), a4)))
  {
    -[AVCAudioStream setConfiguration:](self, "setConfiguration:", a3);
    LOBYTE(a4) = 1;
  }
  else if (a4)
  {
    if (!*a4)
    {
      v11 = *MEMORY[0x1E0CB2D68];
      v12 = CFSTR("Failed to create VCAudioStreamConfig from config dictionary.");
      *a4 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AVCAudioStream"), -1, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCAudioStream configureInProcess:error:].cold.1();
      }
    }
    LOBYTE(a4) = 0;
  }

  return (char)a4;
}

- (BOOL)setupAudioStreamOutOfProcessWithClientArgs:(id)a3 networkSockets:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  id v11;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  self->_connection = objc_alloc_init(AVConferenceXPCClient);
  v13 = CFSTR("vcMediaStreamDictionary");
  v14[0] = a3;
  v9 = -[AVConferenceXPCClient sendMessageSync:arguments:xpcArguments:](self->_connection, "sendMessageSync:arguments:xpcArguments:", "vcMediaStreamInitializeAudio", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1), a4);
  -[AVCAudioStream registerBlocksForDelegateNotifications](self, "registerBlocksForDelegateNotifications");
  v10 = -[AVCAudioStream validateInitializeConnectionResult:](self, "validateInitializeConnectionResult:", v9);
  v11 = v10;
  if (v10)
  {
    if (a5)
      *a5 = v10;
  }
  else
  {
    -[AVCAudioStream setCapabilities:](self, "setCapabilities:", objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("vcMediaStreamStreamCapabilities")));
    self->_streamToken = objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("vcMediaStreamToken")), "integerValue");
    self->_uplinkToken = objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("vcMediaStreamTokenUplink")), "integerValue");
    self->_downlinkToken = objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("vcMediaStreamTokenDownlink")), "integerValue");
  }
  return v11 == 0;
}

- (BOOL)configureOutOfProcess:(id)a3 error:(id *)a4
{
  BOOL v7;
  id v8;
  id v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v12 = CFSTR("vcMediaStreamDictionary");
  v13[0] = objc_msgSend(a3, "dictionary");
  v7 = 1;
  v8 = -[AVConferenceXPCClient sendMessageSync:arguments:](self->_connection, "sendMessageSync:arguments:", "vcMediaStreamSetSessionConfig", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1));
  if (v8)
  {
    v9 = (id)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ERROR"));
    if (v9)
    {
      v10 = v9;
      -[AVCAudioStream setConfiguration:](self, "setConfiguration:", 0);
      v7 = 0;
      if (a4)
        *a4 = v10;
    }
    else
    {
      -[AVCAudioStream setConfiguration:](self, "setConfiguration:", a3);
      return 1;
    }
  }
  return v7;
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
  -[AVCAudioStream delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v11 = 136316418;
        v12 = v9;
        v13 = 2080;
        v14 = "-[AVCAudioStream vcMediaStream:didStartStream:error:]";
        v15 = 1024;
        v16 = 1208;
        v17 = 2112;
        v18 = a3;
        v19 = 1024;
        v20 = v6;
        v21 = 2112;
        v22 = a5;
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d stream=%@, didStartStream=%d, error=%@", (uint8_t *)&v11, 0x36u);
      }
    }
    -[AVCAudioStreamDelegate stream:didStart:error:](-[AVCAudioStream delegate](self, "delegate"), "stream:didStart:error:", self, v6, a5);
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
      v10 = "-[AVCAudioStream vcMediaStreamDidStop:]";
      v11 = 1024;
      v12 = 1214;
      v13 = 2112;
      v14 = a3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d stream=%@", (uint8_t *)&v7, 0x26u);
    }
  }
  -[AVCAudioStream delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[AVCAudioStreamDelegate streamDidStop:](-[AVCAudioStream delegate](self, "delegate"), "streamDidStop:", self);
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
      v14 = "-[AVCAudioStream vcMediaStream:didPauseStream:error:]";
      v15 = 1024;
      v16 = 1221;
      v17 = 2112;
      v18 = a3;
      v19 = 1024;
      v20 = v6;
      v21 = 2112;
      v22 = a5;
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d stream=%@, didPauseStream=%d, error=%@", (uint8_t *)&v11, 0x36u);
    }
  }
  -[AVCAudioStream delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[AVCAudioStreamDelegate stream:didPause:error:](-[AVCAudioStream delegate](self, "delegate"), "stream:didPause:error:", self, v6, a5);
}

- (void)vcMediaStream:(id)a3 didResumeStream:(BOOL)a4 error:(id)a5
{
  _BOOL8 v6;

  v6 = a4;
  -[AVCAudioStream delegate](self, "delegate", a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[AVCAudioStreamDelegate stream:didResume:error:](-[AVCAudioStream delegate](self, "delegate"), "stream:didResume:error:", self, v6, a5);
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
      v10 = "-[AVCAudioStream vcMediaStreamDidRTPTimeOut:]";
      v11 = 1024;
      v12 = 1234;
      v13 = 2112;
      v14 = a3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d stream=%@", (uint8_t *)&v7, 0x26u);
    }
  }
  -[AVCAudioStream delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[AVCAudioStreamDelegate streamDidRTPTimeOut:](-[AVCAudioStream delegate](self, "delegate"), "streamDidRTPTimeOut:", self);
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
      v10 = "-[AVCAudioStream vcMediaStreamDidRTCPTimeOut:]";
      v11 = 1024;
      v12 = 1241;
      v13 = 2112;
      v14 = a3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d stream=%@", (uint8_t *)&v7, 0x26u);
    }
  }
  -[AVCAudioStream delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[AVCAudioStreamDelegate streamDidRTCPTimeOut:](-[AVCAudioStream delegate](self, "delegate"), "streamDidRTCPTimeOut:", self);
}

- (void)vcMediaStream:(id)a3 didReceiveDTMFEventWithDigit:(char)a4
{
  uint64_t v4;
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
  int v18;
  uint64_t v19;

  v4 = a4;
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
      v12 = "-[AVCAudioStream vcMediaStream:didReceiveDTMFEventWithDigit:]";
      v13 = 1024;
      v14 = 1248;
      v15 = 2112;
      v16 = a3;
      v17 = 1024;
      v18 = v4;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d stream=%@, digit=%c", (uint8_t *)&v9, 0x2Cu);
    }
  }
  -[AVCAudioStream delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[AVCAudioStreamDelegate stream:didReceiveDTMFEventWithDigit:](-[AVCAudioStream delegate](self, "delegate"), "stream:didReceiveDTMFEventWithDigit:", self, v4);
}

- (void)vcMediaStream:(id)a3 didReceiveRTCPPackets:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  const char *v12;
  const char *v13;
  char *v14;
  os_log_t *v15;
  uint64_t v16;
  NSObject *v17;
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
  _BYTE v31[128];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v7 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v32, v31, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v33 != v9)
          objc_enumerationMutation(a4);
        v11 = +[AVCRTCPPacket newPacketWithRTCPPacket:packetLength:](AVCRTCPPacket, "newPacketWithRTCPPacket:packetLength:", objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "bytes"), objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "length"));
        if (v11)
          objc_msgSend(v6, "addObject:", v11);

      }
      v8 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v32, v31, 16);
    }
    while (v8);
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    __str = 0;
    if (a3)
    {
      v12 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
      if (a4)
      {
LABEL_13:
        v13 = (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
        goto LABEL_16;
      }
    }
    else
    {
      v12 = "<nil>";
      if (a4)
        goto LABEL_13;
    }
    v13 = "<nil>";
LABEL_16:
    asprintf(&__str, "stream=%s, rtcpPackets=%s", v12, v13);
    if (__str)
    {
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
            v24 = "-[AVCAudioStream vcMediaStream:didReceiveRTCPPackets:]";
            v25 = 1024;
            v26 = 1267;
            v27 = 2080;
            v28 = "";
            v29 = 2080;
            v30 = v14;
            _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d %s %s", buf, 0x30u);
          }
        }
        v14 = strtok_r(0, "\n", &__lasts);
      }
      while (v14);
      free(__str);
    }
  }
  -[AVCAudioStream delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[AVCAudioStreamDelegate stream:didReceiveRTCPPackets:](-[AVCAudioStream delegate](self, "delegate"), "stream:didReceiveRTCPPackets:", self, v6);

}

- (void)vcMediaStream:(id)a3 updateInputFrequencyLevel:(id)a4
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
      v12 = "-[AVCAudioStream vcMediaStream:updateInputFrequencyLevel:]";
      v13 = 1024;
      v14 = 1276;
      v15 = 2112;
      v16 = a3;
      v17 = 2112;
      v18 = a4;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d stream=%@, inputFreq=%@", (uint8_t *)&v9, 0x30u);
    }
  }
  -[AVCAudioStream delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[AVCAudioStreamDelegate stream:updateInputFrequencyLevel:](-[AVCAudioStream delegate](self, "delegate"), "stream:updateInputFrequencyLevel:", self, a4);
}

- (void)vcMediaStream:(id)a3 updateOutputFrequencyLevel:(id)a4
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
      v12 = "-[AVCAudioStream vcMediaStream:updateOutputFrequencyLevel:]";
      v13 = 1024;
      v14 = 1283;
      v15 = 2112;
      v16 = a3;
      v17 = 2112;
      v18 = a4;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d stream=%@, outputFreq=%@", (uint8_t *)&v9, 0x30u);
    }
  }
  -[AVCAudioStream delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[AVCAudioStreamDelegate stream:updateOutputFrequencyLevel:](-[AVCAudioStream delegate](self, "delegate"), "stream:updateOutputFrequencyLevel:", self, a4);
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
      v10 = "-[AVCAudioStream vcMediaStreamServerDidDie:]";
      v11 = 1024;
      v12 = 1303;
      v13 = 2112;
      v14 = a3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVCAudioStream [%s] %s:%d stream=%@, serverDidDie", (uint8_t *)&v7, 0x26u);
    }
  }
  -[AVCAudioStream stop](self, "stop");
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (NSDictionary)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (int64_t)streamToken
{
  return self->_streamToken;
}

- (int64_t)uplinkToken
{
  return self->_uplinkToken;
}

- (int64_t)downlinkToken
{
  return self->_downlinkToken;
}

- (void)initWithLocalAddress:networkSockets:IDSDestination:rtpConnectionClientID:rtcpConnectionClientID:callID:options:error:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVCAudioStream [%s] %s:%d AVCVideoStream: clientSessionID in the options is not of NSUUIDtype", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
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
  OUTLINED_FUNCTION_15_8();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVCAudioStream [%s] %s:%d Missing result dictionary", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_15_8();
  OUTLINED_FUNCTION_11_3(&dword_1D8A54000, v0, v1, "AVCAudioStream [%s] %s:%d Missing result dictionary", v2, v3, v4, v5, v6);
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
  v2 = "-[AVCAudioStream validateInitializeConnectionResult:]";
  v3 = 1024;
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v0, (uint64_t)v0, "AVCAudioStream [%s] %s:%d Missing capabilities dictionary: result=%@", v1);
  OUTLINED_FUNCTION_3();
}

- (void)validateInitializeConnectionResult:.cold.4()
{
  NSObject *v0;
  uint8_t v1[14];
  const char *v2;
  __int16 v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v2 = "-[AVCAudioStream validateInitializeConnectionResult:]";
  v3 = 1024;
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_14_1(&dword_1D8A54000, v0, (uint64_t)v0, "AVCAudioStream [%s] %s:%d Missing capabilities dictionary: result=%@", v1);
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
  OUTLINED_FUNCTION_17_2();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVCAudioStream [%s] %s:%d Missing stream token", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_17_2();
  OUTLINED_FUNCTION_11_3(&dword_1D8A54000, v0, v1, "AVCAudioStream [%s] %s:%d Missing stream token", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)validateInitializeConnectionResult:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVCAudioStream [%s] %s:%d Missing stream token for the uplink", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)validateInitializeConnectionResult:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_11_3(&dword_1D8A54000, v0, v1, "AVCAudioStream [%s] %s:%d Missing stream token for the uplink", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)validateInitializeConnectionResult:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_16_5();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVCAudioStream [%s] %s:%d Missing stream token for the downlink", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)validateInitializeConnectionResult:.cold.10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_16_5();
  OUTLINED_FUNCTION_11_3(&dword_1D8A54000, v0, v1, "AVCAudioStream [%s] %s:%d Missing stream token for the downlink", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)validateInitializeConnectionResult:.cold.11()
{
  NSObject *v0;
  uint8_t v1[14];
  const char *v2;
  __int16 v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v2 = "-[AVCAudioStream validateInitializeConnectionResult:]";
  v3 = 1024;
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v0, (uint64_t)v0, "AVCAudioStream [%s] %s:%d IPC Timeout: result=%@", v1);
  OUTLINED_FUNCTION_3();
}

- (void)validateInitializeConnectionResult:.cold.12()
{
  NSObject *v0;
  uint8_t v1[14];
  const char *v2;
  __int16 v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v2 = "-[AVCAudioStream validateInitializeConnectionResult:]";
  v3 = 1024;
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_14_1(&dword_1D8A54000, v0, (uint64_t)v0, "AVCAudioStream [%s] %s:%d IPC Timeout: result=%@", v1);
  OUTLINED_FUNCTION_3();
}

- (void)validateInitializeConnectionResult:(NSObject *)a3 .cold.13(uint64_t a1, void *a2, NSObject *a3)
{
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("ERROR"));
  v5 = 136316162;
  v6 = a1;
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_9_9();
  _os_log_error_impl(&dword_1D8A54000, a3, OS_LOG_TYPE_ERROR, "AVCAudioStream [%s] %s:%d error=%@, result=%@", (uint8_t *)&v5, 0x30u);
  OUTLINED_FUNCTION_9_1();
}

- (void)validateInitializeConnectionResult:(NSObject *)a3 .cold.14(uint64_t a1, void *a2, NSObject *a3)
{
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("ERROR"));
  v5 = 136316162;
  v6 = a1;
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_9_9();
  _os_log_fault_impl(&dword_1D8A54000, a3, OS_LOG_TYPE_FAULT, "AVCAudioStream [%s] %s:%d error=%@, result=%@", (uint8_t *)&v5, 0x30u);
  OUTLINED_FUNCTION_9_1();
}

- (void)validateInitializeConnectionResult:.cold.15()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_18_4();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVCAudioStream [%s] %s:%d Server died", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)validateInitializeConnectionResult:.cold.16()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_18_4();
  OUTLINED_FUNCTION_11_3(&dword_1D8A54000, v0, v1, "AVCAudioStream [%s] %s:%d Server died", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)configure:(NSObject *)a3 error:.cold.1(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (*a2)
    objc_msgSend((id)objc_msgSend(*a2, "description"), "UTF8String");
  v6 = 136315906;
  v7 = a1;
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_12_9();
  OUTLINED_FUNCTION_11(&dword_1D8A54000, a3, v5, "AVCAudioStream [%s] %s:%d Invalid audio configuration: error[%s]", (uint8_t *)&v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)configure:(NSObject *)a3 error:.cold.2(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (*a2)
    objc_msgSend((id)objc_msgSend(*a2, "description"), "UTF8String");
  v6 = 136315906;
  v7 = a1;
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_12_9();
  OUTLINED_FUNCTION_14_1(&dword_1D8A54000, a3, v5, "AVCAudioStream [%s] %s:%d Invalid audio configuration: error[%s]", (uint8_t *)&v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)setVolume:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  int v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = 136315906;
  v5 = a1;
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_4_0();
  v6 = 680;
  v7 = 2048;
  v8 = v1;
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v2, v3, "AVCAudioStream [%s] %s:%d Volume out of range:%f expected [0.0 - 1.0]", (uint8_t *)&v4);
  OUTLINED_FUNCTION_3();
}

void __56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVCAudioStream [%s] %s:%d AVCAudioStream: Media server died, notifying client", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke_cold_2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVCAudioStream [%s] %s:%d AVCAudioStream: AVC server died, notifying client", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke_205_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  const void *v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_7_4(&dword_1D8A54000, v0, v1, "AVCAudioStream [%s] %s:%d AVCAudioStream: notified client %p received input frequency metering packets", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __56__AVCAudioStream_registerBlocksForDelegateNotifications__block_invoke_209_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  const void *v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_7_4(&dword_1D8A54000, v0, v1, "AVCAudioStream [%s] %s:%d AVCAudioStream: notified client %p received input frequency metering packets", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)setupAudioStreamInProcessWithClientArgs:networkSockets:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  int v3;
  __int16 v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  v3 = 1128;
  v4 = 2112;
  v5 = CFSTR("Failed to create VCAudioStream");
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v0, v1, "AVCAudioStream [%s] %s:%d error=%@", v2);
  OUTLINED_FUNCTION_3();
}

- (void)configureInProcess:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  int v3;
  __int16 v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  v3 = 1145;
  v4 = 2112;
  v5 = CFSTR("Failed to create VCAudioStreamConfig from config dictionary.");
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v0, v1, "AVCAudioStream [%s] %s:%d error=%@", v2);
  OUTLINED_FUNCTION_3();
}

@end
