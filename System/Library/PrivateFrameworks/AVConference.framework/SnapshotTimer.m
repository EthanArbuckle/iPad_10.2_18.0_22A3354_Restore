@implementation SnapshotTimer

- (SnapshotTimer)init
{
  SnapshotTimer *result;
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)SnapshotTimer;
  result = -[SnapshotTimer init](&v3, sel_init);
  if (result)
    result->taskIsComplete = 0;
  return result;
}

+ (void)takeSnapshotForTask:(id)a3
{
  uint64_t v3;
  NSObject *v4;

  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      +[SnapshotTimer takeSnapshotForTask:].cold.1(v3, v4);
  }
}

- (void)checkinWithTimeout:(double)a3 forTask:(id)a4
{
  dispatch_time_t v6;
  NSObject *global_queue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  if (a3 == 0.0)
  {
    +[SnapshotTimer takeSnapshotForTask:](SnapshotTimer, "takeSnapshotForTask:", a4);
  }
  else
  {
    v6 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__SnapshotTimer_checkinWithTimeout_forTask___block_invoke;
    block[3] = &unk_1E9E52238;
    block[4] = self;
    block[5] = a4;
    dispatch_after(v6, global_queue, block);
  }
}

void __44__SnapshotTimer_checkinWithTimeout_forTask___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
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
  if ((objc_msgSend(*(id *)(a1 + 32), "taskIsComplete") & 1) != 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v2 = VRTraceErrorLogLevelToCSTR();
      v3 = *MEMORY[0x1E0CF2758];
      v4 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          v5 = objc_msgSend(*(id *)(a1 + 40), "UTF8String");
          v6 = 136315906;
          v7 = v2;
          v8 = 2080;
          v9 = "-[SnapshotTimer checkinWithTimeout:forTask:]_block_invoke";
          v10 = 1024;
          v11 = 44;
          v12 = 2080;
          v13 = v5;
          _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d SnapshotTimer: %s complete before deadline, ignored", (uint8_t *)&v6, 0x26u);
        }
      }
      else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        __44__SnapshotTimer_checkinWithTimeout_forTask___block_invoke_cold_1(v2, a1, v3);
      }
    }
  }
  else
  {
    +[SnapshotTimer takeSnapshotForTask:](SnapshotTimer, "takeSnapshotForTask:", *(_QWORD *)(a1 + 40));
  }
}

- (void)checkout
{
  -[SnapshotTimer setTaskIsComplete:](self, "setTaskIsComplete:", 1);
}

- (BOOL)taskIsComplete
{
  return self->taskIsComplete;
}

- (void)setTaskIsComplete:(BOOL)a3
{
  self->taskIsComplete = a3;
}

+ (void)takeSnapshotForTask:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
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
  v5 = "+[SnapshotTimer takeSnapshotForTask:]";
  v6 = 1024;
  v7 = 29;
  _os_log_error_impl(&dword_1D8A54000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d MarcoPerformSnapshot no longer in use", (uint8_t *)&v2, 0x1Cu);
}

void __44__SnapshotTimer_checkinWithTimeout_forTask___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5;
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
  v5 = objc_msgSend(*(id *)(a2 + 40), "UTF8String");
  v6 = 136315906;
  v7 = a1;
  v8 = 2080;
  v9 = "-[SnapshotTimer checkinWithTimeout:forTask:]_block_invoke";
  v10 = 1024;
  v11 = 44;
  v12 = 2080;
  v13 = v5;
  _os_log_debug_impl(&dword_1D8A54000, a3, OS_LOG_TYPE_DEBUG, " [%s] %s:%d SnapshotTimer: %s complete before deadline, ignored", (uint8_t *)&v6, 0x26u);
}

@end
