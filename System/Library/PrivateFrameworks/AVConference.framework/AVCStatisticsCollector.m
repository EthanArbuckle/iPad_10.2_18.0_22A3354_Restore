@implementation AVCStatisticsCollector

- (AVCStatisticsCollector)init
{
  return (AVCStatisticsCollector *)-[AVCStatisticsCollector initForSimulation:useExternalThread:](self, "initForSimulation:useExternalThread:", 0, 0);
}

- (id)initForSimulation:(BOOL)a3 useExternalThread:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  AVCStatisticsCollector *v6;
  const __CFAllocator *v7;
  uint64_t i;
  int v9;
  uint64_t v10;
  const __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  uint64_t v17;
  NSObject *v18;
  objc_super v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  AVCStatisticsCollector *v30;
  __int16 v31;
  _BOOL4 v32;
  pthread_mutexattr_t v33;
  uint64_t v34;

  v4 = a4;
  v5 = a3;
  v34 = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)AVCStatisticsCollector;
  v6 = -[AVCStatisticsCollector init](&v20, sel_init);
  if (v6)
  {
    v6->_statisticsCollection = (tagVCStatisticsCollection *)malloc_type_calloc(1uLL, 0x218uLL, 0x1000040ADAC9B86uLL);
    v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    VCAllocatorFirstCome_Create((const __CFAllocator *)*MEMORY[0x1E0C9AE00], (uint64_t)"AVCStatisticsCollectorEntryAllocator", &v6->_statisticsChangeHandlerEntryAllocator);
    for (i = 360; i != 840; i += 32)
      VCSingleLinkedListInitialize((uint64_t)v6 + i, (uint64_t)_AVCStatisticsCollectorHandlerList_CompareListEntries);
    v6->_changeHandlerRequests.prev = &v6->_changeHandlerRequests;
    v6->_changeHandlerRequests.next = &v6->_changeHandlerRequests;
    VCAllocatorFirstCome_Create(v7, (uint64_t)"AVCStatisticsCollectorChangeHandlerRequestAllocator", &v6->_changeHandlerRequestAllocator);
    v6->_bandwidthEstimatorMap = objc_alloc_init(VCRateControlBandwidthEstimatorMap);
    v6->_owrdEstimator = objc_alloc_init(VCRateControlOWRDEstimator);
    v6->_history = objc_alloc_init(VCStatisticsHistory);
    v9 = -[VCDefaults rateControlStatisticsQueueWaitTime](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "rateControlStatisticsQueueWaitTime");
    v6->_forceQueueWaitTimeMs = v9 & ~(v9 >> 31);
    v6->_useExternalThread = v4;
    if (v5)
      v10 = 1;
    else
      v10 = 300;
    v6->_queue = -[VCStatisticsCollectorQueue initWithQueueSize:shouldBlockWhenFull:queueWaitTimeMs:useExternalThread:]([VCStatisticsCollectorQueue alloc], "initWithQueueSize:shouldBlockWhenFull:queueWaitTimeMs:useExternalThread:", v10, v5, v6->_forceQueueWaitTimeMs, v4);
    v6->_changeHandlerRequestsLock._os_unfair_lock_opaque = 0;
    pthread_rwlock_init(&v6->_statisticsChangeHandlersLock, 0);
    pthread_rwlock_init(&v6->_statisticsCollectionLock, 0);
    v33.__sig = 0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)v33.__opaque = 0xAAAAAAAAAAAAAAAALL;
    pthread_mutexattr_init(&v33);
    pthread_mutexattr_settype(&v33, 2);
    pthread_mutex_init(&v6->_startMutex, &v33);
    if ((AVCStatisticsCollector *)objc_opt_class() == v6)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v12 = VRTraceErrorLogLevelToCSTR();
        v13 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          v22 = v12;
          v23 = 2080;
          v24 = "-[AVCStatisticsCollector initForSimulation:useExternalThread:]";
          v25 = 1024;
          v26 = 166;
          v27 = 1024;
          LODWORD(v28) = v4;
          v14 = "VCRC [%s] %s:%d statisticsCollector is initiated with useExternalThread=%{BOOL}d";
          v15 = v13;
          v16 = 34;
LABEL_17:
          _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v11 = (const __CFString *)-[AVCStatisticsCollector performSelector:](v6, "performSelector:", sel_logPrefix);
      else
        v11 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v17 = VRTraceErrorLogLevelToCSTR();
        v18 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316418;
          v22 = v17;
          v23 = 2080;
          v24 = "-[AVCStatisticsCollector initForSimulation:useExternalThread:]";
          v25 = 1024;
          v26 = 166;
          v27 = 2112;
          v28 = v11;
          v29 = 2048;
          v30 = v6;
          v31 = 1024;
          v32 = v4;
          v14 = "VCRC [%s] %s:%d %@(%p) statisticsCollector is initiated with useExternalThread=%{BOOL}d";
          v15 = v18;
          v16 = 54;
          goto LABEL_17;
        }
      }
    }
  }
  return v6;
}

- (void)dealloc
{
  uint64_t v3;
  NSObject *v4;
  AVCStatisticsCollector *next;
  __CFAllocator *changeHandlerRequestAllocator;
  __CFAllocator *statisticsChangeHandlerEntryAllocator;
  objc_super v8;
  _BYTE buf[12];
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  AVCStatisticsCollector *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = v3;
      v10 = 2080;
      v11 = "-[AVCStatisticsCollector dealloc]";
      v12 = 1024;
      v13 = 172;
      v14 = 2048;
      v15 = self;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "VCRC [%s] %s:%d dealloc called %p", buf, 0x26u);
    }
  }
  -[AVCStatisticsCollector stop](self, "stop");

  free(self->_statisticsCollection);
  os_unfair_lock_lock(&self->_changeHandlerRequestsLock);
  *(_QWORD *)buf = 0;
  while (1)
  {
    next = (AVCStatisticsCollector *)self->_changeHandlerRequests.next;
    if (next == (AVCStatisticsCollector *)&self->_changeHandlerRequests)
      break;
    self->_changeHandlerRequests.next = (tagAVCStatisticsCollectorChangedHandlerRequest *)next->super.isa;
    *((_QWORD *)next->super.isa + 1) = next->_statisticsCollection;
    next->super.isa = (Class)next;
    next->_statisticsCollection = (tagVCStatisticsCollection *)next;
    *(_QWORD *)buf = next;
    _AVCStatisticsCollector_DestroyChangeHandlerRequest((uint64_t)self, (void **)buf);
  }
  changeHandlerRequestAllocator = self->_changeHandlerRequestAllocator;
  if (changeHandlerRequestAllocator)
    CFRelease(changeHandlerRequestAllocator);
  os_unfair_lock_unlock(&self->_changeHandlerRequestsLock);
  pthread_rwlock_wrlock(&self->_statisticsChangeHandlersLock);
  _AVCStatisticsCollector_CleanupChangeHandlers((uint64_t)self);
  statisticsChangeHandlerEntryAllocator = self->_statisticsChangeHandlerEntryAllocator;
  if (statisticsChangeHandlerEntryAllocator)
    CFRelease(statisticsChangeHandlerEntryAllocator);
  pthread_rwlock_unlock(&self->_statisticsChangeHandlersLock);
  pthread_rwlock_destroy(&self->_statisticsChangeHandlersLock);
  pthread_mutex_destroy(&self->_startMutex);

  pthread_rwlock_destroy(&self->_statisticsCollectionLock);
  v8.receiver = self;
  v8.super_class = (Class)AVCStatisticsCollector;
  -[AVCStatisticsCollector dealloc](&v8, sel_dealloc);
}

- (void)start
{
  _opaque_pthread_mutex_t *p_startMutex;
  _BOOL4 isStarted;
  int ErrorLogLevelForModule;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[5];
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  AVCStatisticsCollector *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  p_startMutex = &self->_startMutex;
  pthread_mutex_lock(&self->_startMutex);
  isStarted = self->_isStarted;
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (isStarted)
  {
    if (ErrorLogLevelForModule >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v12 = v8;
        v13 = 2080;
        v14 = "-[AVCStatisticsCollector start]";
        v15 = 1024;
        v16 = 201;
        v17 = 2048;
        v18 = self;
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, "VCRC [%s] %s:%d statisticsCollector[%p] is already started", buf, 0x26u);
      }
    }
  }
  else
  {
    if (ErrorLogLevelForModule >= 6)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v12 = v6;
        v13 = 2080;
        v14 = "-[AVCStatisticsCollector start]";
        v15 = 1024;
        v16 = 202;
        v17 = 2112;
        v18 = self;
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "VCRC [%s] %s:%d start=%@", buf, 0x26u);
      }
    }
    self->_isStarted = 1;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __31__AVCStatisticsCollector_start__block_invoke;
    v10[3] = &unk_1E9E523A0;
    v10[4] = self;
    -[VCStatisticsCollectorQueue setMessageHandler:](self->_queue, "setMessageHandler:", v10);
    -[VCStatisticsCollectorQueue start](self->_queue, "start");
    if (self->_useExternalThread)
      VCStatisticsCollectorQueue_DrainAndProcessAllStatistics((uint64_t)self->_queue);
    -[VCRateControlOWRDEstimator resetOWRDEstimation](self->_owrdEstimator, "resetOWRDEstimation");
  }
  pthread_mutex_unlock(p_startMutex);
}

void __31__AVCStatisticsCollector_start__block_invoke(uint64_t a1, unsigned int *a2)
{
  _AVCStatisticsCollector_ProcessVCStatisticsInternal(*(_QWORD *)(a1 + 32), a2);
}

- (void)stop
{
  _opaque_pthread_mutex_t *p_startMutex;
  _BOOL4 isStarted;
  int ErrorLogLevelForModule;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  AVCStatisticsCollector *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  p_startMutex = &self->_startMutex;
  pthread_mutex_lock(&self->_startMutex);
  isStarted = self->_isStarted;
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (isStarted)
  {
    if (ErrorLogLevelForModule >= 6)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136315906;
        v11 = v6;
        v12 = 2080;
        v13 = "-[AVCStatisticsCollector stop]";
        v14 = 1024;
        v15 = 223;
        v16 = 2112;
        v17 = self;
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "VCRC [%s] %s:%d stop=%@", (uint8_t *)&v10, 0x26u);
      }
    }
    -[VCStatisticsCollectorQueue stop](self->_queue, "stop");
    self->_isStarted = 0;
    -[VCStatisticsCollectorQueue setMessageHandler:](self->_queue, "setMessageHandler:", 0);
  }
  else if (ErrorLogLevelForModule >= 7)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315906;
      v11 = v8;
      v12 = 2080;
      v13 = "-[AVCStatisticsCollector stop]";
      v14 = 1024;
      v15 = 222;
      v16 = 2048;
      v17 = self;
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, "VCRC [%s] %s:%d statisticsCollector[%p] is already stopped", (uint8_t *)&v10, 0x26u);
    }
  }
  _AVCStatisticsCollector_UpdateStatisticChangeHandlerDictionaryCache((uint64_t)self);
  pthread_mutex_unlock(p_startMutex);
}

- (void)setStatistics:(id)a3
{
  const char *v4;
  char *v5;
  os_log_t *v6;
  uint64_t v7;
  NSObject *v8;
  char *__lasts;
  char *__str;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    __str = 0;
    v4 = a3 ? (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String") : "<nil>";
    asprintf(&__str, "newStatistics=%s", v4);
    if (__str)
    {
      __lasts = 0;
      v5 = strtok_r(__str, "\n", &__lasts);
      v6 = (os_log_t *)MEMORY[0x1E0CF2758];
      do
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          v7 = VRTraceErrorLogLevelToCSTR();
          v8 = *v6;
          if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            v12 = v7;
            v13 = 2080;
            v14 = "-[AVCStatisticsCollector setStatistics:]";
            v15 = 1024;
            v16 = 235;
            v17 = 2080;
            v18 = "";
            v19 = 2080;
            v20 = v5;
            _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "VCRC [%s] %s:%d %s %s", buf, 0x30u);
          }
        }
        v5 = strtok_r(0, "\n", &__lasts);
      }
      while (v5);
      free(__str);
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[AVCStatisticsCollector setStatistics:].cold.1();
  }
}

- (id)getStatistics:(id)a3
{
  const char *v4;
  char *v5;
  os_log_t *v6;
  uint64_t v7;
  NSObject *v8;
  char *__lasts;
  char *__str;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    __str = 0;
    v4 = a3 ? (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String") : "<nil>";
    asprintf(&__str, "keys=%s", v4);
    if (__str)
    {
      __lasts = 0;
      v5 = strtok_r(__str, "\n", &__lasts);
      v6 = (os_log_t *)MEMORY[0x1E0CF2758];
      do
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          v7 = VRTraceErrorLogLevelToCSTR();
          v8 = *v6;
          if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            v13 = v7;
            v14 = 2080;
            v15 = "-[AVCStatisticsCollector getStatistics:]";
            v16 = 1024;
            v17 = 241;
            v18 = 2080;
            v19 = "";
            v20 = 2080;
            v21 = v5;
            _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "VCRC [%s] %s:%d %s %s", buf, 0x30u);
          }
        }
        v5 = strtok_r(0, "\n", &__lasts);
      }
      while (v5);
      free(__str);
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[AVCStatisticsCollector getStatistics:].cold.1();
  }
  return 0;
}

- (void)setMode:(unsigned int)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3;
  self->_mode = a3;
  -[VCRateControlBandwidthEstimatorMap setMode:](self->_bandwidthEstimatorMap, "setMode:");
  -[VCRateControlOWRDEstimator setMode:](self->_owrdEstimator, "setMode:", v3);
}

- (void)setServerBag:(id)a3
{
  VCRateControlServerBag *serverBag;

  serverBag = self->_serverBag;
  if (serverBag != a3)
  {

    self->_serverBag = (VCRateControlServerBag *)a3;
  }
  -[VCRateControlBandwidthEstimatorMap setServerBag:](self->_bandwidthEstimatorMap, "setServerBag:", a3);
}

- (int)registerStatisticsChangeHandlerWithType:(int)a3 handler:(id)a4
{
  unsigned int nextChangeHandlerIdentifier;

  if ((a3 - 1) > 0xD)
  {
    nextChangeHandlerIdentifier = -1;
  }
  else
  {
    pthread_rwlock_wrlock(&self->_statisticsCollectionLock);
    nextChangeHandlerIdentifier = self->_nextChangeHandlerIdentifier;
    self->_nextChangeHandlerIdentifier = nextChangeHandlerIdentifier + 1;
    pthread_rwlock_unlock(&self->_statisticsCollectionLock);
    os_unfair_lock_lock(&self->_changeHandlerRequestsLock);
    _AVCStatisticsCollector_PushChangeHandlerRequest((uint64_t)self, 0, a3, nextChangeHandlerIdentifier, a4);
    os_unfair_lock_unlock(&self->_changeHandlerRequestsLock);
  }
  pthread_mutex_lock(&self->_startMutex);
  if (!self->_isStarted)
    _AVCStatisticsCollector_UpdateStatisticChangeHandlerDictionaryCache((uint64_t)self);
  pthread_mutex_unlock(&self->_startMutex);
  return nextChangeHandlerIdentifier;
}

- (BOOL)unregisterStatisticsChangeHandlerWithType:(int)a3 handlerIndex:(int)a4
{
  BOOL v7;

  if ((a3 - 1) > 0xD)
  {
    v7 = 0;
  }
  else
  {
    os_unfair_lock_lock(&self->_changeHandlerRequestsLock);
    v7 = _AVCStatisticsCollector_PushChangeHandlerRequest((uint64_t)self, 1, a3, a4, 0);
    os_unfair_lock_unlock(&self->_changeHandlerRequestsLock);
  }
  pthread_mutex_lock(&self->_startMutex);
  if (!self->_isStarted)
    _AVCStatisticsCollector_UpdateStatisticChangeHandlerDictionaryCache((uint64_t)self);
  pthread_mutex_unlock(&self->_startMutex);
  return v7;
}

- (void)unregisterAllStatisticsChangeHandlers
{
  os_unfair_lock_s *p_changeHandlerRequestsLock;

  p_changeHandlerRequestsLock = &self->_changeHandlerRequestsLock;
  os_unfair_lock_lock(&self->_changeHandlerRequestsLock);
  _AVCStatisticsCollector_PushChangeHandlerRequest((uint64_t)self, 2, 0, 0, 0);
  os_unfair_lock_unlock(p_changeHandlerRequestsLock);
  pthread_mutex_lock(&self->_startMutex);
  if (!self->_isStarted)
    _AVCStatisticsCollector_UpdateStatisticChangeHandlerDictionaryCache((uint64_t)self);
  pthread_mutex_unlock(&self->_startMutex);
}

- (BOOL)shouldProcessAtTime:(double)a3
{
  int forceQueueWaitTimeMs;
  BOOL v4;

  forceQueueWaitTimeMs = self->_forceQueueWaitTimeMs;
  v4 = a3 == 0.0 || forceQueueWaitTimeMs == 0;
  if (!v4 && a3 - self->_previousProcessTime <= (double)forceQueueWaitTimeMs / 1000.0)
    return 0;
  self->_previousProcessTime = a3;
  return 1;
}

- (tagVCStatisticsMessage)getVCStatisticsWithType:(SEL)a3 time:(int)a4
{
  tagVCStatisticsMessage *result;

  *((_QWORD *)&retstr->var0.localRCEvent + 21) = 0;
  *(_OWORD *)((char *)&retstr->var0.localRCEvent + 136) = 0u;
  *(_OWORD *)((char *)&retstr->var0.localRCEvent + 152) = 0u;
  *(_OWORD *)((char *)&retstr->var0.localRCEvent + 104) = 0u;
  *(_OWORD *)(&retstr->var0.localRCEvent + 5) = 0u;
  *(_OWORD *)(&retstr->var0.localRCEvent + 3) = 0u;
  *(_OWORD *)((char *)&retstr->var0.localRCEvent + 88) = 0u;
  *(_OWORD *)((char *)&retstr->var0.localRCEvent + 40) = 0u;
  *(_OWORD *)((char *)&retstr->var0.localRCEvent + 56) = 0u;
  *(_OWORD *)&retstr->var0.rtcpRR.lastSequenceNumber = 0u;
  *(_OWORD *)(&retstr->var0.localRCEvent + 1) = 0u;
  *(_OWORD *)&retstr->type = 0u;
  *(_OWORD *)&retstr->isVCRCInternal = 0u;
  _AVCStatisticsCollector_GetVCStatisticsWithType((uint64_t)self, a4, (uint64_t)retstr, a5);
  return result;
}

uint64_t ___AVCStatisticsCollector_ProcessVCStatisticsInternal_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, _OWORD *);
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _OWORD v15[12];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a2 + 16);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(uint64_t (**)(uint64_t, _OWORD *))(v2 + 16);
  v15[0] = *(_OWORD *)v3;
  v5 = *(_OWORD *)(v3 + 16);
  v6 = *(_OWORD *)(v3 + 32);
  v7 = *(_OWORD *)(v3 + 64);
  v15[3] = *(_OWORD *)(v3 + 48);
  v15[4] = v7;
  v15[1] = v5;
  v15[2] = v6;
  v8 = *(_OWORD *)(v3 + 80);
  v9 = *(_OWORD *)(v3 + 96);
  v10 = *(_OWORD *)(v3 + 128);
  v15[7] = *(_OWORD *)(v3 + 112);
  v15[8] = v10;
  v15[5] = v8;
  v15[6] = v9;
  v11 = *(_OWORD *)(v3 + 144);
  v12 = *(_OWORD *)(v3 + 160);
  v13 = *(_OWORD *)(v3 + 176);
  v16 = *(_QWORD *)(v3 + 192);
  v15[10] = v12;
  v15[11] = v13;
  v15[9] = v11;
  return v4(v2, v15);
}

- (unsigned)mode
{
  return self->_mode;
}

- (unsigned)radioAccessTechnology
{
  return self->_radioAccessTechnology;
}

- (void)setRadioAccessTechnology:(unsigned int)a3
{
  self->_radioAccessTechnology = a3;
}

- (unsigned)sharedEstimatedBandwidth
{
  return self->_sharedEstimatedBandwidth;
}

- (unsigned)sharedEstimatedBandwidthUncapped
{
  return self->_sharedEstimatedBandwidthUncapped;
}

- (unsigned)sharedRemoteEstimatedBandwidth
{
  return self->_sharedRemoteEstimatedBandwidth;
}

- (unsigned)estimatedBandwidthCap
{
  return self->_estimatedBandwidthCap;
}

- (void)setEstimatedBandwidthCap:(unsigned int)a3
{
  self->_estimatedBandwidthCap = a3;
}

- (unsigned)expectedBitrate
{
  return self->_expectedBitrate;
}

- (void)setExpectedBitrate:(unsigned int)a3
{
  self->_expectedBitrate = a3;
}

- (unsigned)mediaControlInfoFECFeedbackVersion
{
  return self->_mediaControlInfoFECFeedbackVersion;
}

- (void)setMediaControlInfoFECFeedbackVersion:(unsigned __int8)a3
{
  self->_mediaControlInfoFECFeedbackVersion = a3;
}

- (VCRateControlServerBag)serverBag
{
  return self->_serverBag;
}

- (BOOL)fastSuddenBandwidthDetectionEnabled
{
  return self->_fastSuddenBandwidthDetectionEnabled;
}

- (BOOL)isStarted
{
  return self->_isStarted;
}

void ___AVCStatisticsCollector_CleanupChangeHandlers_block_invoke(uint64_t a1, _QWORD **a2)
{
  _AVCStatisticsCollector_DestroyChangeHandlerEntry(*(_QWORD *)(a1 + 32), a2);
}

- (void)setStatistics:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCRC [%s] %s:%d setStatistics:newStatsistics is deprecated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)getStatistics:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCRC [%s] %s:%d getStatistics:keys is deprecated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
