@implementation AVCVirtualTTYDevice

- (AVCVirtualTTYDevice)initWithStreamToken:(int64_t)a3 error:(id *)a4
{
  return -[AVCVirtualTTYDevice initWithMode:error:streamToken:](self, "initWithMode:error:streamToken:", 3, a4, a3);
}

- (AVCVirtualTTYDevice)initWithMode:(int64_t)a3 error:(id *)a4
{
  return -[AVCVirtualTTYDevice initWithMode:error:streamToken:](self, "initWithMode:error:streamToken:", a3, a4, 0);
}

- (AVCVirtualTTYDevice)initWithMode:(int64_t)a3 error:(id *)a4 streamToken:(int64_t)a5
{
  uint64_t v9;
  NSObject *v10;
  const __CFString *v11;
  AVCVirtualTTYDevice *v12;
  id v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  id v17;
  id v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  const __CFString *v23;
  const char *v25;
  uint64_t v26;
  objc_super v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  _BYTE v35[10];
  _BYTE v36[10];
  __int16 v37;
  const __CFString *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      if (a4)
        v11 = (const __CFString *)*a4;
      else
        v11 = CFSTR("nil");
      *(_DWORD *)buf = 136316418;
      v29 = v9;
      v30 = 2080;
      v31 = "-[AVCVirtualTTYDevice initWithMode:error:streamToken:]";
      v32 = 1024;
      v33 = 47;
      v34 = 1024;
      *(_DWORD *)v35 = a3;
      *(_WORD *)&v35[4] = 1024;
      *(_DWORD *)&v35[6] = a5;
      *(_WORD *)v36 = 2112;
      *(_QWORD *)&v36[2] = v11;
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, "AVCVirtualTTYDevice [%s] %s:%d mode=%d, streamToken=%u error=%@", buf, 0x32u);
    }
  }
  v27.receiver = self;
  v27.super_class = (Class)AVCVirtualTTYDevice;
  v12 = -[AVCVirtualTTYDevice init](&v27, sel_init);
  if (v12)
  {
    VRTraceReset();
    VRTracePrintLoggingInfo();
    v12->_connection = objc_alloc_init(AVConferenceXPCClient);
    v13 = objc_alloc(MEMORY[0x1E0C99D80]);
    v14 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v15 = (void *)objc_msgSend(v13, "initWithObjectsAndKeys:", v14, CFSTR("vcMediaStreamDictionary"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5), CFSTR("vcMediaStreamToken"), 0);
    if (a3 == 3)
      v16 = "vcVirtualRTTDeviceInitialize";
    else
      v16 = "vcVirtualTTYDeviceInitialize";
    v17 = -[AVConferenceXPCClient sendMessageSync:arguments:](v12->_connection, "sendMessageSync:arguments:", v16, v15);
    -[AVCVirtualTTYDevice registerBlocksForDelegateNotifications](v12, "registerBlocksForDelegateNotifications");
    if (v17)
    {
      v18 = (id)objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("ERROR"));
      if (v18 || objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("TIMEOUT")))
      {
        if (a4)
          *a4 = v18;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v19 = VRTraceErrorLogLevelToCSTR();
          v20 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            if (v18)
              v25 = (const char *)objc_msgSend((id)objc_msgSend(v18, "description"), "UTF8String");
            else
              v25 = "<nil>";
            v26 = objc_msgSend((id)objc_msgSend(v17, "description"), "UTF8String");
            *(_DWORD *)buf = 136316162;
            v29 = v19;
            v30 = 2080;
            v31 = "-[AVCVirtualTTYDevice initWithMode:error:streamToken:]";
            v32 = 1024;
            v33 = 65;
            v34 = 2080;
            *(_QWORD *)v35 = v25;
            *(_WORD *)&v35[8] = 2080;
            *(_QWORD *)v36 = v26;
            _os_log_error_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_ERROR, "AVCVirtualTTYDevice [%s] %s:%d AVCVirtualTTYDevice: error initializing error[%s] resultDict[%s]", buf, 0x30u);
          }
        }

        v12 = 0;
      }
    }

    MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCVirtualTTYDevice-init");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v21 = VRTraceErrorLogLevelToCSTR();
      v22 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        if (a4)
          v23 = (const __CFString *)*a4;
        else
          v23 = CFSTR("None");
        *(_DWORD *)buf = 136316674;
        v29 = v21;
        v30 = 2080;
        v31 = "-[AVCVirtualTTYDevice initWithMode:error:streamToken:]";
        v32 = 1024;
        v33 = 75;
        v34 = 2048;
        *(_QWORD *)v35 = v12;
        *(_WORD *)&v35[8] = 1024;
        *(_DWORD *)v36 = a3;
        *(_WORD *)&v36[4] = 1024;
        *(_DWORD *)&v36[6] = a5;
        v37 = 2112;
        v38 = v23;
        _os_log_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_DEFAULT, "AVCVirtualTTYDevice [%s] %s:%d @:@ AVCVirtualTTYDevice-init (%p) mode=%d, streamToken=%d, error=%@", buf, 0x3Cu);
      }
    }
  }
  return v12;
}

- (void)dealloc
{
  int ErrorLogLevelForModule;
  os_log_t *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  objc_super v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  AVCVirtualTTYDevice *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v4 = (os_log_t *)MEMORY[0x1E0CF2758];
  if (ErrorLogLevelForModule >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v11 = v5;
      v12 = 2080;
      v13 = "-[AVCVirtualTTYDevice dealloc]";
      v14 = 1024;
      v15 = 81;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVCVirtualTTYDevice [%s] %s:%d ", buf, 0x1Cu);
    }
  }
  objc_storeWeak(&self->_delegate, 0);
  -[AVCVirtualTTYDevice deregisterBlocksForDelegateNotifications](self, "deregisterBlocksForDelegateNotifications");
  -[AVCVirtualTTYDevice terminateSession](self, "terminateSession");
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCVirtualTTYDevice-dealloc");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v11 = v7;
      v12 = 2080;
      v13 = "-[AVCVirtualTTYDevice dealloc]";
      v14 = 1024;
      v15 = 87;
      v16 = 2048;
      v17 = self;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "AVCVirtualTTYDevice [%s] %s:%d @:@ AVCVirtualTTYDevice-dealloc (%p)", buf, 0x26u);
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)AVCVirtualTTYDevice;
  -[AVCVirtualTTYDevice dealloc](&v9, sel_dealloc);
}

- (AVCVirtualTTYDeviceDelegate)delegate
{
  return (AVCVirtualTTYDeviceDelegate *)objc_loadWeak(&self->_delegate);
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
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315906;
      v8 = v5;
      v9 = 2080;
      v10 = "-[AVCVirtualTTYDevice setDelegate:]";
      v11 = 1024;
      v12 = 96;
      v13 = 2112;
      v14 = a3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVCVirtualTTYDevice [%s] %s:%d delegate=%@", (uint8_t *)&v7, 0x26u);
    }
  }
  objc_storeWeak(&self->_delegate, a3);
}

- (void)start
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
  AVCVirtualTTYDevice *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v4 = (os_log_t *)MEMORY[0x1E0CF2758];
  if (ErrorLogLevelForModule >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315650;
      v10 = v5;
      v11 = 2080;
      v12 = "-[AVCVirtualTTYDevice start]";
      v13 = 1024;
      v14 = 101;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVCVirtualTTYDevice [%s] %s:%d ", (uint8_t *)&v9, 0x1Cu);
    }
  }
  self->_isStarted = 1;
  -[AVConferenceXPCClient sendMessageAsync:](self->_connection, "sendMessageAsync:", "vcMediaStreamStartConference");
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCVirtualTTYDevice-start");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315906;
      v10 = v7;
      v11 = 2080;
      v12 = "-[AVCVirtualTTYDevice start]";
      v13 = 1024;
      v14 = 104;
      v15 = 2048;
      v16 = self;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "AVCVirtualTTYDevice [%s] %s:%d @:@ AVCVirtualTTYDevice-start (%p)", (uint8_t *)&v9, 0x26u);
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
  AVCVirtualTTYDevice *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v4 = (os_log_t *)MEMORY[0x1E0CF2758];
  if (ErrorLogLevelForModule >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315650;
      v10 = v5;
      v11 = 2080;
      v12 = "-[AVCVirtualTTYDevice stop]";
      v13 = 1024;
      v14 = 108;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVCVirtualTTYDevice [%s] %s:%d ", (uint8_t *)&v9, 0x1Cu);
    }
  }
  self->_isStarted = 0;
  -[AVConferenceXPCClient sendMessageAsync:](self->_connection, "sendMessageAsync:", "vcMediaStreamStopConference");
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCVirtualTTYDevice-stop");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315906;
      v10 = v7;
      v11 = 2080;
      v12 = "-[AVCVirtualTTYDevice stop]";
      v13 = 1024;
      v14 = 111;
      v15 = 2048;
      v16 = self;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "AVCVirtualTTYDevice [%s] %s:%d @:@ AVCVirtualTTYDevice-stop (%p)", (uint8_t *)&v9, 0x26u);
    }
  }
}

- (id)sendCharacter:(unsigned __int16)a3
{
  uint64_t v3;
  int ErrorLogLevelForModule;
  os_log_t *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  _BYTE v23[10];
  id v24;
  uint64_t v25;

  v3 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v6 = (os_log_t *)MEMORY[0x1E0CF2758];
  if (ErrorLogLevelForModule >= 8)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *v6;
    v9 = *v6;
    if (*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v17 = v7;
        v18 = 2080;
        v19 = "-[AVCVirtualTTYDevice sendCharacter:]";
        v20 = 1024;
        v21 = 115;
        v22 = 1024;
        *(_DWORD *)v23 = v3;
        *(_WORD *)&v23[4] = 1024;
        *(_DWORD *)&v23[6] = v3;
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "AVCVirtualTTYDevice [%s] %s:%d Sending text:0x%04x '%C'", buf, 0x28u);
      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      -[AVCVirtualTTYDevice sendCharacter:].cold.1(v7);
    }
  }
  if (self->_isStarted)
  {
    v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v3);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v10, CFSTR("vcMediaStreamDictionary"), 0);
    -[AVConferenceXPCClient sendMessageSync:arguments:](self->_connection, "sendMessageSync:arguments:", "vcVirtualTTYDeviceSendCharacter", v11);

    v12 = 0;
  }
  else
  {
    v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("AVCVirtualTTYDevice"), 0, 0);
  }
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCVirtualTTYDevice-sendCharacter");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v17 = v13;
      v18 = 2080;
      v19 = "-[AVCVirtualTTYDevice sendCharacter:]";
      v20 = 1024;
      v21 = 125;
      v22 = 2048;
      *(_QWORD *)v23 = self;
      *(_WORD *)&v23[8] = 2112;
      v24 = v12;
      _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, "AVCVirtualTTYDevice [%s] %s:%d @:@ AVCVirtualTTYDevice-sendCharacter (%p) error=%@", buf, 0x30u);
    }
  }
  return v12;
}

- (BOOL)sendText:(id)a3
{
  int ErrorLogLevelForModule;
  _BYTE *v5;
  os_log_t *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  unint64_t v10;
  int v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  int v16;
  _BOOL4 isStarted;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  _BYTE v32[10];
  __int16 v33;
  int v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v5 = (_BYTE *)MEMORY[0x1E0CF2748];
  v6 = (os_log_t *)MEMORY[0x1E0CF2758];
  if (ErrorLogLevelForModule >= 8)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *v6;
    v9 = *v6;
    if (*v5)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v26 = v7;
        v27 = 2080;
        v28 = "-[AVCVirtualTTYDevice sendText:]";
        v29 = 1024;
        v30 = 130;
        v31 = 2112;
        *(_QWORD *)v32 = a3;
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "AVCVirtualTTYDevice [%s] %s:%d Sending text:%@", buf, 0x26u);
      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      -[AVCVirtualTTYDevice sendText:].cold.2();
    }
  }
  if (objc_msgSend(a3, "length"))
  {
    v10 = 0;
    do
    {
      v11 = objc_msgSend(a3, "characterAtIndex:", v10);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        v12 = VRTraceErrorLogLevelToCSTR();
        v13 = *v6;
        v14 = *v6;
        if (*v5)
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            v15 = objc_msgSend(a3, "length");
            *(_DWORD *)buf = 136316674;
            v26 = v12;
            v27 = 2080;
            v28 = "-[AVCVirtualTTYDevice sendText:]";
            v29 = 1024;
            v30 = 131;
            v31 = 1024;
            *(_DWORD *)v32 = v10;
            *(_WORD *)&v32[4] = 1024;
            *(_DWORD *)&v32[6] = v15;
            v33 = 1024;
            v34 = v11;
            v35 = 1024;
            v36 = v11;
            _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, "AVCVirtualTTYDevice [%s] %s:%d %d/%d: 0x%04x '%C'", buf, 0x34u);
          }
        }
        else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          v16 = objc_msgSend(a3, "length");
          *(_DWORD *)buf = 136316674;
          v26 = v12;
          v27 = 2080;
          v28 = "-[AVCVirtualTTYDevice sendText:]";
          v29 = 1024;
          v30 = 131;
          v31 = 1024;
          *(_DWORD *)v32 = v10;
          *(_WORD *)&v32[4] = 1024;
          *(_DWORD *)&v32[6] = v16;
          v33 = 1024;
          v34 = v11;
          v35 = 1024;
          v36 = v11;
          _os_log_debug_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEBUG, "AVCVirtualTTYDevice [%s] %s:%d %d/%d: 0x%04x '%C'", buf, 0x34u);
        }
      }
      ++v10;
    }
    while (v10 < objc_msgSend(a3, "length"));
  }
  isStarted = self->_isStarted;
  if (self->_isStarted)
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", a3, CFSTR("vcMediaStreamDictionary"), 0);
    -[AVConferenceXPCClient sendMessageSync:arguments:](self->_connection, "sendMessageSync:arguments:", "vcVirtualTTYDeviceSendText", v18);

    MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCVirtualTTYDevice-sendText");
    if ((int)VRTraceGetErrorLogLevelForModule() > 5)
    {
      v19 = VRTraceErrorLogLevelToCSTR();
      v20 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v26 = v19;
        v27 = 2080;
        v28 = "-[AVCVirtualTTYDevice sendText:]";
        v29 = 1024;
        v30 = 141;
        v31 = 2048;
        *(_QWORD *)v32 = self;
        v21 = "AVCVirtualTTYDevice [%s] %s:%d @:@ AVCVirtualTTYDevice-sendText (%p)";
LABEL_26:
        _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, v21, buf, 0x26u);
      }
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
        -[AVCVirtualTTYDevice sendText:].cold.1();
    }
    MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCVirtualTTYDevice-sendText");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v22 = VRTraceErrorLogLevelToCSTR();
      v20 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v26 = v22;
        v27 = 2080;
        v28 = "-[AVCVirtualTTYDevice sendText:]";
        v29 = 1024;
        v30 = 138;
        v31 = 2048;
        *(_QWORD *)v32 = self;
        v21 = "AVCVirtualTTYDevice [%s] %s:%d @:@ AVCVirtualTTYDevice-sendText (%p) Not started";
        goto LABEL_26;
      }
    }
  }
  return isStarted;
}

- (void)registerBlocksForDelegateNotifications
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[6];

  v8[5] = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
  v4 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__AVCVirtualTTYDevice_registerBlocksForDelegateNotifications__block_invoke;
  v8[3] = &unk_1E9E52730;
  v8[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:](self->_connection, "registerBlockForService:block:", "vcMediaStreamDidStartConnection", v8);
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __61__AVCVirtualTTYDevice_registerBlocksForDelegateNotifications__block_invoke_41;
  v7[3] = &unk_1E9E52730;
  v7[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:](self->_connection, "registerBlockForService:block:", "vcMediaStreamDidStopConnection", v7);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __61__AVCVirtualTTYDevice_registerBlocksForDelegateNotifications__block_invoke_43;
  v6[3] = &unk_1E9E52730;
  v6[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:](self->_connection, "registerBlockForService:block:", "vcMediaStreamTTYCharacterReceived", v6);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __61__AVCVirtualTTYDevice_registerBlocksForDelegateNotifications__block_invoke_49;
  v5[3] = &unk_1E9E52730;
  v5[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:](self->_connection, "registerBlockForService:block:", "vcMediaStreamTextReceived", v5);
}

void __61__AVCVirtualTTYDevice_registerBlocksForDelegateNotifications__block_invoke(uint64_t a1, void *a2, void *a3)
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
  const char *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
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
      v32 = "-[AVCVirtualTTYDevice registerBlocksForDelegateNotifications]_block_invoke";
      v33 = 1024;
      v34 = 150;
      v35 = 2048;
      v36 = a3;
      v37 = 2080;
      v38 = v8;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "AVCVirtualTTYDevice [%s] %s:%d didStartConnectionBlock: error = %p, result = %s", (uint8_t *)&v29, 0x30u);
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
          v32 = "-[AVCVirtualTTYDevice registerBlocksForDelegateNotifications]_block_invoke";
          v33 = 1024;
          v34 = 161;
          v35 = 1024;
          LODWORD(v36) = v16;
          _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, "AVCVirtualTTYDevice [%s] %s:%d AVCVirtualTTYDevice: didStartConnectionBlock strongSelf started(%d)", (uint8_t *)&v29, 0x22u);
        }
      }
      v17 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcMediaStreamError"));
      if (v17)
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("ERROR_DOMAIN")), (int)objc_msgSend((id)objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("ERROR_CODE")), "intValue"), objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("ERROR_USERINFO")));
      MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCVirtualTTYDevice-didStart");
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v18 = VRTraceErrorLogLevelToCSTR();
        v19 = *v13;
        if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
        {
          v20 = objc_msgSend(v11, "intValue");
          v29 = 136316162;
          v30 = v18;
          v31 = 2080;
          v32 = "-[AVCVirtualTTYDevice registerBlocksForDelegateNotifications]_block_invoke";
          v33 = 1024;
          v34 = 171;
          v35 = 2048;
          v36 = v10;
          v37 = 1024;
          LODWORD(v38) = v20;
          _os_log_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_DEFAULT, "AVCVirtualTTYDevice [%s] %s:%d @:@ AVCVirtualTTYDevice-didStart (%p) didSucceed=%d", (uint8_t *)&v29, 0x2Cu);
        }
      }
      objc_msgSend((id)objc_msgSend(v10, "delegate"), "device:didStart:error:", v10, objc_msgSend(v11, "BOOLValue"), v17);

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
      v32 = "-[AVCVirtualTTYDevice registerBlocksForDelegateNotifications]_block_invoke";
      v33 = 1024;
      v34 = 175;
      v35 = 2048;
      v36 = v10;
      v37 = 1024;
      LODWORD(v38) = v23;
      v24 = "AVCVirtualTTYDevice [%s] %s:%d AVCVirtualTTYDevice: notified client %p of didStart started[%d]";
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
      v32 = "-[AVCVirtualTTYDevice registerBlocksForDelegateNotifications]_block_invoke";
      v33 = 1024;
      v34 = 155;
      v24 = "AVCVirtualTTYDevice [%s] %s:%d AVCVirtualTTYDevice: didStartConnectionBlock: strongSelf == nil";
      v25 = v28;
      v26 = 28;
    }
    _os_log_impl(&dword_1D8A54000, v25, OS_LOG_TYPE_DEFAULT, v24, (uint8_t *)&v29, v26);
  }
}

void __61__AVCVirtualTTYDevice_registerBlocksForDelegateNotifications__block_invoke_41(uint64_t a1, void *a2, uint64_t a3)
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
      MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCVirtualTTYDevice-didStop");
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
          v15 = "-[AVCVirtualTTYDevice registerBlocksForDelegateNotifications]_block_invoke";
          v16 = 1024;
          v17 = 187;
          v18 = 2048;
          v19 = v5;
          _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, "AVCVirtualTTYDevice [%s] %s:%d @:@ AVCVirtualTTYDevice-didStop (%p)", (uint8_t *)&v12, 0x26u);
        }
      }
      objc_msgSend((id)objc_msgSend(v5, "delegate"), "deviceDidStop:", v5);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v10 = VRTraceErrorLogLevelToCSTR();
        v11 = *v7;
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
        {
          v12 = 136315906;
          v13 = v10;
          v14 = 2080;
          v15 = "-[AVCVirtualTTYDevice registerBlocksForDelegateNotifications]_block_invoke";
          v16 = 1024;
          v17 = 189;
          v18 = 2048;
          v19 = v5;
          _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, "AVCVirtualTTYDevice [%s] %s:%d AVCVirtualTTYDevice: notified client %p of didStop", (uint8_t *)&v12, 0x26u);
        }
      }
    }
  }
}

void __61__AVCVirtualTTYDevice_registerBlocksForDelegateNotifications__block_invoke_43(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  unsigned __int16 v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  _WORD v21[9];

  *(_QWORD *)&v21[5] = *MEMORY[0x1E0C80C00];
  if (!a3 && !objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "strong");
    if (v5)
    {
      v6 = (void *)v5;
      v7 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcMediaStreamTTYCharacterReceived")), "unsignedIntegerValue");
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x1E0CF2758];
        v10 = *MEMORY[0x1E0CF2758];
        if (*MEMORY[0x1E0CF2748])
        {
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            v14 = 136316162;
            v15 = v8;
            v16 = 2080;
            v17 = "-[AVCVirtualTTYDevice registerBlocksForDelegateNotifications]_block_invoke";
            v18 = 1024;
            v19 = 202;
            v20 = 1024;
            *(_DWORD *)v21 = v7;
            v21[2] = 1024;
            *(_DWORD *)&v21[3] = v7;
            _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, "AVCVirtualTTYDevice [%s] %s:%d Received text:0x%04x '%C'", (uint8_t *)&v14, 0x28u);
          }
        }
        else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          __61__AVCVirtualTTYDevice_registerBlocksForDelegateNotifications__block_invoke_43_cold_2(v8);
        }
      }
      objc_msgSend(v6, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCVirtualTTYDevice-didReceiveCharacter");
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          v11 = VRTraceErrorLogLevelToCSTR();
          v12 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v14 = 136315906;
            v15 = v11;
            v16 = 2080;
            v17 = "-[AVCVirtualTTYDevice registerBlocksForDelegateNotifications]_block_invoke";
            v18 = 1024;
            v19 = 204;
            v20 = 2048;
            *(_QWORD *)v21 = v6;
            _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, "AVCVirtualTTYDevice [%s] %s:%d @:@ AVCVirtualTTYDevice-didReceiveCharacter (%p)", (uint8_t *)&v14, 0x26u);
          }
        }
        objc_msgSend((id)objc_msgSend(v6, "delegate"), "device:didReceiveCharacter:", v6, v7);
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v13 = VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __61__AVCVirtualTTYDevice_registerBlocksForDelegateNotifications__block_invoke_43_cold_1(v13, v6);
      }
    }
  }
}

void __61__AVCVirtualTTYDevice_registerBlocksForDelegateNotifications__block_invoke_49(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  os_log_t *v8;
  uint64_t v9;
  NSObject *v10;
  int ErrorLogLevelForModule;
  _BYTE *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  unint64_t v16;
  int v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  int v21;
  int v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  _BYTE v34[10];
  __int16 v35;
  int v36;
  __int16 v37;
  int v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (!a3 && !objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "strong");
    if (v5)
    {
      v26 = (void *)v5;
      v6 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcMediaStreamTextReceived"));
      v7 = objc_msgSend(v6, "length");
      v8 = (os_log_t *)MEMORY[0x1E0CF2758];
      if (!v7 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *v8;
        if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
          __61__AVCVirtualTTYDevice_registerBlocksForDelegateNotifications__block_invoke_49_cold_3(v9, v10);
      }
      ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
      v12 = (_BYTE *)MEMORY[0x1E0CF2748];
      if (ErrorLogLevelForModule >= 8)
      {
        v13 = VRTraceErrorLogLevelToCSTR();
        v14 = *v8;
        v15 = *v8;
        if (*v12)
        {
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315906;
            v28 = v13;
            v29 = 2080;
            v30 = "-[AVCVirtualTTYDevice registerBlocksForDelegateNotifications]_block_invoke";
            v31 = 1024;
            v32 = 224;
            v33 = 2112;
            *(_QWORD *)v34 = v6;
            _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, "AVCVirtualTTYDevice [%s] %s:%d Received text:%@", buf, 0x26u);
          }
        }
        else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          __61__AVCVirtualTTYDevice_registerBlocksForDelegateNotifications__block_invoke_49_cold_2();
        }
      }
      if (objc_msgSend(v6, "length"))
      {
        v16 = 0;
        do
        {
          v17 = objc_msgSend(v6, "characterAtIndex:", v16);
          if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
          {
            v18 = VRTraceErrorLogLevelToCSTR();
            v19 = *v8;
            v20 = *v8;
            if (*v12)
            {
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              {
                v21 = objc_msgSend(v6, "length");
                *(_DWORD *)buf = 136316674;
                v28 = v18;
                v29 = 2080;
                v30 = "-[AVCVirtualTTYDevice registerBlocksForDelegateNotifications]_block_invoke";
                v31 = 1024;
                v32 = 225;
                v33 = 1024;
                *(_DWORD *)v34 = v16;
                *(_WORD *)&v34[4] = 1024;
                *(_DWORD *)&v34[6] = v21;
                v35 = 1024;
                v36 = v17;
                v37 = 1024;
                v38 = v17;
                _os_log_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_DEFAULT, "AVCVirtualTTYDevice [%s] %s:%d %d/%d: 0x%04x '%C'", buf, 0x34u);
              }
            }
            else if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            {
              v22 = objc_msgSend(v6, "length");
              *(_DWORD *)buf = 136316674;
              v28 = v18;
              v29 = 2080;
              v30 = "-[AVCVirtualTTYDevice registerBlocksForDelegateNotifications]_block_invoke";
              v31 = 1024;
              v32 = 225;
              v33 = 1024;
              *(_DWORD *)v34 = v16;
              *(_WORD *)&v34[4] = 1024;
              *(_DWORD *)&v34[6] = v22;
              v35 = 1024;
              v36 = v17;
              v37 = 1024;
              v38 = v17;
              _os_log_debug_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_DEBUG, "AVCVirtualTTYDevice [%s] %s:%d %d/%d: 0x%04x '%C'", buf, 0x34u);
            }
          }
          ++v16;
        }
        while (v16 < objc_msgSend(v6, "length"));
      }
      objc_msgSend(v26, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCVirtualTTYDevice-didReceiveText");
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          v23 = VRTraceErrorLogLevelToCSTR();
          v24 = *v8;
          if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315906;
            v28 = v23;
            v29 = 2080;
            v30 = "-[AVCVirtualTTYDevice registerBlocksForDelegateNotifications]_block_invoke";
            v31 = 1024;
            v32 = 227;
            v33 = 2048;
            *(_QWORD *)v34 = v26;
            _os_log_impl(&dword_1D8A54000, v24, OS_LOG_TYPE_DEFAULT, "AVCVirtualTTYDevice [%s] %s:%d @:@ AVCVirtualTTYDevice-didReceiveText (%p)", buf, 0x26u);
          }
        }
        objc_msgSend((id)objc_msgSend(v26, "delegate"), "device:didReceiveText:", v26, v6);
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v25 = VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
          __61__AVCVirtualTTYDevice_registerBlocksForDelegateNotifications__block_invoke_49_cold_1(v25, v26);
      }
    }
  }
}

- (void)deregisterBlocksForDelegateNotifications
{
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcMediaStreamDidStartConnection");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcMediaStreamDidStopConnection");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcMediaStreamTTYCharacterReceived");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcMediaStreamTextReceived");
}

- (void)terminateSession
{
  -[AVConferenceXPCClient sendMessageSync:](self->_connection, "sendMessageSync:", "vcVirtualTTYDeviceTerminate");

}

- (void)sendCharacter:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  _BYTE v3[22];
  int v4;
  uint64_t v5;

  *(_DWORD *)v3 = 136316162;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2080;
  *(_QWORD *)&v3[14] = "-[AVCVirtualTTYDevice sendCharacter:]";
  OUTLINED_FUNCTION_8_17();
  OUTLINED_FUNCTION_15_3(&dword_1D8A54000, v1, v2, "AVCVirtualTTYDevice [%s] %s:%d Sending text:0x%04x '%C'", *(const char **)v3, *(const char **)&v3[8], (unint64_t)"-[AVCVirtualTTYDevice sendCharacter:]" >> 16, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)sendText:.cold.1()
{
  objc_class *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v1, v2, "AVCVirtualTTYDevice [%s] %s:%d %@ has not started.", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)sendText:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_7_4(&dword_1D8A54000, v0, v1, "AVCVirtualTTYDevice [%s] %s:%d Sending text:%@");
  OUTLINED_FUNCTION_3();
}

void __61__AVCVirtualTTYDevice_registerBlocksForDelegateNotifications__block_invoke_43_cold_1(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_11_17(a2, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v2, v3, "AVCVirtualTTYDevice [%s] %s:%d Delegate %@ does not respond to -device:didReceiveCharacter:", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3_0();
}

void __61__AVCVirtualTTYDevice_registerBlocksForDelegateNotifications__block_invoke_43_cold_2(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  _BYTE v3[22];
  int v4;
  uint64_t v5;

  *(_DWORD *)v3 = 136316162;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2080;
  *(_QWORD *)&v3[14] = "-[AVCVirtualTTYDevice registerBlocksForDelegateNotifications]_block_invoke";
  OUTLINED_FUNCTION_8_17();
  OUTLINED_FUNCTION_15_3(&dword_1D8A54000, v1, v2, "AVCVirtualTTYDevice [%s] %s:%d Received text:0x%04x '%C'", *(const char **)v3, *(const char **)&v3[8], (unint64_t)"-[AVCVirtualTTYDevice registerBlocksForDelegateNotifications]_block_invoke" >> 16, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __61__AVCVirtualTTYDevice_registerBlocksForDelegateNotifications__block_invoke_49_cold_1(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_11_17(a2, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v2, v3, "AVCVirtualTTYDevice [%s] %s:%d Delegate %@ does not respond to -device:didReceiveText:", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3_0();
}

void __61__AVCVirtualTTYDevice_registerBlocksForDelegateNotifications__block_invoke_49_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_7_4(&dword_1D8A54000, v0, v1, "AVCVirtualTTYDevice [%s] %s:%d Received text:%@");
  OUTLINED_FUNCTION_3();
}

void __61__AVCVirtualTTYDevice_registerBlocksForDelegateNotifications__block_invoke_49_cold_3(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = 136315650;
  v3 = a1;
  v4 = 2080;
  v5 = "-[AVCVirtualTTYDevice registerBlocksForDelegateNotifications]_block_invoke";
  v6 = 1024;
  v7 = 222;
  _os_log_error_impl(&dword_1D8A54000, a2, OS_LOG_TYPE_ERROR, "AVCVirtualTTYDevice [%s] %s:%d Received an empty string", (uint8_t *)&v2, 0x1Cu);
  OUTLINED_FUNCTION_3();
}

@end
