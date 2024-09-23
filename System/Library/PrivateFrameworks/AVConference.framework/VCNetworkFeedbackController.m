@implementation VCNetworkFeedbackController

- (VCNetworkFeedbackController)initWithDelegate:(id)a3 connectionManager:(id)a4
{
  VCNetworkFeedbackController *v6;
  VCNetworkFeedbackController *v7;
  NSObject *CustomRootQueue;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)VCNetworkFeedbackController;
  v6 = -[VCNetworkFeedbackController init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_weakDelegate, a3);
    v7->_connectionManager = (VCConnectionManager *)a4;
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    v7->_wrmClientQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.vcNetworkFeedbackController.serialQueue", 0, CustomRootQueue);
    -[VCNetworkFeedbackController initializeWRMInfo](v7, "initializeWRMInfo");
  }
  return v7;
}

- (void)dealloc
{
  NSObject *wrmClientQueue;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  -[VCNetworkFeedbackController stop](self, "stop");
  -[VCNetworkFeedbackController cleanupWRMData](self, "cleanupWRMData");

  objc_storeWeak((id *)&self->_weakDelegate, 0);
  wrmClientQueue = self->_wrmClientQueue;
  if (wrmClientQueue)
  {
    dispatch_release(wrmClientQueue);
    self->_wrmClientQueue = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)VCNetworkFeedbackController;
  -[VCNetworkFeedbackController dealloc](&v4, sel_dealloc);
}

- (void)initializeWRMInfo
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate memory for WRM context", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)startWithMetricsConfig:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  NSObject *wrmClientQueue;
  _QWORD v8[5];
  __int16 v9;
  char v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (self->_isStarted)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v12 = v3;
        v13 = 2080;
        v14 = "-[VCNetworkFeedbackController startWithMetricsConfig:]";
        v15 = 1024;
        v16 = 113;
        _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCNetworkFeedbackController already started", buf, 0x1Cu);
      }
    }
  }
  else
  {
    v5 = *(_DWORD *)&a3.var0;
    self->_isStarted = 1;
    -[VCNetworkFeedbackController setupWCMClient](self, "setupWCMClient");
    wrmClientQueue = self->_wrmClientQueue;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __54__VCNetworkFeedbackController_startWithMetricsConfig___block_invoke;
    v8[3] = &unk_1E9E55668;
    v8[4] = self;
    v10 = BYTE2(v5);
    v9 = v5;
    dispatch_async(wrmClientQueue, v8);
  }
}

uint64_t __54__VCNetworkFeedbackController_startWithMetricsConfig___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setupWRMClientWithMetricsConfig:", *(unsigned __int16 *)(a1 + 40) | ((unint64_t)*(unsigned __int8 *)(a1 + 42) << 16));
}

- (void)stop
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
  if (self->_isStarted)
  {
    self->_isStarted = 0;
    if (self->_WRMClient)
      -[VCNetworkFeedbackController cleanupWRMClient](self, "cleanupWRMClient");
    if (self->_WCMClient)
      -[VCNetworkFeedbackController cleanupWCMClient](self, "cleanupWCMClient");
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315650;
      v6 = v3;
      v7 = 2080;
      v8 = "-[VCNetworkFeedbackController stop]";
      v9 = 1024;
      v10 = 125;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCNetworkFeedbackController already stopped", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

- (id)strongDelegate
{
  return objc_loadWeak((id *)&self->_weakDelegate);
}

- (unsigned)recommendedTargetBitrateCap
{
  unsigned int v3;

  objc_sync_enter(self);
  v3 = -[VCRecommendedNetworkSettings targetBitrateCap](self->_recommendedSettings, "targetBitrateCap");
  objc_sync_exit(self);
  return v3;
}

- (void)updateMetricsConfig:(id)a3
{
  NSObject *wrmClientQueue;
  _QWORD block[5];
  $EB925890EBEBD6850280D1FB85A9BD43 v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  wrmClientQueue = self->_wrmClientQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__VCNetworkFeedbackController_updateMetricsConfig___block_invoke;
  block[3] = &unk_1E9E55668;
  block[4] = self;
  v5 = a3;
  dispatch_async(wrmClientQueue, block);
}

uint64_t __51__VCNetworkFeedbackController_updateMetricsConfig___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "updateMetricsConfig:", *(unsigned __int16 *)(a1 + 40) | ((unint64_t)*(unsigned __int8 *)(a1 + 42) << 16));
}

- (void)setRSSIThresholdEnabled:(BOOL)a3
{
  NSObject *wrmClientQueue;
  _QWORD block[5];
  BOOL v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  wrmClientQueue = self->_wrmClientQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__VCNetworkFeedbackController_setRSSIThresholdEnabled___block_invoke;
  block[3] = &unk_1E9E521E8;
  block[4] = self;
  v5 = a3;
  dispatch_async(wrmClientQueue, block);
}

uint64_t __55__VCNetworkFeedbackController_setRSSIThresholdEnabled___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setRSSIThresholdEnabled:", *(unsigned __int8 *)(a1 + 40));
}

- (void)cleanupWRMData
{
  tagWRMMetricsInfo *wrmInfo;
  $A43176E2CA7897F9838817DB2FB1B08B *wrmContext;

  wrmInfo = self->_wrmInfo;
  if (wrmInfo)
  {
    free(wrmInfo);
    self->_wrmInfo = 0;
  }
  wrmContext = self->_wrmContext;
  if (wrmContext)
  {
    free(wrmContext);
    self->_wrmContext = 0;
  }
}

- (void)sendFeedbackControllerReport:(id *)a3
{
  uint64_t var6;
  unint64_t v4;
  uint64_t var8;
  unint64_t v6;
  uint64_t var0;
  unint64_t v8;
  uint64_t var2;
  unint64_t v10;
  NSObject *wrmClientQueue;
  _QWORD v12[5];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  var6 = a3->var6;
  v4 = a3->var5 / 0x3E8uLL;
  var8 = a3->var8;
  v6 = a3->var7 / 0x3E8uLL;
  var0 = a3->var0;
  v8 = a3->var1 / 0x3E8uLL;
  var2 = a3->var2;
  v10 = a3->var3 / 0x3E8uLL;
  wrmClientQueue = self->_wrmClientQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __60__VCNetworkFeedbackController_sendFeedbackControllerReport___block_invoke;
  v12[3] = &unk_1E9E55798;
  v12[4] = self;
  v24 = 2;
  v25 = v6;
  v26 = v4;
  v27 = 0;
  v28 = var6;
  v29 = var0;
  v30 = var8;
  v34 = v8;
  v35 = var2;
  v36 = v10;
  dispatch_async(wrmClientQueue, v12);
}

uint64_t __60__VCNetworkFeedbackController_sendFeedbackControllerReport___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "reportMetricsFaceTimeCalling:", a1 + 40);
}

- (void)sendStatusUpdate:(id *)a3
{
  NSObject *wrmClientQueue;
  _QWORD v4[5];
  $A217ADC78E8DBEDF7C145ED6E6E16D89 v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    wrmClientQueue = self->_wrmClientQueue;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __48__VCNetworkFeedbackController_sendStatusUpdate___block_invoke;
    v4[3] = &unk_1E9E52910;
    v4[4] = self;
    v5 = *a3;
    dispatch_async(wrmClientQueue, v4);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCNetworkFeedbackController sendStatusUpdate:].cold.1();
  }
}

uint64_t __48__VCNetworkFeedbackController_sendStatusUpdate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "sendStatusUpdateFaceTimeCalling:", a1 + 40);
}

- (void)requestWRMNotification
{
  NSObject *wrmClientQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  wrmClientQueue = self->_wrmClientQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53__VCNetworkFeedbackController_requestWRMNotification__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(wrmClientQueue, v3);
}

uint64_t __53__VCNetworkFeedbackController_requestWRMNotification__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315650;
      v6 = v2;
      v7 = 2080;
      v8 = "-[VCNetworkFeedbackController requestWRMNotification]_block_invoke";
      v9 = 1024;
      v10 = 212;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Request for the latest iRAT notification by resubscribing again", (uint8_t *)&v5, 0x1Cu);
    }
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "requestNotificationFaceTimeCalling");
}

- (void)reportImmediateWRMMetric:(int)a3 value:(unint64_t)a4
{
  NSObject *wrmClientQueue;
  _QWORD v5[6];
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  wrmClientQueue = self->_wrmClientQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62__VCNetworkFeedbackController_reportImmediateWRMMetric_value___block_invoke;
  v5[3] = &unk_1E9E52350;
  v6 = a3;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(wrmClientQueue, v5);
}

uint64_t __62__VCNetworkFeedbackController_reportImmediateWRMMetric_value___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v1 + 270))
    return objc_msgSend(*(id *)(v1 + 24), "reportImmediateMetric:value:", *(unsigned int *)(result + 48), *(_QWORD *)(result + 40));
  return result;
}

- (void)reportWRMMetrics:(id *)a3
{
  NSObject *wrmClientQueue;
  _QWORD v5[5];
  _BYTE v6[304];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    memcpy(v6, a3, sizeof(v6));
    wrmClientQueue = self->_wrmClientQueue;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __48__VCNetworkFeedbackController_reportWRMMetrics___block_invoke;
    v5[3] = &unk_1E9E55798;
    v5[4] = self;
    dispatch_async(wrmClientQueue, v5);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCNetworkFeedbackController reportWRMMetrics:].cold.1();
  }
}

uint64_t __48__VCNetworkFeedbackController_reportWRMMetrics___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v1 + 270))
    return objc_msgSend(*(id *)(v1 + 24), "reportMetricsFaceTimeCalling:", result + 40);
  return result;
}

- (void)setWRMMetricConfig:(id *)a3
{
  void *v4;

  self->_wrmReportingInterval = (double)a3->var0 / 50.0;
  v4 = (void *)MEMORY[0x1DF086F1C](&self->_weakDelegate, a2);
  objc_msgSend(v4, "reportingIntervalChanged:", self->_wrmReportingInterval);
  if (v4)
    CFRelease(v4);
}

- (void)setWRMNotification:(id *)a3
{
  uint64_t v5;
  NSObject *v6;
  int var0;
  int var1;
  unint64_t var2;
  unint64_t var5;
  unint64_t var4;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  unint64_t v23;
  __int16 v24;
  char *var3;
  __int16 v26;
  unint64_t v27;
  __int16 v28;
  unint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      var0 = a3->var0;
      var1 = a3->var1;
      var2 = a3->var2;
      var4 = a3->var4;
      var5 = a3->var5;
      v12 = 136317186;
      v13 = v5;
      v14 = 2080;
      v15 = "-[VCNetworkFeedbackController setWRMNotification:]";
      v16 = 1024;
      v17 = 253;
      v18 = 1024;
      v19 = var0;
      v20 = 1024;
      v21 = var1;
      v22 = 2048;
      v23 = var2;
      v24 = 2080;
      var3 = a3->var3;
      v26 = 2048;
      v27 = var5;
      v28 = 2048;
      v29 = var4;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Get iRAT notification for %u, %u, 0x%llx, %s, (%llu, %llu)", (uint8_t *)&v12, 0x50u);
    }
  }
  VCConnectionManager_SetWRMNotification((uint64_t)self->_connectionManager, (uint64_t)a3);
}

- (void)setWRMCoexMetrics:(id)a3
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
  uint64_t v14;
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
      v10 = "-[VCNetworkFeedbackController setWRMCoexMetrics:]";
      v11 = 1024;
      v12 = 258;
      v13 = 2080;
      v14 = objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRM: Get iRAT Coex Metrics %s", (uint8_t *)&v7, 0x26u);
    }
  }
  -[VCConnectionManager processWRMCoexMetrics:](self->_connectionManager, "processWRMCoexMetrics:", a3);
}

- (void)setPreWarmState:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;

  v3 = a3;
  v4 = (void *)MEMORY[0x1DF086F1C](&self->_weakDelegate, a2);
  objc_msgSend(v4, "preWarmStateChanged:", v3);
  if (v4)
    CFRelease(v4);
}

- (void)wcmSetCallConfig:(unsigned int)a3 interferenceLevel:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v4 = *(_QWORD *)&a3;
  v15 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315650;
      v10 = v6;
      v11 = 2080;
      v12 = "-[VCNetworkFeedbackController wcmSetCallConfig:interferenceLevel:]";
      v13 = 1024;
      v14 = 272;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d wcmSetCallConfig callback.", (uint8_t *)&v9, 0x1Cu);
    }
  }
  objc_sync_enter(self);

  self->_recommendedSettings = -[VCRecommendedNetworkSettings initWithTargetBitrateCap:]([VCRecommendedNetworkSettings alloc], "initWithTargetBitrateCap:", v4);
  v8 = (void *)MEMORY[0x1DF086F1C](&self->_weakDelegate);
  objc_msgSend(v8, "recommendedSettingsChanged:", self->_recommendedSettings);
  if (v8)
    CFRelease(v8);
  objc_sync_exit(self);
}

- (void)wcmGetCallConfig:(unsigned int *)a3 targetBitrate:(unsigned int *)a4
{
  uint64_t v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315650;
      v10 = v7;
      v11 = 2080;
      v12 = "-[VCNetworkFeedbackController wcmGetCallConfig:targetBitrate:]";
      v13 = 1024;
      v14 = 284;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d wcmGetCallConfig callback.", (uint8_t *)&v9, 0x1Cu);
    }
  }
  objc_sync_enter(self);
  *a3 = -[VCNetworkFeedbackController clientTargetBitrateCap](self, "clientTargetBitrateCap");
  *a4 = -[VCNetworkFeedbackController clientTargetBitrate](self, "clientTargetBitrate");
  objc_sync_exit(self);
}

- (void)setupWCMClient
{
  VCWCMClient *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (MEMORY[0x1E0DD9AE8] && WCMEnabled())
  {
    if ((NetworkUtils_IsLTEOrNewer(-[VCConnectionManager getCellularTechForActiveConnectionWithQuality:forLocalInterface:](self->_connectionManager, "getCellularTechForActiveConnectionWithQuality:forLocalInterface:", 1, 1)) & 1) != 0)
    {
      if (!self->_WCMClient)
      {
        v3 = objc_alloc_init(VCWCMClient);
        self->_WCMClient = v3;
        -[VCWCMClient setWcmClientDelegate:](v3, "setWcmClientDelegate:", self);
        -[VCWCMClient startWCMClient](self->_WCMClient, "startWCMClient");
      }
      return;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v8 = 136315650;
        v9 = v7;
        v10 = 2080;
        v11 = "-[VCNetworkFeedbackController setupWCMClient]";
        v12 = 1024;
        v13 = 298;
        v6 = " [%s] %s:%d non-LTE RAT not supported.";
        goto LABEL_9;
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315650;
      v9 = v4;
      v10 = 2080;
      v11 = "-[VCNetworkFeedbackController setupWCMClient]";
      v12 = 1024;
      v13 = 308;
      v6 = " [%s] %s:%d not supported on this device.";
LABEL_9:
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v8, 0x1Cu);
    }
  }
}

- (void)cleanupWCMClient
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
  if (MEMORY[0x1E0DD9AE8] && WCMEnabled())
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
        v8 = "-[VCNetworkFeedbackController cleanupWCMClient]";
        v9 = 1024;
        v10 = 317;
        _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d cleanup start.", (uint8_t *)&v5, 0x1Cu);
      }
    }
    -[VCWCMClient stopWCMClient](self->_WCMClient, "stopWCMClient");
    -[VCWCMClient setWcmClientDelegate:](self->_WCMClient, "setWcmClientDelegate:", 0);

    self->_WCMClient = 0;
  }
}

- (void)setupWRMClientWithMetricsConfig:(id)a3
{
  int v3;
  uint64_t v5;
  NSObject *v6;
  WRMClient *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!self->_WRMClient)
  {
    v3 = *(_DWORD *)&a3.var0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v8 = 136315650;
        v9 = v5;
        v10 = 2080;
        v11 = "-[VCNetworkFeedbackController setupWRMClientWithMetricsConfig:]";
        v12 = 1024;
        v13 = 329;
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient setup start.", (uint8_t *)&v8, 0x1Cu);
      }
    }
    -[VCConnectionManager setWRMUpdateCallback:requestNotificationCallback:withContext:completionHandler:](self->_connectionManager, "setWRMUpdateCallback:requestNotificationCallback:withContext:completionHandler:", VCCMWRMStatusUpdateCallback, VCCMWRMRequestNotificationCallback, self, 0);
    v7 = -[WRMClient initWithDelegate:]([WRMClient alloc], "initWithDelegate:", self);
    self->_WRMClient = v7;
    -[WRMClient startWRMClientWithMode:metricsConfig:](v7, "startWRMClientWithMode:metricsConfig:", 1, *(_QWORD *)&v3 & 0xFFFFFFLL);
  }
}

- (void)cleanupWRMClient
{
  uint64_t v3;
  NSObject *v4;
  NSObject *wrmClientQueue;
  int8x16_t v6;
  _QWORD v7[4];
  int8x16_t v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v10 = v3;
      v11 = 2080;
      v12 = "-[VCNetworkFeedbackController cleanupWRMClient]";
      v13 = 1024;
      v14 = 339;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient cleanup start.", buf, 0x1Cu);
    }
  }
  wrmClientQueue = self->_wrmClientQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__VCNetworkFeedbackController_cleanupWRMClient__block_invoke;
  v7[3] = &unk_1E9E52238;
  v6 = *(int8x16_t *)&self->_WRMClient;
  self->_WRMClient = 0;
  v8 = vextq_s8(v6, v6, 8uLL);
  dispatch_async(wrmClientQueue, v7);
}

uint64_t __47__VCNetworkFeedbackController_cleanupWRMClient__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __47__VCNetworkFeedbackController_cleanupWRMClient__block_invoke_2;
  v3[3] = &unk_1E9E521C0;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "setWRMUpdateCallback:requestNotificationCallback:withContext:completionHandler:", 0, 0, 0, v3);
}

void __47__VCNetworkFeedbackController_cleanupWRMClient__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "stopWRMClient");

}

- (void)setDownlinkTargetBitrate:(unsigned int)a3
{
  self->_downlinkTargetBitrate = a3;
  -[VCConnectionManager setDuplicationDownlinkCellBitrateCap:currentBitrate:](self->_connectionManager, "setDuplicationDownlinkCellBitrateCap:currentBitrate:", self->_downlinkTargetCellBitrateCap, *(_QWORD *)&a3);
}

- (void)setDownlinkTargetCellBitrateCap:(unsigned int)a3
{
  uint64_t v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  unsigned int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  self->_downlinkTargetCellBitrateCap = a3;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315906;
      v7 = v4;
      v8 = 2080;
      v9 = "-[VCNetworkFeedbackController setDownlinkTargetCellBitrateCap:]";
      v10 = 1024;
      v11 = 360;
      v12 = 1024;
      v13 = a3;
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: Update cellBitrateCap for pending iRAT notification purpose: %d", (uint8_t *)&v6, 0x22u);
    }
  }
}

- (void)setIsLocalCellular:(BOOL)a3
{
  tagWRMMetricsInfo *wrmInfo;

  self->_isLocalCellular = a3;
  wrmInfo = self->_wrmInfo;
  if (wrmInfo)
    wrmInfo->isLocalCellular = a3;
}

- (void)setIsVideoPaused:(BOOL)a3
{
  tagWRMMetricsInfo *wrmInfo;

  self->_isVideoPaused = a3;
  wrmInfo = self->_wrmInfo;
  if (wrmInfo)
    wrmInfo->isVideoPaused = a3;
}

- (unsigned)clientTargetBitrate
{
  return self->_clientTargetBitrate;
}

- (void)setClientTargetBitrate:(unsigned int)a3
{
  self->_clientTargetBitrate = a3;
}

- (unsigned)clientTargetBitrateCap
{
  return self->_clientTargetBitrateCap;
}

- (void)setClientTargetBitrateCap:(unsigned int)a3
{
  self->_clientTargetBitrateCap = a3;
}

- (unsigned)downlinkTargetBitrate
{
  return self->_downlinkTargetBitrate;
}

- (unsigned)downlinkTargetCellBitrateCap
{
  return self->_downlinkTargetCellBitrateCap;
}

- (tagWRMMetricsInfo)wrmInfo
{
  return self->_wrmInfo;
}

- ($A43176E2CA7897F9838817DB2FB1B08B)wrmContext
{
  return self->_wrmContext;
}

- (unsigned)callID
{
  return self->_callID;
}

- (void)setCallID:(unsigned int)a3
{
  self->_callID = a3;
}

- (BOOL)isLocalCellular
{
  return self->_isLocalCellular;
}

- (BOOL)isVideoPaused
{
  return self->_isVideoPaused;
}

- (BOOL)shouldSendFeedbackControllerReport
{
  return self->_shouldSendFeedbackControllerReport;
}

- (void)setShouldSendFeedbackControllerReport:(BOOL)a3
{
  self->_shouldSendFeedbackControllerReport = a3;
}

- (void)sendStatusUpdate:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d WRM status update cannot be null", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)reportWRMMetrics:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d WRM metric report cannot be null", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
