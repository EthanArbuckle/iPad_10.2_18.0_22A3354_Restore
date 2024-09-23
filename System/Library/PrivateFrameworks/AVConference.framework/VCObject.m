@implementation VCObject

- (VCObject)init
{
  VCObject *v2;
  VCObject *v3;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)VCObject;
  v2 = -[VCObject init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    pthread_mutex_init(&v2->_mutex, 0);
    pthread_mutex_init(&v3->_timeoutMutex, 0);
    v3->_logPrefix = (NSString *)objc_alloc_init(MEMORY[0x1E0CB3940]);
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[VCObject stopTerminationTimer](self, "stopTerminationTimer");

  FigCFWeakReferenceStore();
  pthread_mutex_destroy(&self->_mutex);
  pthread_mutex_destroy(&self->_timeoutMutex);
  v3.receiver = self;
  v3.super_class = (Class)VCObject;
  -[VCObject dealloc](&v3, sel_dealloc);
}

- (void)lock
{
  pthread_mutex_lock(&self->_mutex);
}

- (void)unlock
{
  pthread_mutex_unlock(&self->_mutex);
}

- (opaqueRTCReporting)reportingAgent
{
  return (opaqueRTCReporting *)self->_reportingAgent;
}

- (void)setReportingAgent:(opaqueRTCReporting *)a3
{
  opaqueRTCReporting *v4;

  self->_reportingAgent = a3;
  v4 = a3;
}

- (void)startDeallocTimer
{
  -[VCObject startDeallocTimerWithTimeout:](self, "startDeallocTimerWithTimeout:", 10);
}

- (void)startDeallocTimerWithTimeout:(unsigned int)a3
{
  -[VCObject startTerminationTimer:terminationType:](self, "startTerminationTimer:terminationType:", *(_QWORD *)&a3, 2);
}

- (void)startTimeoutTimer
{
  -[VCObject startTerminationTimer:terminationType:](self, "startTerminationTimer:terminationType:", 10, 1);
}

- (void)startTerminationTimer:(unsigned int)a3 terminationType:(int)a4
{
  uint64_t v5;
  objc_class *v7;
  NSString *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  _opaque_pthread_mutex_t *p_timeoutMutex;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  VCDispatchTimer *v17;
  VCDispatchTimer *v18;
  _QWORD v19[8];
  int v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v5 = *(_QWORD *)&a3;
  v29 = *MEMORY[0x1E0C80C00];
  if (!VCDefaults_GetBoolValueForKey(CFSTR("skipTerminationTimer"), 0))
  {
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@(%p) Timeout=%d"), v8, self, v5);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v22 = v10;
        v23 = 2080;
        v24 = "-[VCObject startTerminationTimer:terminationType:]";
        v25 = 1024;
        v26 = 112;
        v27 = 2112;
        v28 = v9;
        _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %@. Starting timer", buf, 0x26u);
      }
    }
    p_timeoutMutex = &self->_timeoutMutex;
    pthread_mutex_lock(&self->_timeoutMutex);
    if (self->_timeoutTimer)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v13 = VRTraceErrorLogLevelToCSTR();
        v14 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCObject startTerminationTimer:terminationType:].cold.1(v13, v9, v14);
      }
    }
    else
    {
      v15 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self->_reportingAgent);
      v16 = objc_opt_class();
      v17 = [VCDispatchTimer alloc];
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __50__VCObject_startTerminationTimer_terminationType___block_invoke;
      v19[3] = &unk_1E9E58BC8;
      v20 = a4;
      v19[4] = v9;
      v19[5] = v15;
      v19[6] = v16;
      v19[7] = v8;
      v18 = -[VCDispatchTimer initWithIntervalSeconds:callbackBlock:](v17, "initWithIntervalSeconds:callbackBlock:", v5, v19);
      self->_timeoutTimer = v18;
      -[VCDispatchTimer start](v18, "start");
    }
    pthread_mutex_unlock(p_timeoutMutex);
  }
}

uint64_t __50__VCObject_startTerminationTimer_terminationType___block_invoke(uint64_t a1)
{
  if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
  {
    VRTraceErrorLogLevelToCSTR();
    if ((VRTraceIsOSFaultDisabled() & 1) != 0)
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __50__VCObject_startTerminationTimer_terminationType___block_invoke_cold_1();
    }
    else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
    {
      __50__VCObject_startTerminationTimer_terminationType___block_invoke_cold_2();
    }
  }
  return objc_msgSend(*(id *)(a1 + 48), "terminateProcess:terminateSource:agent:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Termination Timeout - %@ type=%d"), *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 64)), *(_QWORD *)(a1 + 56), objc_msgSend(*(id *)(a1 + 40), "strong"));
}

- (void)stopTerminationTimer
{
  _opaque_pthread_mutex_t *p_timeoutMutex;
  uint64_t v4;
  NSObject *v5;
  objc_class *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  NSString *v14;
  __int16 v15;
  VCObject *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  p_timeoutMutex = &self->_timeoutMutex;
  pthread_mutex_lock(&self->_timeoutMutex);
  if (self->_timeoutTimer)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v6 = (objc_class *)objc_opt_class();
        v7 = 136316162;
        v8 = v4;
        v9 = 2080;
        v10 = "-[VCObject stopTerminationTimer]";
        v11 = 1024;
        v12 = 136;
        v13 = 2112;
        v14 = NSStringFromClass(v6);
        v15 = 2048;
        v16 = self;
        _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %@(%p). Stopping timer", (uint8_t *)&v7, 0x30u);
      }
    }
    -[VCDispatchTimer stop](self->_timeoutTimer, "stop");

    self->_timeoutTimer = 0;
    pthread_mutex_unlock(p_timeoutMutex);
  }
  else
  {
    pthread_mutex_unlock(p_timeoutMutex);
  }
}

+ (void)terminateProcess:(id)a3 terminateSource:(id)a4 agent:(opaqueRTCReporting *)a5
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), a4, a5, "+[VCObject terminateProcess:terminateSource:agent:]"), 0));
}

- (NSString)logPrefix
{
  return self->_logPrefix;
}

- (void)setLogPrefix:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (void)startTerminationTimer:(NSObject *)a3 terminationType:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];
  __int128 v4;

  *(_DWORD *)v3 = 136315906;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2080;
  *(_QWORD *)&v3[14] = "-[VCObject startTerminationTimer:terminationType:]";
  *(_WORD *)&v3[22] = 1024;
  LODWORD(v4) = 115;
  WORD2(v4) = 2112;
  *(_QWORD *)((char *)&v4 + 6) = a2;
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, a2, a3, " [%s] %s:%d %@. VCDispatchTimer is already active", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], v4);
  OUTLINED_FUNCTION_3();
}

void __50__VCObject_startTerminationTimer_terminationType___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d %@. Timeout triggered. Terminating process ...");
  OUTLINED_FUNCTION_3();
}

void __50__VCObject_startTerminationTimer_terminationType___block_invoke_cold_2()
{
  os_log_t v0;
  uint8_t v1[40];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_0_6();
  _os_log_fault_impl(&dword_1D8A54000, v0, OS_LOG_TYPE_FAULT, " [%s] %s:%d %@. Timeout triggered. Terminating process ...", v1, 0x26u);
  OUTLINED_FUNCTION_3();
}

@end
