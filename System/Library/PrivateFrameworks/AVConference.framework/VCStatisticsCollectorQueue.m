@implementation VCStatisticsCollectorQueue

- (VCStatisticsCollectorQueue)initWithQueueSize:(int)a3 shouldBlockWhenFull:(BOOL)a4 queueWaitTimeMs:(unsigned int)a5 useExternalThread:(BOOL)a6
{
  VCStatisticsCollectorQueue *v10;
  VCStatisticsCollectorQueue *v11;
  int v12;
  objc_super v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)VCStatisticsCollectorQueue;
  v10 = -[VCStatisticsCollectorQueue init](&v14, sel_init);
  v11 = v10;
  if (!v10)
    return v11;
  v10->_maxQueueSize = a3;
  if (a3 > 300)
  {
    a3 = 300;
LABEL_6:
    v10->_maxQueueSize = a3;
    goto LABEL_7;
  }
  if (a3 <= 1)
  {
    a3 = 2;
    goto LABEL_6;
  }
LABEL_7:
  v10->_queueProcessWaitTimeMs = a5;
  v10->_shouldProcessMessageImmediately = a5 == 0;
  v10->_shouldProcessMessageOnExternalThread = a6;
  v12 = (int)((double)a3 * 0.75);
  if (!v12)
    v12 = a3;
  v10->_almostFullQueueSize = v12;
  v10->_shouldBlockWhenFull = a4 & ~a6;
  v10->_isThreadRunning = 0;
  *(_QWORD *)&v10->_firstMessageIndex = 0;
  pthread_mutex_init(&v10->_queueMutex, 0);
  pthread_cond_init(&v11->_queueNotFullCondition, 0);
  pthread_cond_init(&v11->_queueNotEmptyCondition, 0);
  pthread_mutex_init(&v11->_waitMutex, 0);
  pthread_cond_init(&v11->_waitCondition, 0);
  return v11;
}

- (void)dealloc
{
  uint64_t v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v7 = v3;
      v8 = 2080;
      v9 = "-[VCStatisticsCollectorQueue dealloc]";
      v10 = 1024;
      v11 = 87;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "VCRC [%s] %s:%d dealloc called", buf, 0x1Cu);
    }
  }
  _Block_release(self->_messageHandler);
  pthread_mutex_destroy(&self->_queueMutex);
  pthread_cond_destroy(&self->_queueNotFullCondition);
  pthread_cond_destroy(&self->_queueNotEmptyCondition);
  pthread_mutex_destroy(&self->_waitMutex);
  pthread_cond_destroy(&self->_waitCondition);
  v5.receiver = self;
  v5.super_class = (Class)VCStatisticsCollectorQueue;
  -[VCStatisticsCollectorQueue dealloc](&v5, sel_dealloc);
}

- (void)start
{
  __int16 v0;
  int v1;
  os_log_t v2;
  uint8_t v3[12];
  __int16 v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v4 = v0;
  v5 = "-[VCStatisticsCollectorQueue start]";
  v6 = 1024;
  v7 = 113;
  v8 = 1024;
  v9 = v1;
  _os_log_error_impl(&dword_1D8A54000, v2, OS_LOG_TYPE_ERROR, "VCRC [%s] %s:%d VCRateControlStatisticsProc thread create failed (%d)", v3, 0x22u);
  OUTLINED_FUNCTION_3();
}

- (void)stop
{
  uint64_t v3;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  uint8_t buf[4];
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_thread)
  {
    -[VCStatisticsCollectorQueue stopThread](self, "stopThread");
    FigThreadJoin();
    self->_thread = 0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v8 = v3;
        v9 = 2080;
        v10 = "-[VCStatisticsCollectorQueue stop]";
        v11 = 1024;
        v12 = 128;
        v5 = "VCRC [%s] %s:%d VCRateControlStatisticsProc thread ended";
LABEL_8:
        _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, v5, buf, 0x1Cu);
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v8 = v6;
      v9 = 2080;
      v10 = "-[VCStatisticsCollectorQueue stop]";
      v11 = 1024;
      v12 = 121;
      v5 = "VCRC [%s] %s:%d Stop VCStatisticsCollectorQueue without VCRateControlStatisticsProc thread";
      goto LABEL_8;
    }
  }
}

- (void)stopThread
{
  int *p_firstMessageIndex;
  _opaque_pthread_mutex_t *p_queueMutex;

  p_firstMessageIndex = &self->_firstMessageIndex;
  p_queueMutex = &self->_queueMutex;
  pthread_mutex_lock(&self->_queueMutex);
  self->_isThreadRunning = 0;
  *(_QWORD *)p_firstMessageIndex = 0;
  if (self->_shouldBlockWhenFull || *((_BYTE *)p_firstMessageIndex + 297))
  {
    pthread_cond_signal(&self->_queueNotEmptyCondition);
  }
  else
  {
    pthread_mutex_lock(&self->_waitMutex);
    pthread_cond_signal(&self->_waitCondition);
    pthread_mutex_unlock(&self->_waitMutex);
  }
  pthread_mutex_unlock(p_queueMutex);
}

- (BOOL)isThreadRunning
{
  return self->_isThreadRunning;
}

- (id)messageHandler
{
  return objc_getProperty(self, a2, 60040, 1);
}

- (void)setMessageHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 60040);
}

@end
