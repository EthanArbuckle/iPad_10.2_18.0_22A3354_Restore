@implementation VCTextStream

+ (void)terminateProcess:(id)a3 terminateSource:(id)a4 agent:(opaqueRTCReporting *)a5
{
  VCTerminateProcess((uint64_t)a3, a4, (uint64_t)a5);
}

- (VCTextStream)init
{
  VCTextStream *v2;
  uint64_t v3;
  NSObject *v4;
  objc_super v6;
  uint8_t buf[4];
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  VCTextStream *v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)VCTextStream;
  v2 = -[VCMediaStream init](&v6, sel_init);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v8 = v3;
      v9 = 2080;
      v10 = "-[VCTextStream init]";
      v11 = 1024;
      v12 = 46;
      v13 = 2048;
      v14 = v2;
      v15 = 2080;
      v16 = "-[VCTextStream init]";
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "VCTextStream [%s] %s:%d VCTextStream[%p] %s", buf, 0x30u);
    }
  }
  return v2;
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
  objc_super v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  VCTextStream *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if ((VCTextStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v13 = v4;
        v14 = 2080;
        v15 = "-[VCTextStream dealloc]";
        v16 = 1024;
        v17 = 51;
        v6 = "VCTextStream [%s] %s:%d ";
        v7 = v5;
        v8 = 28;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)-[VCTextStream performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v13 = v9;
        v14 = 2080;
        v15 = "-[VCTextStream dealloc]";
        v16 = 1024;
        v17 = 51;
        v18 = 2112;
        v19 = v3;
        v20 = 2048;
        v21 = self;
        v6 = "VCTextStream [%s] %s:%d %@(%p) ";
        v7 = v10;
        v8 = 48;
        goto LABEL_11;
      }
    }
  }

  objc_storeWeak((id *)&self->_receiveDelegate, 0);
  v11.receiver = self;
  v11.super_class = (Class)VCTextStream;
  -[VCMediaStream dealloc](&v11, sel_dealloc);
}

- (void)setReceiveDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_receiveDelegate, a3);
}

- (VCTextReceiverDelegate)receiveDelegate
{
  return (VCTextReceiverDelegate *)objc_loadWeak((id *)&self->_receiveDelegate);
}

- (void)sendCharacter:(unsigned __int16)a3
{
  uint64_t v3;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  _BYTE v15[24];
  __int128 v16;
  VCTextStream *v17;
  uint64_t v18;
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  if ((VCTextStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      v8 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v15 = 136315906;
          *(_QWORD *)&v15[4] = v6;
          *(_WORD *)&v15[12] = 2080;
          *(_QWORD *)&v15[14] = "-[VCTextStream sendCharacter:]";
          *(_WORD *)&v15[22] = 1024;
          LODWORD(v16) = 71;
          WORD2(v16) = 1024;
          *(_DWORD *)((char *)&v16 + 6) = v3;
          v9 = "VCTextStream [%s] %s:%d Sending text:'%C'";
          v10 = v7;
          v11 = 34;
LABEL_13:
          _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, v15, v11);
        }
      }
      else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        -[VCTextStream sendCharacter:].cold.1(v6, v3, v7);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VCTextStream performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      v14 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v15 = 136316418;
          *(_QWORD *)&v15[4] = v12;
          *(_WORD *)&v15[12] = 2080;
          *(_QWORD *)&v15[14] = "-[VCTextStream sendCharacter:]";
          *(_WORD *)&v15[22] = 1024;
          LODWORD(v16) = 71;
          WORD2(v16) = 2112;
          *(_QWORD *)((char *)&v16 + 6) = v5;
          HIWORD(v16) = 2048;
          v17 = self;
          LOWORD(v18) = 1024;
          *(_DWORD *)((char *)&v18 + 2) = v3;
          v9 = "VCTextStream [%s] %s:%d %@(%p) Sending text:'%C'";
          v10 = v13;
          v11 = 54;
          goto LABEL_13;
        }
      }
      else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v15 = 136316418;
        *(_QWORD *)&v15[4] = v12;
        *(_WORD *)&v15[12] = 2080;
        *(_QWORD *)&v15[14] = "-[VCTextStream sendCharacter:]";
        *(_WORD *)&v15[22] = 1024;
        LODWORD(v16) = 71;
        WORD2(v16) = 2112;
        *(_QWORD *)((char *)&v16 + 6) = v5;
        HIWORD(v16) = 2048;
        v17 = self;
        LOWORD(v18) = 1024;
        *(_DWORD *)((char *)&v18 + 2) = v3;
        _os_log_debug_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEBUG, "VCTextStream [%s] %s:%d %@(%p) Sending text:'%C'", v15, 0x36u);
      }
    }
  }
  -[VCTextTransmitter sendCharacter:](self->_textTransmitter, "sendCharacter:", v3, *(_OWORD *)v15, *(_QWORD *)&v15[16], v16, v17, v18, v19);
}

- (void)sendText:(id)a3
{
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  _BYTE v15[24];
  __int128 v16;
  VCTextStream *v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if ((VCTextStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      v8 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v15 = 136315906;
          *(_QWORD *)&v15[4] = v6;
          *(_WORD *)&v15[12] = 2080;
          *(_QWORD *)&v15[14] = "-[VCTextStream sendText:]";
          *(_WORD *)&v15[22] = 1024;
          LODWORD(v16) = 76;
          WORD2(v16) = 2112;
          *(_QWORD *)((char *)&v16 + 6) = a3;
          v9 = "VCTextStream [%s] %s:%d Sending text:%@";
          v10 = v7;
          v11 = 38;
LABEL_13:
          _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, v15, v11);
        }
      }
      else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        -[VCTextStream sendText:].cold.1();
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VCTextStream performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      v14 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v15 = 136316418;
          *(_QWORD *)&v15[4] = v12;
          *(_WORD *)&v15[12] = 2080;
          *(_QWORD *)&v15[14] = "-[VCTextStream sendText:]";
          *(_WORD *)&v15[22] = 1024;
          LODWORD(v16) = 76;
          WORD2(v16) = 2112;
          *(_QWORD *)((char *)&v16 + 6) = v5;
          HIWORD(v16) = 2048;
          v17 = self;
          LOWORD(v18) = 2112;
          *(_QWORD *)((char *)&v18 + 2) = a3;
          v9 = "VCTextStream [%s] %s:%d %@(%p) Sending text:%@";
          v10 = v13;
          v11 = 58;
          goto LABEL_13;
        }
      }
      else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v15 = 136316418;
        *(_QWORD *)&v15[4] = v12;
        *(_WORD *)&v15[12] = 2080;
        *(_QWORD *)&v15[14] = "-[VCTextStream sendText:]";
        *(_WORD *)&v15[22] = 1024;
        LODWORD(v16) = 76;
        WORD2(v16) = 2112;
        *(_QWORD *)((char *)&v16 + 6) = v5;
        HIWORD(v16) = 2048;
        v17 = self;
        LOWORD(v18) = 2112;
        *(_QWORD *)((char *)&v18 + 2) = a3;
        _os_log_debug_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEBUG, "VCTextStream [%s] %s:%d %@(%p) Sending text:%@", v15, 0x3Au);
      }
    }
  }
  -[VCTextTransmitter sendText:](self->_textTransmitter, "sendText:", a3, *(_OWORD *)v15, *(_QWORD *)&v15[16], v16, v17, v18);
}

- (void)didReceiveCharacter:(unsigned __int16)a3
{
  const __CFString *v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const __CFString *v14;
  __int16 v15;
  VCTextStream *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if ((VCTextStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCTextStream didReceiveCharacter:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v4 = (const __CFString *)-[VCTextStream performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v4 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v7 = 136316162;
        v8 = v5;
        v9 = 2080;
        v10 = "-[VCTextStream didReceiveCharacter:]";
        v11 = 1024;
        v12 = 83;
        v13 = 2112;
        v14 = v4;
        v15 = 2048;
        v16 = self;
        _os_log_error_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_ERROR, "VCTextStream [%s] %s:%d %@(%p) Error: -didReceiveText: should be called instead of this method.", (uint8_t *)&v7, 0x30u);
      }
    }
  }
}

- (void)didReceiveText:(id)a3
{
  -[VCTextReceiverDelegate didReceiveText:](-[VCTextStream receiveDelegate](self, "receiveDelegate"), "didReceiveText:", a3);
}

- (id)supportedPayloads
{
  return &unk_1E9EF9AE8;
}

- (void)setupTextTransmitter
{
  VCMediaStreamConfig *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];

  v3 = -[VCMediaStream defaultStreamConfig](self, "defaultStreamConfig");
  HIDWORD(v6) = -[VCMediaStreamConfig isRedEnabled](v3, "isRedEnabled", -[VCMediaStreamTransport rtpHandle](-[VCMediaStream defaultTransport](self, "defaultTransport"), "rtpHandle"), 1000);
  v7 = -[VCMediaStreamConfig numRedundantPayloads](v3, "numRedundantPayloads");
  -[VCMediaStreamConfig txIntervalMin](v3, "txIntervalMin");
  v8 = v4;
  self->_textTransmitter = -[VCTextTransmitter initWithConfiguration:]([VCTextTransmitter alloc], "initWithConfiguration:", &v5);
}

- (BOOL)setupTextReceiverWithError:(id *)a3
{
  VCTextReceiver *v5;
  VCTextReceiver *v6;
  tagHANDLE *v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];

  v8 = -[VCMediaStreamTransport rtpHandle](-[VCMediaStream defaultTransport](self, "defaultTransport"), "rtpHandle");
  v9 = 1000;
  if (self->super._transportSetupInfo.setupType == 5)
    BYTE4(v9) = 1;
  v5 = -[VCTextReceiver initWithConfiguration:]([VCTextReceiver alloc], "initWithConfiguration:", &v8);
  v6 = v5;
  self->_textReceiver = v5;
  if (v5)
  {
    -[VCTextReceiver setDelegate:](v5, "setDelegate:", self);
    -[VCTextReceiver setSupportedPayloads:](self->_textReceiver, "setSupportedPayloads:", -[NSDictionary allKeys](-[VCMediaStreamConfig rxPayloadMap](-[VCMediaStream defaultStreamConfig](self, "defaultStreamConfig"), "rxPayloadMap"), "allKeys"));
  }
  else if (a3)
  {
    *a3 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "AVConferenceServiceError:detailCode:description:", 32000, 0, CFSTR("Failed to allocate the text receiver"));
  }
  return v6 != 0;
}

- (BOOL)onConfigureStreamWithConfiguration:(id)a3 error:(id *)a4
{
  uint64_t v7;
  VCMediaStreamTransport *v8;
  const __CFString *v10;
  uint64_t v11;
  char IsOSFaultDisabled;
  NSObject *v13;
  uint64_t v14;
  char v15;
  NSObject *v16;
  const char *v17;
  const __CFString *v18;
  const char *v19;
  uint64_t v20;
  NSObject *v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  VCTextStream *v31;
  __int16 v32;
  const char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (!a3 || objc_msgSend(a3, "count") != 1)
  {
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a4, 32016, 105, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCTextStream.m", 144), CFSTR("Invalid Parameter"), CFSTR("Called with an invalid parameter"));
    if ((VCTextStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
      {
        v11 = VRTraceErrorLogLevelToCSTR();
        IsOSFaultDisabled = VRTraceIsOSFaultDisabled();
        v13 = *MEMORY[0x1E0CF2758];
        if ((IsOSFaultDisabled & 1) != 0)
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCTextStream onConfigureStreamWithConfiguration:error:].cold.1(v11, a4, v13);
        }
        else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
        {
          -[VCTextStream onConfigureStreamWithConfiguration:error:].cold.2(v11, a4, v13);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v10 = (const __CFString *)-[VCTextStream performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v10 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
      {
        v14 = VRTraceErrorLogLevelToCSTR();
        v15 = VRTraceIsOSFaultDisabled();
        v16 = *MEMORY[0x1E0CF2758];
        if ((v15 & 1) != 0)
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            if (*a4)
              v17 = (const char *)objc_msgSend((id)objc_msgSend(*a4, "description"), "UTF8String");
            else
              v17 = "<nil>";
            *(_DWORD *)buf = 136316418;
            v23 = v14;
            v24 = 2080;
            v25 = "-[VCTextStream onConfigureStreamWithConfiguration:error:]";
            v26 = 1024;
            v27 = 147;
            v28 = 2112;
            v29 = v10;
            v30 = 2048;
            v31 = self;
            v32 = 2080;
            v33 = v17;
            _os_log_error_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_ERROR, "VCTextStream [%s] %s:%d %@(%p) error[%s]", buf, 0x3Au);
          }
        }
        else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
        {
          if (*a4)
            v19 = (const char *)objc_msgSend((id)objc_msgSend(*a4, "description"), "UTF8String");
          else
            v19 = "<nil>";
          *(_DWORD *)buf = 136316418;
          v23 = v14;
          v24 = 2080;
          v25 = "-[VCTextStream onConfigureStreamWithConfiguration:error:]";
          v26 = 1024;
          v27 = 147;
          v28 = 2112;
          v29 = v10;
          v30 = 2048;
          v31 = self;
          v32 = 2080;
          v33 = v19;
          _os_log_fault_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_FAULT, "VCTextStream [%s] %s:%d %@(%p) error[%s]", buf, 0x3Au);
        }
      }
    }
    return 0;
  }
  v7 = objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
  if (-[NSMutableArray count](self->super._transportArray, "count"))
  {
    v8 = -[VCMediaStream defaultTransport](self, "defaultTransport");
    if (v8)
      goto LABEL_5;
LABEL_23:
    if ((VCTextStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCTextStream onConfigureStreamWithConfiguration:error:].cold.3();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v18 = (const __CFString *)-[VCTextStream performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v18 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v20 = VRTraceErrorLogLevelToCSTR();
        v21 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v23 = v20;
          v24 = 2080;
          v25 = "-[VCTextStream onConfigureStreamWithConfiguration:error:]";
          v26 = 1024;
          v27 = 154;
          v28 = 2112;
          v29 = v18;
          v30 = 2048;
          v31 = self;
          _os_log_error_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_ERROR, "VCTextStream [%s] %s:%d %@(%p) Failed to create transport", buf, 0x30u);
        }
      }
    }
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a4, 32016, 105, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCTextStream.m", 158), CFSTR("Failed to create transport"), CFSTR("Create transport failed"));
    return 0;
  }
  v8 = -[VCMediaStream createTransportWithStreamConfig:ssrc:](self, "createTransportWithStreamConfig:ssrc:", v7, self->super._localSSRC);
  if (!v8)
    goto LABEL_23;
LABEL_5:
  self->super._transportSetupInfo.sourceRate = 1000;
  if (self->super._transportSetupInfo.setupType == 5)
    self->super._transportSetupInfo.var0.ipInfo.srcIPPORT.szIfName[12] = 1;
  if (-[VCMediaStreamTransport configureWithStreamConfig:setupInfo:reducedSizeRTCPPackets:hopByHopEncryptRTCPPackets:statisticsCollector:basebandCongestionDetector:error:](v8, "configureWithStreamConfig:setupInfo:reducedSizeRTCPPackets:hopByHopEncryptRTCPPackets:statisticsCollector:basebandCongestionDetector:error:", v7, a4))
  {
    -[VCTextStream setupTextTransmitter](self, "setupTextTransmitter");
    return -[VCTextStream setupTextReceiverWithError:](self, "setupTextReceiverWithError:", a4);
  }
  return 0;
}

- (void)onStartWithCompletionHandler:(id)a3
{
  -[VCTextTransmitter start](self->_textTransmitter, "start");
  -[VCTextReceiver start](self->_textReceiver, "start");
  (*((void (**)(id, uint64_t, _QWORD))a3 + 2))(a3, 1, 0);
}

- (void)onStopWithCompletionHandler:(id)a3
{
  -[VCTextTransmitter stop](self->_textTransmitter, "stop");
  -[VCTextReceiver stop](self->_textReceiver, "stop");
  (*((void (**)(id, uint64_t, _QWORD))a3 + 2))(a3, 1, 0);
}

- (void)onPauseWithCompletionHandler:(id)a3
{
  (*((void (**)(id, uint64_t, _QWORD))a3 + 2))(a3, 1, 0);
}

- (void)onResumeWithCompletionHandler:(id)a3
{
  (*((void (**)(id, uint64_t, _QWORD))a3 + 2))(a3, 1, 0);
}

- (void)onSendRTCPPacket
{
  __int128 v2;

  -[VCMediaStreamTransport sendControlPacketWithParameters:](-[VCMediaStream defaultTransport](self, "defaultTransport", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0,
      0,
      0,
      0,
      0,
      *MEMORY[0x1E0C80C00]),
    "sendControlPacketWithParameters:",
    &v2);
}

- (double)lastReceivedRTPPacketTime
{
  double result;

  -[VCTextReceiver lastReceivedRTPPacketTime](self->_textReceiver, "lastReceivedRTPPacketTime");
  return result;
}

- (double)lastReceivedRTCPPacketTime
{
  double result;

  -[VCTextReceiver lastReceivedRTCPPacketTime](self->_textReceiver, "lastReceivedRTCPPacketTime");
  return result;
}

- (double)rtcpHeartbeatLeeway
{
  return 0.1;
}

- (void)sendCharacter:(os_log_t)log .cold.1(uint64_t a1, unsigned __int16 a2, os_log_t log)
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
  v6 = "-[VCTextStream sendCharacter:]";
  v7 = 1024;
  v8 = 71;
  v9 = 1024;
  v10 = a2;
  _os_log_debug_impl(&dword_1D8A54000, log, OS_LOG_TYPE_DEBUG, "VCTextStream [%s] %s:%d Sending text:'%C'", (uint8_t *)&v3, 0x22u);
  OUTLINED_FUNCTION_3();
}

- (void)sendText:.cold.1()
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
  v5 = "-[VCTextStream sendText:]";
  v6 = 1024;
  v7 = 76;
  v8 = 2112;
  v9 = v1;
  _os_log_debug_impl(&dword_1D8A54000, v2, OS_LOG_TYPE_DEBUG, "VCTextStream [%s] %s:%d Sending text:%@", v3, 0x26u);
  OUTLINED_FUNCTION_3();
}

- (void)didReceiveCharacter:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCTextStream [%s] %s:%d Error: -didReceiveText: should be called instead of this method.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)onConfigureStreamWithConfiguration:(NSObject *)a3 error:.cold.1(uint64_t a1, id *a2, NSObject *a3)
{
  uint8_t v4[40];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (*a2)
    objc_msgSend((id)objc_msgSend(*a2, "description"), "UTF8String");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_0_1();
  _os_log_error_impl(&dword_1D8A54000, a3, OS_LOG_TYPE_ERROR, "VCTextStream [%s] %s:%d error[%s]", v4, 0x26u);
  OUTLINED_FUNCTION_3_0();
}

- (void)onConfigureStreamWithConfiguration:(NSObject *)a3 error:.cold.2(uint64_t a1, id *a2, NSObject *a3)
{
  uint8_t v4[40];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (*a2)
    objc_msgSend((id)objc_msgSend(*a2, "description"), "UTF8String");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_0_1();
  _os_log_fault_impl(&dword_1D8A54000, a3, OS_LOG_TYPE_FAULT, "VCTextStream [%s] %s:%d error[%s]", v4, 0x26u);
  OUTLINED_FUNCTION_3_0();
}

- (void)onConfigureStreamWithConfiguration:error:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCTextStream [%s] %s:%d Failed to create transport", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
