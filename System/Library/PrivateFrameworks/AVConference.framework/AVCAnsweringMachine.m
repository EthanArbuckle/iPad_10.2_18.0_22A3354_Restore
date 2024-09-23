@implementation AVCAnsweringMachine

- (AVCAnsweringMachineDelegate)delegate
{
  return (AVCAnsweringMachineDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (id)logPrefix
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (id)description
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)AVCAnsweringMachine;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@ messageAudioToken=%ld, configuration=%@"), -[AVCAnsweringMachine description](&v3, sel_description), -[AVCAnsweringMachine logPrefix](self, "logPrefix"), self->_messageAudioToken, self->_configuration);
}

- (void)registerDidStartBlockWithInstance:(id)a3
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __57__AVCAnsweringMachine_registerDidStartBlockWithInstance___block_invoke;
  v3[3] = &unk_1E9E52730;
  v3[4] = a3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcAnsweringMachineDidStart", v3, self->_stateQueue);
}

void __57__AVCAnsweringMachine_registerDidStartBlockWithInstance___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  _QWORD v19[8];
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    v6 = objc_msgSend(*(id *)(a1 + 32), "strong");
    if (v6)
    {
      v7 = (void *)v6;
      if (objc_opt_class() == v6)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_14;
        v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_14;
        *(_DWORD *)buf = 136315650;
        v21 = v9;
        v22 = 2080;
        v23 = "-[AVCAnsweringMachine registerDidStartBlockWithInstance:]_block_invoke";
        v24 = 1024;
        v25 = 91;
        v11 = " [%s] %s:%d received callback for didStart";
        v12 = v10;
        v13 = 28;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v8 = (const __CFString *)objc_msgSend(v7, "performSelector:", sel_logPrefix);
        else
          v8 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_14;
        v14 = VRTraceErrorLogLevelToCSTR();
        v15 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_14;
        *(_DWORD *)buf = 136316162;
        v21 = v14;
        v22 = 2080;
        v23 = "-[AVCAnsweringMachine registerDidStartBlockWithInstance:]_block_invoke";
        v24 = 1024;
        v25 = 91;
        v26 = 2112;
        v27 = v8;
        v28 = 2048;
        v29 = v7;
        v11 = " [%s] %s:%d %@(%p) received callback for didStart";
        v12 = v15;
        v13 = 48;
      }
      _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
LABEL_14:
      v16 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcAnsweringMachineStatus"));
      v17 = objc_msgSend(v7, "delegate");
      v18 = objc_msgSend(v7, "delegateQueue");
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __57__AVCAnsweringMachine_registerDidStartBlockWithInstance___block_invoke_10;
      v19[3] = &unk_1E9E54D20;
      v19[4] = v16;
      v19[5] = v7;
      v19[6] = a3;
      v19[7] = v17;
      dispatch_async(v18, v19);
      return;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __57__AVCAnsweringMachine_registerDidStartBlockWithInstance___block_invoke_cold_1();
    }
  }
}

uint64_t __57__AVCAnsweringMachine_registerDidStartBlockWithInstance___block_invoke_10(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "BOOLValue");
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCAnsweringMachine-didStart");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 40);
      v6 = *(_QWORD *)(a1 + 48);
      v8 = 136316418;
      v9 = v3;
      v10 = 2080;
      v11 = "-[AVCAnsweringMachine registerDidStartBlockWithInstance:]_block_invoke";
      v12 = 1024;
      v13 = 98;
      v14 = 2048;
      v15 = v5;
      v16 = 1024;
      v17 = v2;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCAnsweringMachine-didStart (%p) didStart=%{BOOL}d, error=%@", (uint8_t *)&v8, 0x36u);
    }
  }
  return objc_msgSend(*(id *)(a1 + 56), "answeringMachine:didStart:error:", *(_QWORD *)(a1 + 40), v2, *(_QWORD *)(a1 + 48));
}

- (void)printDidStop:(BOOL)a3 messageRecordingURL:(id)a4 error:(id)a5
{
  _BOOL4 v6;
  int v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  AVCAnsweringMachine *v28;
  __int16 v29;
  _BOOL4 v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  int v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v6 = a3;
  v43 = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    v18 = 0xAAAAAAAAAAAAAAAALL;
    v19 = -1;
    v20 = -1;
    +[VCFileUtil statsOfFile:](VCFileUtil, "statsOfFile:", a4);
    v17 = 0;
    v9 = VCUtil_BinaryPrefix(v18, (double *)&v17);
    MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCAnsweringMachine-didStop");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136317698;
        v22 = v10;
        v23 = 2080;
        v24 = "-[AVCAnsweringMachine printDidStop:messageRecordingURL:error:]";
        v25 = 1024;
        v26 = 123;
        v27 = 2048;
        v28 = self;
        v29 = 1024;
        v30 = v6;
        v31 = 2112;
        v32 = a4;
        v33 = 2112;
        v34 = a5;
        v35 = 2048;
        v36 = v17;
        v37 = 1024;
        v38 = v9;
        v39 = 2048;
        v40 = v19;
        v41 = 2048;
        v42 = v20;
        v12 = " [%s] %s:%d @:@ AVCAnsweringMachine-didStop (%p) didStop=%{BOOL}d messageRecordingURL=%@ error=%@ recordin"
              "gSize=%.2f%cB recordingLength=%.2fs, recordingAudioLength=%.2fs";
        v13 = v11;
        v14 = 100;
LABEL_8:
        _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
      }
    }
  }
  else
  {
    MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCAnsweringMachine-didStop");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316674;
        v22 = v15;
        v23 = 2080;
        v24 = "-[AVCAnsweringMachine printDidStop:messageRecordingURL:error:]";
        v25 = 1024;
        v26 = 117;
        v27 = 2048;
        v28 = self;
        v29 = 1024;
        v30 = v6;
        v31 = 2112;
        v32 = 0;
        v33 = 2112;
        v34 = a5;
        v12 = " [%s] %s:%d @:@ AVCAnsweringMachine-didStop (%p) didStop=%{BOOL}d messageRecordingURL=%@ error=%@";
        v13 = v16;
        v14 = 64;
        goto LABEL_8;
      }
    }
  }
}

+ (void)cleanUpMessageRecordingURL:(id)a3 messageRecordingURLSandboxExtensionHandle:(int64_t)a4
{
  BOOL v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  id v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  if (a3
    && (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "removeItemAtURL:error:", a3, &v9)? (v6 = v9 == 0): (v6 = 0), !v6&& (int)VRTraceGetErrorLogLevelForModule() >= 3&& (v7 = VRTraceErrorLogLevelToCSTR(), v8 = *MEMORY[0x1E0CF2758], os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))))
  {
    *(_DWORD *)buf = 136316162;
    v11 = v7;
    v12 = 2080;
    v13 = "+[AVCAnsweringMachine cleanUpMessageRecordingURL:messageRecordingURLSandboxExtensionHandle:]";
    v14 = 1024;
    v15 = 135;
    v16 = 2112;
    v17 = a3;
    v18 = 2112;
    v19 = v9;
    _os_log_error_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to remove messageRecordingURL=%@: error=%@", buf, 0x30u);
    if (!a4)
      return;
  }
  else if (!a4)
  {
    return;
  }
  sandbox_extension_release();
}

- (void)registerDidStopBlockWithInstance:(id)a3
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __56__AVCAnsweringMachine_registerDidStopBlockWithInstance___block_invoke;
  v3[3] = &unk_1E9E52730;
  v3[4] = a3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcAnsweringMachineDidStop", v3, self->_stateQueue);
}

void __56__AVCAnsweringMachine_registerDidStopBlockWithInstance___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  _QWORD block[9];
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    v6 = objc_msgSend(*(id *)(a1 + 32), "strong");
    if (v6)
    {
      v7 = (void *)v6;
      if (objc_opt_class() == v6)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_14;
        v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_14;
        *(_DWORD *)buf = 136315650;
        v21 = v9;
        v22 = 2080;
        v23 = "-[AVCAnsweringMachine registerDidStopBlockWithInstance:]_block_invoke";
        v24 = 1024;
        v25 = 153;
        v11 = " [%s] %s:%d Received callback for didStop";
        v12 = v10;
        v13 = 28;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v8 = (const __CFString *)objc_msgSend(v7, "performSelector:", sel_logPrefix);
        else
          v8 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_14;
        v14 = VRTraceErrorLogLevelToCSTR();
        v15 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_14;
        *(_DWORD *)buf = 136316162;
        v21 = v14;
        v22 = 2080;
        v23 = "-[AVCAnsweringMachine registerDidStopBlockWithInstance:]_block_invoke";
        v24 = 1024;
        v25 = 153;
        v26 = 2112;
        v27 = v8;
        v28 = 2048;
        v29 = v7;
        v11 = " [%s] %s:%d %@(%p) Received callback for didStop";
        v12 = v15;
        v13 = 48;
      }
      _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
LABEL_14:
      v16 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcAnsweringMachineStatus"));
      v17 = objc_msgSend(v7, "delegate");
      v18 = objc_msgSend(v7, "delegateQueue");
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __56__AVCAnsweringMachine_registerDidStopBlockWithInstance___block_invoke_16;
      block[3] = &unk_1E9E54D48;
      block[4] = v16;
      block[5] = a2;
      block[6] = v7;
      block[7] = a3;
      block[8] = v17;
      dispatch_async(v18, block);
      return;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __56__AVCAnsweringMachine_registerDidStopBlockWithInstance___block_invoke_cold_1();
    }
  }
}

uint64_t __56__AVCAnsweringMachine_registerDidStopBlockWithInstance___block_invoke_16(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  unsigned int v6;
  int v7;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE v21[24];
  __int128 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "BOOLValue");
  v3 = objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("vcAnsweringMachineMessageRecordingURL"));
  v4 = (void *)objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("vcAnsweringMachineMessageRecordingURLSandboxExtensionToken"));
  if (!v4)
  {
    v6 = (v3 == 0) ^ objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "isMessageRecordingEnabled");
    if (v6)
      v7 = 7;
    else
      v7 = 3;
    if (objc_opt_class() == *(_QWORD *)(a1 + 48))
    {
      if (v7 <= (int)VRTraceGetErrorLogLevelForModule())
      {
        v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E0CF2758];
        v11 = *MEMORY[0x1E0CF2758];
        if ((v6 & 1) == 0)
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            __56__AVCAnsweringMachine_registerDidStopBlockWithInstance___block_invoke_16_cold_1();
          goto LABEL_23;
        }
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v21 = 136315650;
          *(_QWORD *)&v21[4] = v9;
          *(_WORD *)&v21[12] = 2080;
          *(_QWORD *)&v21[14] = "-[AVCAnsweringMachine registerDidStopBlockWithInstance:]_block_invoke";
          *(_WORD *)&v21[22] = 1024;
          LODWORD(v22) = 169;
          v12 = " [%s] %s:%d No message recording URL sandbox extension token to consume";
          v13 = v10;
          v14 = 28;
LABEL_18:
          _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, v12, v21, v14);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v8 = (const __CFString *)objc_msgSend(*(id *)(a1 + 48), "performSelector:", sel_logPrefix);
      else
        v8 = &stru_1E9E58EE0;
      if (v7 > (int)VRTraceGetErrorLogLevelForModule())
        goto LABEL_23;
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      v17 = *MEMORY[0x1E0CF2758];
      if ((v6 & 1) == 0)
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v19 = *(_QWORD *)(a1 + 48);
          *(_DWORD *)v21 = 136316162;
          *(_QWORD *)&v21[4] = v15;
          *(_WORD *)&v21[12] = 2080;
          *(_QWORD *)&v21[14] = "-[AVCAnsweringMachine registerDidStopBlockWithInstance:]_block_invoke";
          *(_WORD *)&v21[22] = 1024;
          LODWORD(v22) = 169;
          WORD2(v22) = 2112;
          *(_QWORD *)((char *)&v22 + 6) = v8;
          HIWORD(v22) = 2048;
          v23 = v19;
          _os_log_error_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) No message recording URL sandbox extension token to consume", v21, 0x30u);
        }
        goto LABEL_23;
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)v21 = 136316162;
        *(_QWORD *)&v21[4] = v15;
        *(_WORD *)&v21[12] = 2080;
        *(_QWORD *)&v21[14] = "-[AVCAnsweringMachine registerDidStopBlockWithInstance:]_block_invoke";
        *(_WORD *)&v21[22] = 1024;
        LODWORD(v22) = 169;
        WORD2(v22) = 2112;
        *(_QWORD *)((char *)&v22 + 6) = v8;
        HIWORD(v22) = 2048;
        v23 = v18;
        v12 = " [%s] %s:%d %@(%p) No message recording URL sandbox extension token to consume";
        v13 = v16;
        v14 = 48;
        goto LABEL_18;
      }
    }
LABEL_23:
    v5 = 0;
    goto LABEL_24;
  }
  objc_msgSend(v4, "UTF8String");
  v5 = sandbox_extension_consume();
LABEL_24:
  objc_msgSend(*(id *)(a1 + 48), "printDidStop:messageRecordingURL:error:", v2, v3, *(_QWORD *)(a1 + 56), *(_OWORD *)v21, *(_QWORD *)&v21[16], v22, v23);
  objc_msgSend(*(id *)(a1 + 64), "answeringMachine:didStop:messageRecordingURL:error:", *(_QWORD *)(a1 + 48), v2, v3, *(_QWORD *)(a1 + 56));
  return +[AVCAnsweringMachine cleanUpMessageRecordingURL:messageRecordingURLSandboxExtensionHandle:](AVCAnsweringMachine, "cleanUpMessageRecordingURL:messageRecordingURLSandboxExtensionHandle:", v3, v5);
}

- (void)registerServerDidDisconnectBlockWithInstance:(id)a3
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __68__AVCAnsweringMachine_registerServerDidDisconnectBlockWithInstance___block_invoke;
  v3[3] = &unk_1E9E52730;
  v3[4] = a3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcAnsweringMachineServerDidDisconnect", v3, self->_stateQueue);
}

void __68__AVCAnsweringMachine_registerServerDidDisconnectBlockWithInstance___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
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
  _QWORD v15[6];
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "strong");
    if (v3)
    {
      v4 = (void *)v3;
      if (objc_opt_class() == v3)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_14;
        v6 = VRTraceErrorLogLevelToCSTR();
        v7 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_14;
        *(_DWORD *)buf = 136315650;
        v17 = v6;
        v18 = 2080;
        v19 = "-[AVCAnsweringMachine registerServerDidDisconnectBlockWithInstance:]_block_invoke";
        v20 = 1024;
        v21 = 193;
        v8 = " [%s] %s:%d Received callback for serverDidDisconnect";
        v9 = v7;
        v10 = 28;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v5 = (const __CFString *)objc_msgSend(v4, "performSelector:", sel_logPrefix);
        else
          v5 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_14;
        v11 = VRTraceErrorLogLevelToCSTR();
        v12 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_14;
        *(_DWORD *)buf = 136316162;
        v17 = v11;
        v18 = 2080;
        v19 = "-[AVCAnsweringMachine registerServerDidDisconnectBlockWithInstance:]_block_invoke";
        v20 = 1024;
        v21 = 193;
        v22 = 2112;
        v23 = v5;
        v24 = 2048;
        v25 = v4;
        v8 = " [%s] %s:%d %@(%p) Received callback for serverDidDisconnect";
        v9 = v12;
        v10 = 48;
      }
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
LABEL_14:
      v13 = objc_msgSend(v4, "delegate");
      v14 = objc_msgSend(v4, "delegateQueue");
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __68__AVCAnsweringMachine_registerServerDidDisconnectBlockWithInstance___block_invoke_23;
      v15[3] = &unk_1E9E52238;
      v15[4] = v4;
      v15[5] = v13;
      dispatch_async(v14, v15);
      return;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __68__AVCAnsweringMachine_registerServerDidDisconnectBlockWithInstance___block_invoke_cold_1();
    }
  }
}

uint64_t __68__AVCAnsweringMachine_registerServerDidDisconnectBlockWithInstance___block_invoke_23(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCAnsweringMachine-serverDidDisconnect");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v6 = 136315906;
      v7 = v2;
      v8 = 2080;
      v9 = "-[AVCAnsweringMachine registerServerDidDisconnectBlockWithInstance:]_block_invoke";
      v10 = 1024;
      v11 = 197;
      v12 = 2048;
      v13 = v4;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCAnsweringMachine-serverDidDisconnect (%p)", (uint8_t *)&v6, 0x26u);
    }
  }
  return objc_msgSend(*(id *)(a1 + 40), "serverDidDisconnectForAnsweringMachine:", *(_QWORD *)(a1 + 32));
}

- (void)registerDidFinishAnnouncementBlockWithInstance:(id)a3
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __70__AVCAnsweringMachine_registerDidFinishAnnouncementBlockWithInstance___block_invoke;
  v3[3] = &unk_1E9E52730;
  v3[4] = a3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcAnsweringMachineDidFinishAnnouncement", v3, self->_stateQueue);
}

void __70__AVCAnsweringMachine_registerDidFinishAnnouncementBlockWithInstance___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  _QWORD v19[8];
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    v6 = objc_msgSend(*(id *)(a1 + 32), "strong");
    if (v6)
    {
      v7 = (void *)v6;
      if (objc_opt_class() == v6)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_14;
        v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_14;
        *(_DWORD *)buf = 136315650;
        v21 = v9;
        v22 = 2080;
        v23 = "-[AVCAnsweringMachine registerDidFinishAnnouncementBlockWithInstance:]_block_invoke";
        v24 = 1024;
        v25 = 218;
        v11 = " [%s] %s:%d received callback for didFinishAnnouncement";
        v12 = v10;
        v13 = 28;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v8 = (const __CFString *)objc_msgSend(v7, "performSelector:", sel_logPrefix);
        else
          v8 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_14;
        v14 = VRTraceErrorLogLevelToCSTR();
        v15 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_14;
        *(_DWORD *)buf = 136316162;
        v21 = v14;
        v22 = 2080;
        v23 = "-[AVCAnsweringMachine registerDidFinishAnnouncementBlockWithInstance:]_block_invoke";
        v24 = 1024;
        v25 = 218;
        v26 = 2112;
        v27 = v8;
        v28 = 2048;
        v29 = v7;
        v11 = " [%s] %s:%d %@(%p) received callback for didFinishAnnouncement";
        v12 = v15;
        v13 = 48;
      }
      _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
LABEL_14:
      v16 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcAnsweringMachineStatus"));
      v17 = objc_msgSend(v7, "delegate");
      v18 = objc_msgSend(v7, "delegateQueue");
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __70__AVCAnsweringMachine_registerDidFinishAnnouncementBlockWithInstance___block_invoke_25;
      v19[3] = &unk_1E9E54D20;
      v19[4] = v16;
      v19[5] = v7;
      v19[6] = a3;
      v19[7] = v17;
      dispatch_async(v18, v19);
      return;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __70__AVCAnsweringMachine_registerDidFinishAnnouncementBlockWithInstance___block_invoke_cold_1();
    }
  }
}

uint64_t __70__AVCAnsweringMachine_registerDidFinishAnnouncementBlockWithInstance___block_invoke_25(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "BOOLValue");
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCAnsweringMachine-didFinishAnnouncement");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 40);
      v6 = *(_QWORD *)(a1 + 48);
      v8 = 136316418;
      v9 = v3;
      v10 = 2080;
      v11 = "-[AVCAnsweringMachine registerDidFinishAnnouncementBlockWithInstance:]_block_invoke";
      v12 = 1024;
      v13 = 224;
      v14 = 2048;
      v15 = v5;
      v16 = 1024;
      v17 = v2;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCAnsweringMachine-didFinishAnnouncement (%p) didFinishAnnouncement=%{BOOL}d, error=%@", (uint8_t *)&v8, 0x36u);
    }
  }
  return objc_msgSend(*(id *)(a1 + 56), "answeringMachine:didFinishAnnouncement:error:", *(_QWORD *)(a1 + 40), v2, *(_QWORD *)(a1 + 48));
}

- (void)registerServerCallbacks
{
  uint64_t v3;

  v3 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
  -[AVCAnsweringMachine registerDidStartBlockWithInstance:](self, "registerDidStartBlockWithInstance:", v3);
  -[AVCAnsweringMachine registerDidStopBlockWithInstance:](self, "registerDidStopBlockWithInstance:", v3);
  -[AVCAnsweringMachine registerServerDidDisconnectBlockWithInstance:](self, "registerServerDidDisconnectBlockWithInstance:", v3);
  -[AVCAnsweringMachine registerDidFinishAnnouncementBlockWithInstance:](self, "registerDidFinishAnnouncementBlockWithInstance:", v3);
}

- (void)deregisterServerCallbacks
{
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcAnsweringMachineDidStart");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcAnsweringMachineDidStop");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcAnsweringMachineServerDidDisconnect");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcAnsweringMachineDidFinishAnnouncement");
}

- (BOOL)setUpDelegateQueue:(id)a3
{
  OS_dispatch_queue *v4;
  NSObject *CustomRootQueue;
  _BOOL4 v6;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  AVCAnsweringMachine *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = (OS_dispatch_queue *)a3;
    dispatch_retain((dispatch_object_t)a3);
LABEL_4:
    self->_delegateQueue = v4;
    LOBYTE(v6) = 1;
    return v6;
  }
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
  v4 = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.AVCAnsweringMachine.delegateQueue", 0, CustomRootQueue);
  if (v4)
    goto LABEL_4;
  if ((AVCAnsweringMachine *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v6)
        return v6;
      -[AVCAnsweringMachine setUpDelegateQueue:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = (const __CFString *)-[AVCAnsweringMachine performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v7 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v6)
        return v6;
      v11 = 136316162;
      v12 = v8;
      v13 = 2080;
      v14 = "-[AVCAnsweringMachine setUpDelegateQueue:]";
      v15 = 1024;
      v16 = 269;
      v17 = 2112;
      v18 = v7;
      v19 = 2048;
      v20 = self;
      _os_log_error_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to allocate delegateQueue", (uint8_t *)&v11, 0x30u);
    }
  }
  LOBYTE(v6) = 0;
  return v6;
}

- (BOOL)setUpServerConnection
{
  void *v3;
  uint64_t *p_configuration;
  id v5;
  __CFString *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  char *v10;
  os_log_t *v11;
  uint64_t v12;
  NSObject *v13;
  char *v14;
  os_log_t *v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  void *v19;
  __CFString *v20;
  _BOOL4 v21;
  char *v22;
  os_log_t *v23;
  uint64_t v24;
  NSObject *v25;
  char *v26;
  os_log_t *v27;
  uint64_t v28;
  NSObject *v29;
  const __CFString *v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  NSObject *v34;
  AVCAnsweringMachineConfiguration *configuration;
  char *__lasts;
  char *__str;
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  int v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  AVCAnsweringMachine *v48;
  __int16 v49;
  AVCAnsweringMachineConfiguration *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  p_configuration = (uint64_t *)&self->_configuration;
  v5 = -[AVCAnsweringMachineConfiguration dictionary](self->_configuration, "dictionary");
  if (!v5)
  {
    if ((AVCAnsweringMachine *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v31 = VRTraceErrorLogLevelToCSTR();
        v32 = *MEMORY[0x1E0CF2758];
        v21 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v21)
          return v21;
        -[AVCAnsweringMachine setUpServerConnection].cold.1(v31, p_configuration, v32);
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v30 = (const __CFString *)-[AVCAnsweringMachine performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v30 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v33 = VRTraceErrorLogLevelToCSTR();
        v34 = *MEMORY[0x1E0CF2758];
        v21 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v21)
          return v21;
        configuration = self->_configuration;
        *(_DWORD *)buf = 136316418;
        v40 = v33;
        v41 = 2080;
        v42 = "-[AVCAnsweringMachine setUpServerConnection]";
        v43 = 1024;
        v44 = 285;
        v45 = 2112;
        v46 = (const char *)v30;
        v47 = 2048;
        v48 = self;
        v49 = 2112;
        v50 = configuration;
        _os_log_error_impl(&dword_1D8A54000, v34, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to serialize configuration=%@", buf, 0x3Au);
      }
    }
    goto LABEL_52;
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("vcAnsweringMachineConfig"));
  if ((AVCAnsweringMachine *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      __str = 0;
      v7 = v3 ? (const char *)objc_msgSend((id)objc_msgSend(v3, "description"), "UTF8String") : "<nil>";
      asprintf(&__str, "serializedConfiguration=%s", v7);
      if (__str)
      {
        __lasts = 0;
        v14 = strtok_r(__str, "\n", &__lasts);
        v15 = (os_log_t *)MEMORY[0x1E0CF2758];
        do
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v16 = VRTraceErrorLogLevelToCSTR();
            v17 = *v15;
            if (os_log_type_enabled(*v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316162;
              v40 = v16;
              v41 = 2080;
              v42 = "-[AVCAnsweringMachine setUpServerConnection]";
              v43 = 1024;
              v44 = 287;
              v45 = 2080;
              v46 = "";
              v47 = 2080;
              v48 = (AVCAnsweringMachine *)v14;
              _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
            }
          }
          v14 = strtok_r(0, "\n", &__lasts);
        }
        while (v14);
        goto LABEL_27;
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = (__CFString *)-[AVCAnsweringMachine performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v6 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      __str = 0;
      v8 = (const char *)-[__CFString UTF8String](v6, "UTF8String");
      v9 = v3 ? (const char *)objc_msgSend((id)objc_msgSend(v3, "description"), "UTF8String") : "<nil>";
      asprintf(&__str, "%s(%p) serializedConfiguration=%s", v8, self, v9);
      if (__str)
      {
        __lasts = 0;
        v10 = strtok_r(__str, "\n", &__lasts);
        v11 = (os_log_t *)MEMORY[0x1E0CF2758];
        do
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v12 = VRTraceErrorLogLevelToCSTR();
            v13 = *v11;
            if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316162;
              v40 = v12;
              v41 = 2080;
              v42 = "-[AVCAnsweringMachine setUpServerConnection]";
              v43 = 1024;
              v44 = 287;
              v45 = 2080;
              v46 = "";
              v47 = 2080;
              v48 = (AVCAnsweringMachine *)v10;
              _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
            }
          }
          v10 = strtok_r(0, "\n", &__lasts);
        }
        while (v10);
LABEL_27:
        free(__str);
      }
    }
  }
  v18 = -[AVConferenceXPCClient sendMessageSync:arguments:](self->_connection, "sendMessageSync:arguments:", "vcAnsweringMachineInitialize", v3);
  v19 = v18;
  if (v18
    && (objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("ERROR"))
     || objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("TIMEOUT"))))
  {
    if ((AVCAnsweringMachine *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_52;
      __str = 0;
      asprintf(&__str, "Error initializing, results=%s", (const char *)objc_msgSend((id)objc_msgSend(v19, "description"), "UTF8String"));
      if (!__str)
        goto LABEL_52;
      __lasts = 0;
      v22 = strtok_r(__str, "\n", &__lasts);
      v23 = (os_log_t *)MEMORY[0x1E0CF2758];
      do
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v24 = VRTraceErrorLogLevelToCSTR();
          v25 = *v23;
          if (os_log_type_enabled(*v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            v40 = v24;
            v41 = 2080;
            v42 = "-[AVCAnsweringMachine setUpServerConnection]";
            v43 = 1024;
            v44 = 291;
            v45 = 2080;
            v46 = "";
            v47 = 2080;
            v48 = (AVCAnsweringMachine *)v22;
            _os_log_error_impl(&dword_1D8A54000, v25, OS_LOG_TYPE_ERROR, " [%s] %s:%d %s %s", buf, 0x30u);
          }
        }
        v22 = strtok_r(0, "\n", &__lasts);
      }
      while (v22);
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v20 = (__CFString *)-[AVCAnsweringMachine performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v20 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_52;
      __str = 0;
      asprintf(&__str, "%s(%p) Error initializing, results=%s", (const char *)-[__CFString UTF8String](v20, "UTF8String"), self, (const char *)objc_msgSend((id)objc_msgSend(v19, "description"), "UTF8String"));
      if (!__str)
        goto LABEL_52;
      __lasts = 0;
      v26 = strtok_r(__str, "\n", &__lasts);
      v27 = (os_log_t *)MEMORY[0x1E0CF2758];
      do
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v28 = VRTraceErrorLogLevelToCSTR();
          v29 = *v27;
          if (os_log_type_enabled(*v27, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            v40 = v28;
            v41 = 2080;
            v42 = "-[AVCAnsweringMachine setUpServerConnection]";
            v43 = 1024;
            v44 = 291;
            v45 = 2080;
            v46 = "";
            v47 = 2080;
            v48 = (AVCAnsweringMachine *)v26;
            _os_log_error_impl(&dword_1D8A54000, v29, OS_LOG_TYPE_ERROR, " [%s] %s:%d %s %s", buf, 0x30u);
          }
        }
        v26 = strtok_r(0, "\n", &__lasts);
      }
      while (v26);
    }
    free(__str);
LABEL_52:
    LOBYTE(v21) = 0;
    return v21;
  }
  self->_messageAudioToken = objc_msgSend((id)objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("vcAnsweringMachineMessageAudioToken")), "integerValue");
  LOBYTE(v21) = 1;
  return v21;
}

- (void)printInitConfiguration
{
  NSURL *v3;
  int v4;
  AVCAnsweringMachineConfiguration *configuration;
  const char *v6;
  AVCAnsweringMachineConfiguration *v7;
  const char *v8;
  char *v9;
  os_log_t *v10;
  uint64_t v11;
  NSObject *v12;
  char *v13;
  char *v14;
  os_log_t *v15;
  uint64_t v16;
  NSObject *v17;
  char *__lasts;
  char *__str;
  char *v20;
  double v21;
  double v22;
  char *v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = -[AVCAnsweringMachineConfiguration announcementAsset](self->_configuration, "announcementAsset");
  if (v3)
  {
    v20 = (char *)0xAAAAAAAAAAAAAAAALL;
    v21 = NAN;
    v22 = NAN;
    +[VCFileUtil statsOfFile:](VCFileUtil, "statsOfFile:", v3);
    v23 = 0;
    v4 = VCUtil_BinaryPrefix(0xAAAAAAAAAAAAAAAALL, (double *)&v23);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      __str = 0;
      configuration = self->_configuration;
      v6 = configuration
         ? (const char *)objc_msgSend(-[AVCAnsweringMachineConfiguration description](configuration, "description"), "UTF8String"): "<nil>";
      asprintf(&__str, "configuration=%s assetSize=%.2f%cB assetLength=%.2fs, assetAudioLength=%.2fs", v6, *(double *)&v23, v4, v21, v22);
      if (__str)
      {
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
              v25 = v11;
              v26 = 2080;
              v27 = "-[AVCAnsweringMachine printInitConfiguration]";
              v28 = 1024;
              v29 = 311;
              v30 = 2080;
              v31 = "AVCAnsweringMachine-init";
              v32 = 2080;
              v33 = v9;
              _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
            }
          }
          v9 = strtok_r(0, "\n", &__lasts);
        }
        while (v9);
        v13 = __str;
LABEL_24:
        free(v13);
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v20 = 0;
    v7 = self->_configuration;
    v8 = v7
       ? (const char *)objc_msgSend(-[AVCAnsweringMachineConfiguration description](v7, "description"), "UTF8String")
       : "<nil>";
    asprintf(&v20, "configuration=%s", v8);
    if (v20)
    {
      v23 = 0;
      v14 = strtok_r(v20, "\n", &v23);
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
            v25 = v16;
            v26 = 2080;
            v27 = "-[AVCAnsweringMachine printInitConfiguration]";
            v28 = 1024;
            v29 = 305;
            v30 = 2080;
            v31 = "AVCAnsweringMachine-init";
            v32 = 2080;
            v33 = v14;
            _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
          }
        }
        v14 = strtok_r(0, "\n", &v23);
      }
      while (v14);
      v13 = v20;
      goto LABEL_24;
    }
  }
}

- (AVCAnsweringMachine)initWithConfiguration:(id)a3 delegate:(id)a4 delegateQueue:(id)a5
{
  AVCAnsweringMachine *v5;
  AVCAnsweringMachine *v9;
  AVConferenceXPCClient *v10;
  NSObject *CustomRootQueue;
  dispatch_queue_t v12;
  uint64_t v13;
  NSObject *v14;
  int64_t messageAudioToken;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  objc_super v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  AVCAnsweringMachine *v39;
  uint64_t v40;

  v5 = self;
  v40 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    if ((AVCAnsweringMachine *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCAnsweringMachine initWithConfiguration:delegate:delegateQueue:].cold.1();
      }
      goto LABEL_60;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v16 = (const __CFString *)-[AVCAnsweringMachine performSelector:](v5, "performSelector:", sel_logPrefix);
    else
      v16 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_60;
    v20 = VRTraceErrorLogLevelToCSTR();
    v21 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_60;
    *(_DWORD *)buf = 136316162;
    v31 = v20;
    v32 = 2080;
    v33 = "-[AVCAnsweringMachine initWithConfiguration:delegate:delegateQueue:]";
    v34 = 1024;
    v35 = 316;
    v36 = 2112;
    v37 = (void *)v16;
    v38 = 2048;
    v39 = v5;
    v22 = " [%s] %s:%d %@(%p) nil configuration passed";
    goto LABEL_66;
  }
  if (!a4)
  {
    if ((AVCAnsweringMachine *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCAnsweringMachine initWithConfiguration:delegate:delegateQueue:].cold.2();
      }
      goto LABEL_60;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v17 = (const __CFString *)-[AVCAnsweringMachine performSelector:](v5, "performSelector:", sel_logPrefix);
    else
      v17 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_60;
    v23 = VRTraceErrorLogLevelToCSTR();
    v21 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_60;
    *(_DWORD *)buf = 136316162;
    v31 = v23;
    v32 = 2080;
    v33 = "-[AVCAnsweringMachine initWithConfiguration:delegate:delegateQueue:]";
    v34 = 1024;
    v35 = 317;
    v36 = 2112;
    v37 = (void *)v17;
    v38 = 2048;
    v39 = v5;
    v22 = " [%s] %s:%d %@(%p) nil delegate passed";
    goto LABEL_66;
  }
  v29.receiver = self;
  v29.super_class = (Class)AVCAnsweringMachine;
  v9 = -[AVCAnsweringMachine init](&v29, sel_init);
  if (!v9)
  {
    if (objc_opt_class())
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(0, "performSelector:", sel_logPrefix);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCAnsweringMachine initWithConfiguration:delegate:delegateQueue:].cold.4();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCAnsweringMachine initWithConfiguration:delegate:delegateQueue:].cold.3();
    }
    v5 = 0;
    goto LABEL_60;
  }
  v5 = v9;
  v9->_configuration = (AVCAnsweringMachineConfiguration *)objc_msgSend(a3, "copy");
  -[AVCAnsweringMachine printInitConfiguration](v5, "printInitConfiguration");
  v10 = objc_alloc_init(AVConferenceXPCClient);
  v5->_connection = v10;
  if (!v10)
  {
    if ((AVCAnsweringMachine *)objc_opt_class() == v5)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCAnsweringMachine initWithConfiguration:delegate:delegateQueue:].cold.5();
      }
      goto LABEL_60;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v18 = (const __CFString *)-[AVCAnsweringMachine performSelector:](v5, "performSelector:", sel_logPrefix);
    else
      v18 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_60;
    v24 = VRTraceErrorLogLevelToCSTR();
    v21 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_60;
    *(_DWORD *)buf = 136316162;
    v31 = v24;
    v32 = 2080;
    v33 = "-[AVCAnsweringMachine initWithConfiguration:delegate:delegateQueue:]";
    v34 = 1024;
    v35 = 323;
    v36 = 2112;
    v37 = (void *)v18;
    v38 = 2048;
    v39 = v5;
    v22 = " [%s] %s:%d %@(%p) Failed to allocate xpc client";
LABEL_66:
    _os_log_error_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_ERROR, v22, buf, 0x30u);
    goto LABEL_60;
  }
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
  v12 = dispatch_queue_create_with_target_V2("com.apple.AVConference.AVCAnsweringMachine.stateQueue", 0, CustomRootQueue);
  v5->_stateQueue = (OS_dispatch_queue *)v12;
  if (v12)
  {
    objc_storeWeak((id *)&v5->_delegate, a4);
    if (-[AVCAnsweringMachine setUpDelegateQueue:](v5, "setUpDelegateQueue:", a5))
    {
      -[AVCAnsweringMachine registerServerCallbacks](v5, "registerServerCallbacks");
      if (-[AVCAnsweringMachine setUpServerConnection](v5, "setUpServerConnection"))
      {
        MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCAnsweringMachine-init");
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          v13 = VRTraceErrorLogLevelToCSTR();
          v14 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            messageAudioToken = v5->_messageAudioToken;
            *(_DWORD *)buf = 136316162;
            v31 = v13;
            v32 = 2080;
            v33 = "-[AVCAnsweringMachine initWithConfiguration:delegate:delegateQueue:]";
            v34 = 1024;
            v35 = 340;
            v36 = 2048;
            v37 = v5;
            v38 = 2048;
            v39 = (AVCAnsweringMachine *)messageAudioToken;
            _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCAnsweringMachine-init (%p) messageAudioToken=%ld", buf, 0x30u);
          }
        }
        return v5;
      }
    }
    goto LABEL_60;
  }
  if ((AVCAnsweringMachine *)objc_opt_class() == v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCAnsweringMachine initWithConfiguration:delegate:delegateQueue:].cold.6();
    }
    goto LABEL_60;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v19 = (const __CFString *)-[AVCAnsweringMachine performSelector:](v5, "performSelector:", sel_logPrefix);
  else
    v19 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v25 = VRTraceErrorLogLevelToCSTR();
    v21 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v31 = v25;
      v32 = 2080;
      v33 = "-[AVCAnsweringMachine initWithConfiguration:delegate:delegateQueue:]";
      v34 = 1024;
      v35 = 326;
      v36 = 2112;
      v37 = (void *)v19;
      v38 = 2048;
      v39 = v5;
      v22 = " [%s] %s:%d %@(%p) Failed to allocate stateQueue";
      goto LABEL_66;
    }
  }
LABEL_60:
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCAnsweringMachine-init");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v26 = VRTraceErrorLogLevelToCSTR();
    v27 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v31 = v26;
      v32 = 2080;
      v33 = "-[AVCAnsweringMachine initWithConfiguration:delegate:delegateQueue:]";
      v34 = 1024;
      v35 = 336;
      v36 = 2048;
      v37 = v5;
      _os_log_impl(&dword_1D8A54000, v27, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCAnsweringMachine-init (%p)", buf, 0x26u);
    }
  }

  return 0;
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
  NSObject *delegateQueue;
  NSObject *stateQueue;
  uint64_t v13;
  NSObject *v14;
  objc_super v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  AVCAnsweringMachine *v23;
  __int16 v24;
  AVCAnsweringMachine *v25;
  __int16 v26;
  AVCAnsweringMachine *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if ((AVCAnsweringMachine *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v17 = v4;
        v18 = 2080;
        v19 = "-[AVCAnsweringMachine dealloc]";
        v20 = 1024;
        v21 = 345;
        v22 = 2112;
        v23 = self;
        v6 = " [%s] %s:%d self=%@";
        v7 = v5;
        v8 = 38;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)-[AVCAnsweringMachine performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v17 = v9;
        v18 = 2080;
        v19 = "-[AVCAnsweringMachine dealloc]";
        v20 = 1024;
        v21 = 345;
        v22 = 2112;
        v23 = (AVCAnsweringMachine *)v3;
        v24 = 2048;
        v25 = self;
        v26 = 2112;
        v27 = self;
        v6 = " [%s] %s:%d %@(%p) self=%@";
        v7 = v10;
        v8 = 58;
        goto LABEL_11;
      }
    }
  }
  -[AVCAnsweringMachine deregisterServerCallbacks](self, "deregisterServerCallbacks");
  -[AVConferenceXPCClient sendMessageSync:](self->_connection, "sendMessageSync:", "vcAnsweringMachineTerminate");

  objc_storeWeak((id *)&self->_delegate, 0);
  delegateQueue = self->_delegateQueue;
  if (delegateQueue)
  {
    dispatch_release(delegateQueue);
    self->_delegateQueue = 0;
  }
  stateQueue = self->_stateQueue;
  if (stateQueue)
  {
    dispatch_release(stateQueue);
    self->_stateQueue = 0;
  }

  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCAnsweringMachine-dealloc");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v17 = v13;
      v18 = 2080;
      v19 = "-[AVCAnsweringMachine dealloc]";
      v20 = 1024;
      v21 = 356;
      v22 = 2048;
      v23 = self;
      _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCAnsweringMachine-dealloc (%p)", buf, 0x26u);
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)AVCAnsweringMachine;
  -[AVCAnsweringMachine dealloc](&v15, sel_dealloc);
}

- (void)start
{
  NSObject *stateQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  stateQueue = self->_stateQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __28__AVCAnsweringMachine_start__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(stateQueue, v3);
}

void __28__AVCAnsweringMachine_start__block_invoke(uint64_t a1)
{
  const __CFString *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  _BYTE v15[24];
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (objc_opt_class() != *(_QWORD *)(a1 + 32))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v2 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v2 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 6)
      goto LABEL_12;
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    v11 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)v15 = 136316418;
    *(_QWORD *)&v15[4] = v9;
    *(_WORD *)&v15[12] = 2080;
    *(_QWORD *)&v15[14] = "-[AVCAnsweringMachine start]_block_invoke";
    *(_WORD *)&v15[22] = 1024;
    LODWORD(v16) = 364;
    WORD2(v16) = 2112;
    *(_QWORD *)((char *)&v16 + 6) = v2;
    HIWORD(v16) = 2048;
    v17 = v11;
    LOWORD(v18) = 2112;
    *(_QWORD *)((char *)&v18 + 2) = v11;
    v6 = " [%s] %s:%d %@(%p) self=%@";
    v7 = v10;
    v8 = 58;
    goto LABEL_11;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)v15 = 136315906;
      *(_QWORD *)&v15[4] = v3;
      *(_WORD *)&v15[12] = 2080;
      *(_QWORD *)&v15[14] = "-[AVCAnsweringMachine start]_block_invoke";
      *(_WORD *)&v15[22] = 1024;
      LODWORD(v16) = 364;
      WORD2(v16) = 2112;
      *(_QWORD *)((char *)&v16 + 6) = v5;
      v6 = " [%s] %s:%d self=%@";
      v7 = v4;
      v8 = 38;
LABEL_11:
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, v15, v8);
    }
  }
LABEL_12:
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "sendMessageAsync:", "vcAnsweringMachineStart", *(_OWORD *)v15, *(_QWORD *)&v15[16], v16, v17, v18);
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCAnsweringMachine-start");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)v15 = 136315906;
      *(_QWORD *)&v15[4] = v12;
      *(_WORD *)&v15[12] = 2080;
      *(_QWORD *)&v15[14] = "-[AVCAnsweringMachine start]_block_invoke";
      *(_WORD *)&v15[22] = 1024;
      LODWORD(v16) = 366;
      WORD2(v16) = 2048;
      *(_QWORD *)((char *)&v16 + 6) = v14;
      _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCAnsweringMachine-start (%p)", v15, 0x26u);
    }
  }
}

- (void)stop
{
  NSObject *stateQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  stateQueue = self->_stateQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __27__AVCAnsweringMachine_stop__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(stateQueue, v3);
}

void __27__AVCAnsweringMachine_stop__block_invoke(uint64_t a1)
{
  const __CFString *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  _BYTE v15[24];
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (objc_opt_class() != *(_QWORD *)(a1 + 32))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v2 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v2 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 6)
      goto LABEL_12;
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    v11 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)v15 = 136316418;
    *(_QWORD *)&v15[4] = v9;
    *(_WORD *)&v15[12] = 2080;
    *(_QWORD *)&v15[14] = "-[AVCAnsweringMachine stop]_block_invoke";
    *(_WORD *)&v15[22] = 1024;
    LODWORD(v16) = 372;
    WORD2(v16) = 2112;
    *(_QWORD *)((char *)&v16 + 6) = v2;
    HIWORD(v16) = 2048;
    v17 = v11;
    LOWORD(v18) = 2112;
    *(_QWORD *)((char *)&v18 + 2) = v11;
    v6 = " [%s] %s:%d %@(%p) self=%@";
    v7 = v10;
    v8 = 58;
    goto LABEL_11;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)v15 = 136315906;
      *(_QWORD *)&v15[4] = v3;
      *(_WORD *)&v15[12] = 2080;
      *(_QWORD *)&v15[14] = "-[AVCAnsweringMachine stop]_block_invoke";
      *(_WORD *)&v15[22] = 1024;
      LODWORD(v16) = 372;
      WORD2(v16) = 2112;
      *(_QWORD *)((char *)&v16 + 6) = v5;
      v6 = " [%s] %s:%d self=%@";
      v7 = v4;
      v8 = 38;
LABEL_11:
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, v15, v8);
    }
  }
LABEL_12:
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "sendMessageAsync:", "vcAnsweringMachineStop", *(_OWORD *)v15, *(_QWORD *)&v15[16], v16, v17, v18);
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCAnsweringMachine-stop");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)v15 = 136315906;
      *(_QWORD *)&v15[4] = v12;
      *(_WORD *)&v15[12] = 2080;
      *(_QWORD *)&v15[14] = "-[AVCAnsweringMachine stop]_block_invoke";
      *(_WORD *)&v15[22] = 1024;
      LODWORD(v16) = 374;
      WORD2(v16) = 2048;
      *(_QWORD *)((char *)&v16 + 6) = v14;
      _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCAnsweringMachine-stop (%p)", v15, 0x26u);
    }
  }
}

- (int64_t)messageAudioToken
{
  return self->_messageAudioToken;
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

void __57__AVCAnsweringMachine_registerDidStartBlockWithInstance___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to fetch non-nil strongSelf", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __56__AVCAnsweringMachine_registerDidStopBlockWithInstance___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to fetch non-nil strongSelf", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __56__AVCAnsweringMachine_registerDidStopBlockWithInstance___block_invoke_16_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d No message recording URL sandbox extension token to consume", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __68__AVCAnsweringMachine_registerServerDidDisconnectBlockWithInstance___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to fetch non-nil strongSelf", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __70__AVCAnsweringMachine_registerDidFinishAnnouncementBlockWithInstance___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to fetch non-nil strongSelf", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setUpDelegateQueue:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate delegateQueue", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setUpServerConnection
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = *a2;
  v4 = 136315906;
  v5 = a1;
  v6 = 2080;
  v7 = "-[AVCAnsweringMachine setUpServerConnection]";
  v8 = 1024;
  v9 = 285;
  v10 = 2112;
  v11 = v3;
  _os_log_error_impl(&dword_1D8A54000, log, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to serialize configuration=%@", (uint8_t *)&v4, 0x26u);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfiguration:delegate:delegateQueue:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d nil configuration passed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfiguration:delegate:delegateQueue:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d nil delegate passed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfiguration:delegate:delegateQueue:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_9();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate super instance", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfiguration:delegate:delegateQueue:.cold.4()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[28];
  __int16 v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_9();
  v3 = 2112;
  v4 = v0;
  v5 = 2048;
  v6 = 0;
  _os_log_error_impl(&dword_1D8A54000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to allocate super instance", v2, 0x30u);
}

- (void)initWithConfiguration:delegate:delegateQueue:.cold.5()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate xpc client", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfiguration:delegate:delegateQueue:.cold.6()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate stateQueue", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
