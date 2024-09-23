@implementation VCCoreMotionManager

- (VCCoreMotionManager)initWithDelegate:(id)a3
{
  VCCoreMotionManager *v4;
  NSObject *CustomRootQueue;
  NSObject *v6;
  NSObject *v7;
  NSOperationQueue *v8;
  uint64_t v9;
  NSObject *v10;
  objc_super v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)VCCoreMotionManager;
  v4 = -[VCCoreMotionManager init](&v12, sel_init);
  if (v4)
  {
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    v4->_delegateQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.vcCoreMotion.delegateQueue", 0, CustomRootQueue);
    v6 = VCDispatchQueue_GetCustomRootQueue(37);
    v7 = dispatch_queue_create_with_target_V2("com.apple.AVConference.vcCoreMotion.serialQueue", 0, v6);
    v4->_motionActivityManager = 0;
    v4->_motionActivity = 0;
    -[VCCoreMotionManager setCoreMotionManagerDelegate:](v4, "setCoreMotionManagerDelegate:", a3);
    v8 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    v4->_motionActivityQueue = v8;
    -[NSOperationQueue setUnderlyingQueue:](v8, "setUnderlyingQueue:", v7);
    if (v7)
      dispatch_release(v7);
    -[NSOperationQueue setMaxConcurrentOperationCount:](v4->_motionActivityQueue, "setMaxConcurrentOperationCount:", 1);
    if (objc_msgSend(MEMORY[0x1E0CA5660], "isActivityAvailable"))
    {
      v4->_motionActivityManager = (CMMotionActivityManager *)objc_alloc_init(MEMORY[0x1E0CA5660]);
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCCoreMotionManager initWithDelegate:].cold.1(v9, v10);
    }
  }
  return v4;
}

- (void)dealloc
{
  NSObject *delegateQueue;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  delegateQueue = self->_delegateQueue;
  if (delegateQueue)
  {
    dispatch_release(delegateQueue);
    self->_delegateQueue = 0;
  }
  objc_storeWeak((id *)&self->_coreMotionManagerDelegate, 0);
  -[VCCoreMotionManager stopMonitoringMotionActivity](self, "stopMonitoringMotionActivity");

  v4.receiver = self;
  v4.super_class = (Class)VCCoreMotionManager;
  -[VCCoreMotionManager dealloc](&v4, sel_dealloc);
}

- (id)coreMotionManagerDelegate
{
  return objc_loadWeak((id *)&self->_coreMotionManagerDelegate);
}

- (void)setCoreMotionManagerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_coreMotionManagerDelegate, a3);
}

- (void)setMotionActivity:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  int v7;
  CMMotionActivityConfidence v8;
  NSObject *delegateQueue;
  _QWORD v10[6];
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  __int16 v19;
  CMMotionActivityConfidence v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];

  self->_motionActivity = (CMMotionActivity *)objc_msgSend(a3, "copy");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = -[VCCoreMotionManager getMotionActivityValueForMotionActivity:](self, "getMotionActivityValueForMotionActivity:", self->_motionActivity);
      v8 = -[CMMotionActivity confidence](self->_motionActivity, "confidence");
      *(_DWORD *)buf = 136316162;
      v12 = v5;
      v13 = 2080;
      v14 = "-[VCCoreMotionManager setMotionActivity:]";
      v15 = 1024;
      v16 = 85;
      v17 = 1024;
      v18 = v7;
      v19 = 2048;
      v20 = v8;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d CoreMotion: Updated motion activity value=%d confidence=%ld", buf, 0x2Cu);
    }
  }
  delegateQueue = self->_delegateQueue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __41__VCCoreMotionManager_setMotionActivity___block_invoke;
  v10[3] = &unk_1E9E52238;
  v10[4] = self;
  v10[5] = a3;
  dispatch_async(delegateQueue, v10);
}

uint64_t __41__VCCoreMotionManager_setMotionActivity___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "coreMotionManagerDelegate"), "didUpdateMotionActivity:", *(_QWORD *)(a1 + 40));
}

- (void)startMonitoringMotionActivity
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  CMMotionActivityManager *motionActivityManager;
  NSOperationQueue *motionActivityQueue;
  _QWORD v9[5];
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
  if (self->_motionActivityManager)
  {
    v4 = v3;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v11 = v5;
        v12 = 2080;
        v13 = "-[VCCoreMotionManager startMonitoringMotionActivity]";
        v14 = 1024;
        v15 = 98;
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d CoreMotion: Starting motion activity monitor", buf, 0x1Cu);
      }
    }
    motionActivityManager = self->_motionActivityManager;
    motionActivityQueue = self->_motionActivityQueue;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __52__VCCoreMotionManager_startMonitoringMotionActivity__block_invoke;
    v9[3] = &unk_1E9E53F48;
    v9[4] = v4;
    -[CMMotionActivityManager startActivityUpdatesToQueue:withHandler:](motionActivityManager, "startActivityUpdatesToQueue:withHandler:", motionActivityQueue, v9);
  }
}

void *__52__VCCoreMotionManager_startMonitoringMotionActivity__block_invoke(uint64_t a1, uint64_t a2)
{
  void *result;

  result = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
  if (a2)
    return (void *)objc_msgSend(result, "setMotionActivity:", a2);
  return result;
}

- (void)stopMonitoringMotionActivity
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (self->_motionActivityManager)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v5 = 136315650;
        v6 = v3;
        v7 = 2080;
        v8 = "-[VCCoreMotionManager stopMonitoringMotionActivity]";
        v9 = 1024;
        v10 = 112;
        _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d CoreMotion: Stopping motion activity monitor", (uint8_t *)&v5, 0x1Cu);
      }
    }
    -[CMMotionActivityManager stopActivityUpdates](self->_motionActivityManager, "stopActivityUpdates");
  }
}

- (unsigned)getMotionActivityValueForMotionActivity:(id)a3
{
  int v4;

  if ((objc_msgSend(a3, "stationary") & 1) != 0)
  {
    LOBYTE(v4) = 1;
  }
  else if ((objc_msgSend(a3, "walking") & 1) != 0
         || (objc_msgSend(a3, "running") & 1) != 0
         || (objc_msgSend(a3, "automotive") & 1) != 0
         || (v4 = objc_msgSend(a3, "cycling")) != 0)
  {
    LOBYTE(v4) = 2;
  }
  return v4;
}

- (CMMotionActivity)motionActivity
{
  return self->_motionActivity;
}

- (void)initWithDelegate:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
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
  v5 = "-[VCCoreMotionManager initWithDelegate:]";
  v6 = 1024;
  v7 = 52;
  _os_log_error_impl(&dword_1D8A54000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d CoreMotion: CMMotionActivity unavailable", (uint8_t *)&v2, 0x1Cu);
}

@end
