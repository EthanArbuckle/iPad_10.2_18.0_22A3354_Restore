@implementation VCSessionStatsController

- (VCSessionStatsController)initWithDelegate:(id)a3 connectionManager:(id)a4 uplinkStatsCollector:(id)a5 downlinkStatsCollector:(id)a6 reportingAgent:(opaqueRTCReporting *)a7 transportSessionID:(unsigned int)a8 streamID:(unsigned __int16)a9 mediaQueue:(tagVCMediaQueue *)a10
{
  uint64_t v10;
  VCSessionStatsController *v16;
  VCSessionStatsController *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  VCTransportStreamGFT *transportStream;
  NSObject *CustomRootQueue;
  objc_super v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  VCSessionStatsController *v32;
  __int16 v33;
  VCTransportStreamGFT *v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v10 = *(_QWORD *)&a8;
  v37 = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)VCSessionStatsController;
  v16 = -[VCSessionStatsController init](&v24, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeWeak((id *)&v16->_weakDelegate, a3);
    objc_storeWeak(&v17->_reportingAgentWeak, a7);
    *(_QWORD *)&v17->_remoteStats.linkID = 0;
    *(_QWORD *)&v17->_remoteStats.uplinkBandwidthSample = 0;
    v17->_remoteStats.responseTime = 0.0;
    v17->_statsRequestCounter = 0;
    v17->_streamID = a9;
    v17->_uplinkStatisticsCollector = (AVCStatisticsCollector *)a5;
    v17->_downlinkStatisticsCollector = (AVCStatisticsCollector *)a6;
    v17->_connectionManager = (VCConnectionManager *)a4;
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", &unk_1E9EF65A8, CFSTR("transportStreamStreamTypeKey"), 0);
    v17->_transportStream = -[VCTransportStreamGFT initWithTransportSessionID:options:]([VCTransportStreamGFT alloc], "initWithTransportSessionID:options:", v10, v18);

    -[VCTransportStreamGFT setMediaQueue:](v17->_transportStream, "setMediaQueue:", a10);
    v17->_statsArrayIndex = -1;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v19 = VRTraceErrorLogLevelToCSTR();
      v20 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        transportStream = v17->_transportStream;
        *(_DWORD *)buf = 136316418;
        v26 = v19;
        v27 = 2080;
        v28 = "-[VCSessionStatsController initWithDelegate:connectionManager:uplinkStatsCollector:downlinkStatsCollector:"
              "reportingAgent:transportSessionID:streamID:mediaQueue:]";
        v29 = 1024;
        v30 = 70;
        v31 = 2048;
        v32 = v17;
        v33 = 2048;
        v34 = transportStream;
        v35 = 1024;
        v36 = v10;
        _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d stats controller [%p] init with transportStream [%p] and transportSessionId: %u", buf, 0x36u);
      }
    }
    -[VCSessionStatsController flushRealTimeReportingStats](v17, "flushRealTimeReportingStats");
    -[VCSessionStatsController registerPeriodicTask](v17, "registerPeriodicTask");
    v17->_statsReportingInterval = 2.0;
    v17->_enableStatsReporting = -[VCDefaults enableGFTStatsReporting](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "enableGFTStatsReporting");
    v17->_enableStatsReceiveThread = -[VCDefaults enableGFTStatsReceiveThread](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "enableGFTStatsReceiveThread");
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(56);
    v17->_statsRequestQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.vcsessionStatsController.requestQueue", 0, CustomRootQueue);
  }
  return v17;
}

- (void)dealloc
{
  uint64_t v3;
  NSObject *v4;
  unsigned int numStatsDroppedDueToLinkID;
  unsigned int numStatsDroppedDueToStatsID;
  unsigned int numStatsProcessed;
  unsigned int numStatsDroppedDueToTooLate;
  objc_super v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  VCSessionStatsController *v17;
  __int16 v18;
  unsigned int v19;
  __int16 v20;
  unsigned int v21;
  __int16 v22;
  unsigned int v23;
  __int16 v24;
  unsigned int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      numStatsDroppedDueToStatsID = self->_numStatsDroppedDueToStatsID;
      numStatsDroppedDueToLinkID = self->_numStatsDroppedDueToLinkID;
      numStatsDroppedDueToTooLate = self->_numStatsDroppedDueToTooLate;
      numStatsProcessed = self->_numStatsProcessed;
      *(_DWORD *)buf = 136316930;
      v11 = v3;
      v12 = 2080;
      v13 = "-[VCSessionStatsController dealloc]";
      v14 = 1024;
      v15 = 83;
      v16 = 2048;
      v17 = self;
      v18 = 1024;
      v19 = numStatsProcessed;
      v20 = 1024;
      v21 = numStatsDroppedDueToLinkID;
      v22 = 1024;
      v23 = numStatsDroppedDueToStatsID;
      v24 = 1024;
      v25 = numStatsDroppedDueToTooLate;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d dealloc [%p] with statsCount:[%u, %u, %u, %u]", buf, 0x3Eu);
    }
  }
  -[VCSessionStatsController flushRealTimeReportingStats](self, "flushRealTimeReportingStats");
  -[VCSessionStatsController deregisterPeriodicTask](self, "deregisterPeriodicTask");
  objc_storeWeak((id *)&self->_weakDelegate, 0);
  objc_storeWeak(&self->_reportingAgentWeak, 0);

  dispatch_release((dispatch_object_t)self->_statsRequestQueue);
  v9.receiver = self;
  v9.super_class = (Class)VCSessionStatsController;
  -[VCSessionStatsController dealloc](&v9, sel_dealloc);
}

- (void)reset
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
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315650;
      v6 = v3;
      v7 = 2080;
      v8 = "-[VCSessionStatsController reset]";
      v9 = 1024;
      v10 = 97;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d session stats controller reset", (uint8_t *)&v5, 0x1Cu);
    }
  }
  self->_lastTriggerRateControlTime = 0.0;
  *(_QWORD *)&self->_previousTotalPacketSent = 0;
  *(_QWORD *)&self->_uplinkMostRecentSendTimestamp = 0;
  self->_didReceiveServerStatsResponse = 0;
}

- (void)sendLocalStats
{
  _DWORD v3[374];
  unsigned __int16 streamID;
  char v5;
  char v6;
  __int16 statsRequestCounter;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  bzero(v3, 0x628uLL);
  statsRequestCounter = self->_statsRequestCounter;
  v6 = 1;
  streamID = self->_streamID;
  v5 = 1;
  v3[373] = 800;
  -[VCTransportStreamGFT VCTransportStreamSendPacket:](self->_transportStream, "VCTransportStreamSendPacket:", v3);
}

- (void)startLocalSessionStatsUpdate
{
  -[VCSessionStatsController startLocalSessionStatsReceive](self, "startLocalSessionStatsReceive");
  -[VCSessionStatsController startLocalSessionStatsSend](self, "startLocalSessionStatsSend");
}

- (void)startLocalSessionStatsReceive
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d VCRealTimeThread_Initialize for session stats controller thread FAILED", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

double __57__VCSessionStatsController_startLocalSessionStatsReceive__block_invoke(uint64_t a1, uint64_t a2, unsigned __int8 *a3)
{
  double result;

  if (a2)
  {
    _VCSessionStatsController_HandleRemoteSessionStats(a2, a3);
    return _VCSessionStatsController_HealthPrintForServerStats(a2);
  }
  return result;
}

- (void)startLocalSessionStatsSend
{
  NSObject *localSessionStatsTimemoutSource;
  OS_dispatch_source *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  dispatch_time_t v8;
  NSObject *v9;
  _QWORD handler[5];
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  localSessionStatsTimemoutSource = self->_localSessionStatsTimemoutSource;
  if (localSessionStatsTimemoutSource)
  {
    dispatch_release(localSessionStatsTimemoutSource);
    self->_localSessionStatsTimemoutSource = 0;
  }
  v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_statsRequestQueue);
  self->_localSessionStatsTimemoutSource = v4;
  if (v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v12 = v5;
        v13 = 2080;
        v14 = "-[VCSessionStatsController startLocalSessionStatsSend]";
        v15 = 1024;
        v16 = 148;
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d start local session stats update", buf, 0x1Cu);
      }
    }
    v7 = self->_localSessionStatsTimemoutSource;
    v8 = dispatch_walltime(0, 0);
    dispatch_source_set_timer(v7, v8, 0x56C8CC0uLL, 0x989680uLL);
    v9 = self->_localSessionStatsTimemoutSource;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __54__VCSessionStatsController_startLocalSessionStatsSend__block_invoke;
    handler[3] = &unk_1E9E521C0;
    handler[4] = self;
    dispatch_source_set_event_handler(v9, handler);
    dispatch_resume((dispatch_object_t)self->_localSessionStatsTimemoutSource);
  }
}

void __54__VCSessionStatsController_startLocalSessionStatsSend__block_invoke(uint64_t a1)
{
  double v2;
  uint64_t v3;
  const void *v4;
  uint64_t v5;
  BOOL v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  __int128 v11;
  unint64_t v12;
  __int128 v13;
  unint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = micro();
  objc_msgSend(*(id *)(a1 + 32), "sendLocalStats");
  v3 = VCConnectionManager_CopyPrimaryConnection(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
  v4 = (const void *)v3;
  v5 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v5 + 152))
    v6 = v3 == 0;
  else
    v6 = 1;
  if (v6)
  {
    if (!v3)
      goto LABEL_14;
  }
  else if (v2 - *(double *)(v5 + 96) > 0.546)
  {
    v14 = 0xAAAAAAAAAAAAAAAALL;
    v13 = xmmword_1D910F800;
    v7 = (void *)objc_msgSend(*(id *)(v5 + 80), "statsRecorder");
    if (v7)
    {
      objc_msgSend(v7, "getMostRecentLocalStats");
    }
    else
    {
      v13 = 0uLL;
      v14 = 0;
    }
    v10 = *(_QWORD *)(a1 + 32);
    v11 = v13;
    v12 = v14;
    _VCSessionStatsController_TriggerRateControl(v10, (uint64_t)&v11, 1, 0, v2, v8, v9);
    *(double *)(*(_QWORD *)(a1 + 32) + 96) = v2;
  }
  CFRelease(v4);
  v5 = *(_QWORD *)(a1 + 32);
LABEL_14:
  ++*(_DWORD *)(v5 + 72);
}

- (void)stopLocalSessionStatsUpdate
{
  NSObject *v3;
  NSObject *localSessionStatsTimemoutSource;
  NSObject *v5;
  _QWORD v6[6];

  v6[5] = *MEMORY[0x1E0C80C00];
  if (self->_enableStatsReceiveThread)
  {
    VCRealTimeThread_Stop((uint64_t)self->_statsReceiveThread);
    -[VCTransportStreamGFT VCTransportStreamUnblock](self->_transportStream, "VCTransportStreamUnblock");
    VCRealTimeThread_Finalize((uint64_t)self->_statsReceiveThread);
    self->_statsReceiveThread = 0;
  }
  else
  {
    -[VCTransportStreamGFT unregisterPacketCallback](self->_transportStream, "unregisterPacketCallback");
  }
  if (self->_localSessionStatsTimemoutSource)
  {
    v3 = dispatch_semaphore_create(0);
    localSessionStatsTimemoutSource = self->_localSessionStatsTimemoutSource;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __55__VCSessionStatsController_stopLocalSessionStatsUpdate__block_invoke;
    v6[3] = &unk_1E9E521C0;
    v6[4] = v3;
    dispatch_source_set_cancel_handler(localSessionStatsTimemoutSource, v6);
    dispatch_source_cancel((dispatch_source_t)self->_localSessionStatsTimemoutSource);
    dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v3);
    v5 = self->_localSessionStatsTimemoutSource;
    if (v5)
    {
      dispatch_release(v5);
      self->_localSessionStatsTimemoutSource = 0;
    }
  }
}

intptr_t __55__VCSessionStatsController_stopLocalSessionStatsUpdate__block_invoke(uint64_t a1)
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
      v8 = "-[VCSessionStatsController stopLocalSessionStatsUpdate]_block_invoke";
      v9 = 1024;
      v10 = 189;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d stop local session stats update completely", (uint8_t *)&v5, 0x1Cu);
    }
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (unsigned)translateTimestampFromMicro:(double)a3
{
  unint64_t v3;

  v3 = MicroToNTP(a3);
  return NTPToMiddle32(v3) >> 6;
}

- (id)reportingAgent
{
  return objc_loadWeak(&self->_reportingAgentWeak);
}

- (void)registerPeriodicTask
{
  -[VCSessionStatsController reportingAgent](self, "reportingAgent");
  reportingRegisterPeriodicTaskWeak();
}

uint64_t __48__VCSessionStatsController_registerPeriodicTask__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "periodicTask:");
}

- (void)periodicTask:(void *)a3
{
  double v5;
  double v6;
  unsigned int uplinkServerStatsByteUsed;
  int v8;
  int minSentRate;
  double maxSentRate;
  double v11;
  int v12;
  unsigned int downlinkServerStatsByteUsed;
  int v14;
  int maxReceivedRate;
  int minReceivedRate;
  double v17;
  double v18;
  int v19;

  v5 = micro();
  v6 = v5 - self->_lastUpdateTime;
  self->_lastUpdateTime = v5;
  uplinkServerStatsByteUsed = self->_uplinkServerStatsByteUsed;
  v8 = uplinkServerStatsByteUsed - self->_lastProcessedBytesSent;
  self->_lastProcessedBytesSent = uplinkServerStatsByteUsed;
  if (v6 == 0.0)
  {
    v12 = 0;
    self->_maxSentRate = 0;
  }
  else
  {
    minSentRate = self->_minSentRate;
    maxSentRate = (double)self->_maxSentRate;
    v11 = (double)v8 / v6;
    if (v11 > maxSentRate)
      maxSentRate = (double)v8 / v6;
    self->_maxSentRate = (int)maxSentRate;
    if (v11 > (double)minSentRate)
      v11 = (double)minSentRate;
    v12 = (int)v11;
  }
  self->_bytesSentToReport += v8;
  downlinkServerStatsByteUsed = self->_downlinkServerStatsByteUsed;
  v14 = downlinkServerStatsByteUsed - self->_lastProcessedBytesReceived;
  self->_minSentRate = v12;
  self->_lastProcessedBytesReceived = downlinkServerStatsByteUsed;
  if (v6 == 0.0)
  {
    v19 = 0;
    self->_maxReceivedRate = 0;
  }
  else
  {
    maxReceivedRate = self->_maxReceivedRate;
    minReceivedRate = self->_minReceivedRate;
    v17 = (double)v14 / v6;
    if (v17 <= (double)maxReceivedRate)
      v18 = (double)maxReceivedRate;
    else
      v18 = (double)v14 / v6;
    self->_maxReceivedRate = (int)v18;
    if (v17 > (double)minReceivedRate)
      v17 = (double)minReceivedRate;
    v19 = (int)v17;
  }
  self->_minReceivedRate = v19;
  self->_bytesReceivedToReport += v14;
  if (a3)
  {
    objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:"), CFSTR("SSMinBytesSent"));
    objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_maxSentRate), CFSTR("SSMaxBytesSent"));
    objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_bytesSentToReport), CFSTR("SSRawBytesSent"));
    objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_minReceivedRate), CFSTR("SSMinBytesReceived"));
    objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_maxReceivedRate), CFSTR("SSMaxBytesReceived"));
    objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_bytesReceivedToReport), CFSTR("SSRawBytesReceived"));
    -[VCSessionStatsController flushRealTimeReportingStats](self, "flushRealTimeReportingStats");
  }
}

- (void)deregisterPeriodicTask
{
  -[VCSessionStatsController reportingAgent](self, "reportingAgent");
  reportingUnregisterPeriodicTask();
}

- (void)flushRealTimeReportingStats
{
  self->_minSentRate = 0x7FFFFFFF;
  self->_minReceivedRate = 0x7FFFFFFF;
  *(_QWORD *)&self->_bytesSentToReport = 0;
  *(_QWORD *)&self->_bytesReceivedToReport = 0;
}

- (double)statsReportingInterval
{
  return self->_statsReportingInterval;
}

- (void)setStatsReportingInterval:(double)a3
{
  self->_statsReportingInterval = a3;
}

- (BOOL)didReceiveServerStatsResponse
{
  return self->_didReceiveServerStatsResponse;
}

@end
