@implementation AVCQoSMonitor

- (AVCQoSMonitor)initWithStreamToken:(int64_t)a3 queue:(id)a4 error:(id *)a5
{
  uint64_t v9;
  NSObject *v10;
  id v11;
  const __CFString *v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  uint64_t v18;
  NSObject *v19;
  AVCQoSMonitor *v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  objc_super v29;
  const __CFString *v30;
  uint64_t v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  int64_t v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v11 = *a5;
      *(_DWORD *)buf = 136316418;
      v33 = v9;
      v34 = 2080;
      v35 = "-[AVCQoSMonitor initWithStreamToken:queue:error:]";
      v36 = 1024;
      v37 = 48;
      v38 = 2048;
      v39 = a3;
      v40 = 2112;
      v41 = a4;
      v42 = 2112;
      v43 = v11;
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d streamToken=%ld, queue=%@, error=%@", buf, 0x3Au);
    }
  }
  if ((AVCQoSMonitor *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v33 = v13;
        v34 = 2080;
        v35 = "-[AVCQoSMonitor initWithStreamToken:queue:error:]";
        v36 = 1024;
        v37 = 49;
        v38 = 1024;
        LODWORD(v39) = a3;
        v15 = " [%s] %s:%d streamToken[%u]";
        v16 = v14;
        v17 = 34;
LABEL_14:
        _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v12 = (const __CFString *)-[AVCQoSMonitor performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v12 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v18 = VRTraceErrorLogLevelToCSTR();
      v19 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v33 = v18;
        v34 = 2080;
        v35 = "-[AVCQoSMonitor initWithStreamToken:queue:error:]";
        v36 = 1024;
        v37 = 49;
        v38 = 2112;
        v39 = (int64_t)v12;
        v40 = 2048;
        v41 = self;
        v42 = 1024;
        LODWORD(v43) = a3;
        v15 = " [%s] %s:%d %@(%p) streamToken[%u]";
        v16 = v19;
        v17 = 54;
        goto LABEL_14;
      }
    }
  }
  v29.receiver = self;
  v29.super_class = (Class)AVCQoSMonitor;
  v20 = -[AVCQoSMonitor init](&v29, sel_init);
  if (v20)
  {
    v20->_connection = objc_alloc_init(AVConferenceXPCClient);
    v30 = CFSTR("conferenceCallID");
    v31 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v21 = -[AVConferenceXPCClient sendMessageSync:arguments:](v20->_connection, "sendMessageSync:arguments:", "vcQosMonitorInitializForStreamToken", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1));
    if (v21)
    {
      v22 = (void *)v21;
      v23 = objc_alloc(MEMORY[0x1E0C99DE8]);
      v20->_registeredStreamTokens = (NSMutableArray *)objc_msgSend(v23, "initWithObjects:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3), 0);
      v24 = objc_alloc(MEMORY[0x1E0C99E08]);
      v25 = objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("vcQoSReportingInterval"));
      v20->_reportingIntervals = (NSMutableDictionary *)objc_msgSend(v24, "initWithObjectsAndKeys:", v25, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3), 0);
      -[AVCQoSMonitor registerBlocksForNotifications](v20, "registerBlocksForNotifications");
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v26 = VRTraceErrorLogLevelToCSTR();
        v27 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          v33 = v26;
          v34 = 2080;
          v35 = "-[AVCQoSMonitor initWithStreamToken:queue:error:]";
          v36 = 1024;
          v37 = 62;
          v38 = 1024;
          LODWORD(v39) = a3;
          _os_log_impl(&dword_1D8A54000, v27, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d sucess streamToken=%u", buf, 0x22u);
        }
      }
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCQoSMonitor initWithStreamToken:queue:error:].cold.1();
      }
      -[AVCQoSMonitor generateInvalidStreamTokenWithError:](v20, "generateInvalidStreamTokenWithError:", a5);

      return 0;
    }
  }
  return v20;
}

- (void)dealloc
{
  uint64_t v3;
  NSObject *v4;
  NSObject *stateQueue;
  objc_super v6;
  uint8_t buf[4];
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v8 = v3;
      v9 = 2080;
      v10 = "-[AVCQoSMonitor dealloc]";
      v11 = 1024;
      v12 = 79;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ", buf, 0x1Cu);
    }
  }
  objc_storeWeak((id *)&self->_delegate, 0);

  -[AVCQoSMonitor terminateConnection](self, "terminateConnection");
  stateQueue = self->_stateQueue;
  if (stateQueue)
  {
    dispatch_release(stateQueue);
    self->_stateQueue = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)AVCQoSMonitor;
  -[AVCQoSMonitor dealloc](&v6, sel_dealloc);
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
      v10 = "-[AVCQoSMonitor setDelegate:]";
      v11 = 1024;
      v12 = 90;
      v13 = 2112;
      v14 = a3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d delegate=%@", (uint8_t *)&v7, 0x26u);
    }
  }
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AVCQoSMonitorDelegate)delegate
{
  return (AVCQoSMonitorDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void)requestQoSReport
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d NOT YET IMPLEMENTED", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (id)registerStreamToken:(int64_t)a3
{
  uint64_t v5;
  NSObject *v6;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  _BYTE buf[12];
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int64_t v27;
  __int16 v28;
  AVCQoSMonitor *v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = v5;
      v22 = 2080;
      v23 = "-[AVCQoSMonitor registerStreamToken:]";
      v24 = 1024;
      v25 = 103;
      v26 = 2048;
      v27 = a3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d streamToken=%ld", buf, 0x26u);
    }
  }
  if ((AVCQoSMonitor *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = v8;
        v22 = 2080;
        v23 = "-[AVCQoSMonitor registerStreamToken:]";
        v24 = 1024;
        v25 = 104;
        v26 = 1024;
        LODWORD(v27) = a3;
        v10 = " [%s] %s:%d streamToken[%u]";
        v11 = v9;
        v12 = 34;
LABEL_14:
        _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = (const __CFString *)-[AVCQoSMonitor performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v7 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        *(_QWORD *)&buf[4] = v13;
        v22 = 2080;
        v23 = "-[AVCQoSMonitor registerStreamToken:]";
        v24 = 1024;
        v25 = 104;
        v26 = 2112;
        v27 = (int64_t)v7;
        v28 = 2048;
        v29 = self;
        v30 = 1024;
        v31 = a3;
        v10 = " [%s] %s:%d %@(%p) streamToken[%u]";
        v11 = v14;
        v12 = 54;
        goto LABEL_14;
      }
    }
  }
  *(_QWORD *)buf = 0;
  v20 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3, CFSTR("conferenceCallID"));
  v15 = -[AVConferenceXPCClient sendMessageSync:arguments:](self->_connection, "sendMessageSync:arguments:", "vcQosMonitorRegisterStreamToken", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
  if (v15)
  {
    v16 = v15;
    -[NSMutableArray addObject:](self->_registeredStreamTokens, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3));
    v17 = objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("vcQoSReportingInterval"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_reportingIntervals, "setObject:forKeyedSubscript:", v17, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3));
    return 0;
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCQoSMonitor registerStreamToken:].cold.1();
    }
    -[AVCQoSMonitor generateInvalidStreamTokenWithError:](self, "generateInvalidStreamTokenWithError:", buf);
    return *(id *)buf;
  }
}

- (int64_t)reportingIntervalForStreamToken:(int64_t)a3
{
  uint64_t v5;
  NSObject *v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315906;
      v9 = v5;
      v10 = 2080;
      v11 = "-[AVCQoSMonitor reportingIntervalForStreamToken:]";
      v12 = 1024;
      v13 = 124;
      v14 = 2048;
      v15 = a3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d streamToken=%ld", (uint8_t *)&v8, 0x26u);
    }
  }
  return objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_reportingIntervals, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3)), "integerValue");
}

- (void)terminateConnection
{
  -[AVCQoSMonitor deregisterBlocksForNotifications](self, "deregisterBlocksForNotifications");
  -[AVConferenceXPCClient sendMessageSync:](self->_connection, "sendMessageSync:", "vcQosMonitorTerminate");

  self->_connection = 0;
}

- (void)deregisterBlocksForNotifications
{
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "conferenceDidServerDie");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcQoSMonitorCallbackDidReceiveReport");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcQoSMonitorCallbackDidReceiveReportEventDrivenKey");
}

- (void)registerBlocksForNotifications
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[6];
  _QWORD v6[5];
  _QWORD v7[6];

  v7[5] = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
  v4 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__AVCQoSMonitor_registerBlocksForNotifications__block_invoke;
  v7[3] = &unk_1E9E52730;
  v7[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "conferenceDidServerDie", v7, self->_stateQueue);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __47__AVCQoSMonitor_registerBlocksForNotifications__block_invoke_42;
  v6[3] = &unk_1E9E52730;
  v6[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcQoSMonitorCallbackDidReceiveReport", v6, self->_stateQueue);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __47__AVCQoSMonitor_registerBlocksForNotifications__block_invoke_47;
  v5[3] = &unk_1E9E56AA8;
  v5[4] = v3;
  v5[5] = self;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcQoSMonitorCallbackDidReceiveReportEventDrivenKey", v5, self->_stateQueue);
}

void __47__AVCQoSMonitor_registerBlocksForNotifications__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int ErrorLogLevelForModule;

  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
    ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (v3)
    {
      if (ErrorLogLevelForModule >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __47__AVCQoSMonitor_registerBlocksForNotifications__block_invoke_cold_2();
      }
      objc_msgSend((id)objc_msgSend(v3, "delegate"), "qosMonitorServerDidDie:", v3);
    }
    else if (ErrorLogLevelForModule >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __47__AVCQoSMonitor_registerBlocksForNotifications__block_invoke_cold_1();
    }
  }
}

void __47__AVCQoSMonitor_registerBlocksForNotifications__block_invoke_42(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    if (a3)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __47__AVCQoSMonitor_registerBlocksForNotifications__block_invoke_42_cold_1();
      }
    }
    else
    {
      v6 = objc_msgSend(*(id *)(a1 + 32), "strong");
      if (v6)
      {
        v7 = (void *)v6;
        v8 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcQoSReportDictionary"));
        v9 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcQoSReportToken")), "unsignedIntegerValue");
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          v10 = VRTraceErrorLogLevelToCSTR();
          v11 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v14 = 136315906;
            v15 = v10;
            v16 = 2080;
            v17 = "-[AVCQoSMonitor registerBlocksForNotifications]_block_invoke";
            v18 = 1024;
            v19 = 179;
            v20 = 1024;
            v21 = v9;
            _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCQoSMonitor callback: qosMonitor:didReceiveReport for streamToken=%u", (uint8_t *)&v14, 0x22u);
          }
        }
        objc_msgSend((id)objc_msgSend(v7, "delegate"), "qosMonitor:didReceiveReport:streamToken:", v7, v8, v9);
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v12 = VRTraceErrorLogLevelToCSTR();
        v13 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v14 = 136315650;
          v15 = v12;
          v16 = 2080;
          v17 = "-[AVCQoSMonitor registerBlocksForNotifications]_block_invoke";
          v18 = 1024;
          v19 = 173;
          _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCQoSMonitor: strongSelf is nil", (uint8_t *)&v14, 0x1Cu);
        }
      }
    }
  }
}

void __47__AVCQoSMonitor_registerBlocksForNotifications__block_invoke_47(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    if (a3)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __47__AVCQoSMonitor_registerBlocksForNotifications__block_invoke_47_cold_1();
      }
    }
    else
    {
      v6 = objc_msgSend(*(id *)(a1 + 32), "strong");
      if (v6)
      {
        v7 = (void *)v6;
        v8 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcQoSReportDictionary"));
        v9 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcQoSReportToken")), "unsignedIntegerValue");
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          v10 = VRTraceErrorLogLevelToCSTR();
          v11 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v14 = 136315906;
            v15 = v10;
            v16 = 2080;
            v17 = "-[AVCQoSMonitor registerBlocksForNotifications]_block_invoke";
            v18 = 1024;
            v19 = 199;
            v20 = 1024;
            v21 = v9;
            _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCQoSMonitor callback: qosMonitor:didReceiveEventDrivenReport for streamToken=%u", (uint8_t *)&v14, 0x22u);
          }
        }
        objc_msgSend(*(id *)(a1 + 40), "delegate");
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend((id)objc_msgSend(v7, "delegate"), "qosMonitor:didReceiveEventDrivenReport:streamToken:", v7, v8, v9);
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v12 = VRTraceErrorLogLevelToCSTR();
        v13 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v14 = 136315650;
          v15 = v12;
          v16 = 2080;
          v17 = "-[AVCQoSMonitor registerBlocksForNotifications]_block_invoke";
          v18 = 1024;
          v19 = 193;
          _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCQoSMonitor: strongSelf is nil", (uint8_t *)&v14, 0x1Cu);
        }
      }
    }
  }
}

- (BOOL)generateInvalidStreamTokenWithError:(id *)a3
{
  return +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a3, 32016, 0, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/AVCQoSMonitor.m", 214), CFSTR("Could not register QoS Monitor"), CFSTR("Invalid Stream Token"));
}

- (NSArray)streamTokens
{
  return &self->_registeredStreamTokens->super;
}

- (void)initWithStreamToken:queue:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[AVCQoSMonitor initWithStreamToken:queue:error:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d ERROR medais stream for streamToken=%u doesn't exist", v2, *(const char **)v3, (unint64_t)"-[AVCQoSMonitor initWithStreamToken:queue:error:]" >> 16, 64);
  OUTLINED_FUNCTION_3();
}

- (void)registerStreamToken:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[AVCQoSMonitor registerStreamToken:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d ERROR medais stream for streamToken=%u doesn't exist", v2, *(const char **)v3, (unint64_t)"-[AVCQoSMonitor registerStreamToken:]" >> 16, 110);
  OUTLINED_FUNCTION_3();
}

void __47__AVCQoSMonitor_registerBlocksForNotifications__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d AVCQoSMonitor: server died", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __47__AVCQoSMonitor_registerBlocksForNotifications__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d AVCQoSMonitor: serverd died, notifying client", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __47__AVCQoSMonitor_registerBlocksForNotifications__block_invoke_42_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d AVCQoSMonitor callback: qosMonitor:didReceiveReport error=%@");
  OUTLINED_FUNCTION_3();
}

void __47__AVCQoSMonitor_registerBlocksForNotifications__block_invoke_47_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d AVCQoSMonitor callback: qosMonitor:didReceiveEventDrivenReport error=%@");
  OUTLINED_FUNCTION_3();
}

@end
