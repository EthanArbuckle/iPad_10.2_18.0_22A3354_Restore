@implementation GKSimpleTimer

- (GKSimpleTimer)init
{
  GKSimpleTimer *v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  objc_super v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  GKSimpleTimer *v15;
  pthread_mutexattr_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v7.receiver = self;
  v7.super_class = (Class)GKSimpleTimer;
  v2 = -[GKSimpleTimer init](&v7, sel_init);
  if (v2)
  {
    v16.__sig = 0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)v16.__opaque = 0xAAAAAAAAAAAAAAAALL;
    pthread_mutexattr_init(&v16);
    pthread_mutexattr_settype(&v16, 2);
    pthread_mutex_init(&v2->_lock, &v16);
    pthread_mutexattr_destroy(&v16);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x24BDFDC28];
      v5 = *MEMORY[0x24BDFDC28];
      if (*MEMORY[0x24BDFDC18])
      {
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          v9 = v3;
          v10 = 2080;
          v11 = "-[GKSimpleTimer init]";
          v12 = 1024;
          v13 = 34;
          v14 = 2048;
          v15 = v2;
          _os_log_impl(&dword_215C5C000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [%p] simpletimer set up", buf, 0x26u);
        }
      }
      else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        -[GKSimpleTimer init].cold.1(v3, (uint64_t)v2, v4);
      }
    }
  }
  return v2;
}

- (void)dealloc
{
  NSObject *timerSource;
  objc_super v4;

  timerSource = self->_timerSource;
  if (timerSource)
    dispatch_source_cancel(timerSource);
  pthread_mutex_destroy(&self->_lock);
  v4.receiver = self;
  v4.super_class = (Class)GKSimpleTimer;
  -[GKSimpleTimer dealloc](&v4, sel_dealloc);
}

- (void)setDelegate:(id)a3
{
  _opaque_pthread_mutex_t *p_lock;
  uint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  GKSimpleTimer *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  self->_delegate = a3;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136316162;
      v9 = v6;
      v10 = 2080;
      v11 = "-[GKSimpleTimer setDelegate:]";
      v12 = 1024;
      v13 = 48;
      v14 = 2048;
      v15 = self;
      v16 = 2048;
      v17 = a3;
      _os_log_impl(&dword_215C5C000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [%p] simpletimer setDelegate: [%p]", (uint8_t *)&v8, 0x30u);
    }
  }
  pthread_mutex_unlock(p_lock);
}

- (void)setTimer:(double)a3
{
  double v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  double v8;
  double v9;
  double v10;
  NSObject *timerSource;
  dispatch_time_t v12;
  double v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  GKSimpleTimer *v21;
  __int16 v22;
  double v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = self->_interval - (a3 - self->_startTime);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x24BDFDC28];
    v7 = *MEMORY[0x24BDFDC28];
    if (*MEMORY[0x24BDFDC18])
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 136316162;
        v15 = v5;
        v16 = 2080;
        v17 = "-[GKSimpleTimer setTimer:]";
        v18 = 1024;
        v19 = 53;
        v20 = 2048;
        v21 = self;
        v22 = 2048;
        v23 = v4;
        _os_log_impl(&dword_215C5C000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [%p] simpletimer set timer: [%.3lf]", (uint8_t *)&v14, 0x30u);
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v14 = 136316162;
      v15 = v5;
      v16 = 2080;
      v17 = "-[GKSimpleTimer setTimer:]";
      v18 = 1024;
      v19 = 53;
      v20 = 2048;
      v21 = self;
      v22 = 2048;
      v23 = v4;
      _os_log_debug_impl(&dword_215C5C000, v6, OS_LOG_TYPE_DEBUG, " [%s] %s:%d [%p] simpletimer set timer: [%.3lf]", (uint8_t *)&v14, 0x30u);
    }
  }
  v8 = v4 + 0.05;
  if (v4 <= 0.0)
    v8 = 0.05;
  v9 = v8 * 0.25;
  v10 = v8 * 0.25 * 1000000000.0;
  timerSource = self->_timerSource;
  v12 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
  v13 = 50000000.0;
  if (v9 <= 0.05)
    v13 = v10;
  dispatch_source_set_timer(timerSource, v12, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)v13);
  self->_timerSourceSet = 1;
}

- (void)fireIn:(double)a3 fromNow:(double)a4
{
  _opaque_pthread_mutex_t *p_lock;
  NSObject *global_queue;
  NSObject *v9;
  uint64_t v10;
  _QWORD v11[5];
  _QWORD handler[5];

  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  self->_startTime = a4;
  if (a3 >= 0.0)
    self->_interval = a3;
  if (!self->_timerSource)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v9 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, global_queue);
    v10 = MEMORY[0x24BDAC760];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __32__GKSimpleTimer_fireIn_fromNow___block_invoke;
    handler[3] = &unk_24D466170;
    handler[4] = self;
    dispatch_source_set_event_handler(v9, handler);
    v11[0] = v10;
    v11[1] = 3221225472;
    v11[2] = __32__GKSimpleTimer_fireIn_fromNow___block_invoke_4;
    v11[3] = &unk_24D466170;
    v11[4] = v9;
    dispatch_source_set_cancel_handler(v9, v11);
    self->_timerSource = (OS_dispatch_source *)v9;
    dispatch_resume(v9);
LABEL_7:
    -[GKSimpleTimer setTimer:](self, "setTimer:", a4);
    goto LABEL_8;
  }
  if (!self->_timerSourceSet)
    goto LABEL_7;
LABEL_8:
  pthread_mutex_unlock(p_lock);
}

uint64_t __32__GKSimpleTimer_fireIn_fromNow___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  _QWORD *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  double v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  pthread_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 8));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 104) = 0;
  v2 = micro();
  v3 = v2 - *(double *)(*(_QWORD *)(a1 + 32) + 88);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD **)(a1 + 32);
      v8 = v6[11];
      v7 = v6[12];
      v9 = v6[10];
      v12 = 136316930;
      v13 = v4;
      v14 = 2080;
      v15 = "-[GKSimpleTimer fireIn:fromNow:]_block_invoke";
      v16 = 1024;
      v17 = 81;
      v18 = 2048;
      v19 = v6;
      v20 = 2048;
      v21 = v8;
      v22 = 2048;
      v23 = v3;
      v24 = 2048;
      v25 = v7;
      v26 = 2048;
      v27 = v9;
      _os_log_impl(&dword_215C5C000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [%p] simpletimer fires? start[%.3lf] elapsed[%.3lf] fireIn[%.3lf] delegate=%p", (uint8_t *)&v12, 0x4Eu);
    }
  }
  v10 = *(_QWORD *)(a1 + 32);
  if (v3 <= *(double *)(v10 + 96))
  {
    objc_msgSend((id)v10, "setTimer:", v2);
  }
  else if (*(double *)(v10 + 88) != 0.0 && *(_QWORD *)(v10 + 80))
  {
    *(_QWORD *)(v10 + 88) = 0;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "timeout:", *(id *)(a1 + 32));
  }
  return pthread_mutex_unlock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 8));
}

void __32__GKSimpleTimer_fireIn_fromNow___block_invoke_4(uint64_t a1)
{
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
}

- (void)invalidate
{
  _opaque_pthread_mutex_t *p_lock;
  uint64_t v4;
  NSObject *v5;
  OS_dispatch_source *timerSource;
  NSObject *v7;
  OS_dispatch_source **p_timerSource;
  OS_dispatch_source *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  GKSimpleTimer *v17;
  __int16 v18;
  OS_dispatch_source *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      timerSource = self->_timerSource;
      v10 = 136316162;
      v11 = v4;
      v12 = 2080;
      v13 = "-[GKSimpleTimer invalidate]";
      v14 = 1024;
      v15 = 107;
      v16 = 2048;
      v17 = self;
      v18 = 2048;
      v19 = timerSource;
      _os_log_impl(&dword_215C5C000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [%p] simpletimer invalidate (source=%p)", (uint8_t *)&v10, 0x30u);
    }
  }
  v9 = self->_timerSource;
  p_timerSource = &self->_timerSource;
  v7 = v9;
  if (v9)
    dispatch_source_cancel(v7);
  *p_timerSource = 0;
  p_timerSource[1] = 0;
  p_timerSource[2] = 0;
  pthread_mutex_unlock(p_lock);
}

- (GKSimpleTimerDelegate)delegate
{
  return (GKSimpleTimerDelegate *)self->_delegate;
}

- (double)interval
{
  return self->_interval;
}

- (void)init
{
  int v3;
  uint64_t v4;
  __int16 v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = 136315906;
  v4 = a1;
  v5 = 2080;
  v6 = "-[GKSimpleTimer init]";
  v7 = 1024;
  v8 = 34;
  v9 = 2048;
  v10 = a2;
  _os_log_debug_impl(&dword_215C5C000, log, OS_LOG_TYPE_DEBUG, " [%s] %s:%d [%p] simpletimer set up", (uint8_t *)&v3, 0x26u);
}

@end
