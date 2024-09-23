@implementation VCAudioStreamTransport

- (void)reportWRMMetrics:(id *)a3
{
  -[WRMClient reportMetricsWifiCalling:](self->_wrmClient, "reportMetricsWifiCalling:", a3);
}

- (VCAudioStreamTransport)initWithHandle:(tagHANDLE *)a3 callId:(unsigned int)a4 localSSRC:(unsigned int)a5
{
  return -[VCAudioStreamTransport initWithHandle:callId:localSSRC:enableNetworkMonitor:](self, "initWithHandle:callId:localSSRC:enableNetworkMonitor:", a3, *(_QWORD *)&a4, *(_QWORD *)&a5, 1);
}

- (VCAudioStreamTransport)initWithHandle:(tagHANDLE *)a3 callId:(unsigned int)a4 localSSRC:(unsigned int)a5 enableNetworkMonitor:(BOOL)a6
{
  _BOOL4 v6;
  uint64_t v7;
  VCAudioStreamTransport *v8;
  VCAudioStreamTransport *v9;
  int v10;
  int v11;
  const __CFString *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  objc_super v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  VCAudioStreamTransport *v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v6 = a6;
  v7 = *(_QWORD *)&a4;
  v31 = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)VCAudioStreamTransport;
  v8 = -[VCMediaStreamTransport initWithHandle:localSSRC:](&v18, sel_initWithHandle_localSSRC_, a3, *(_QWORD *)&a5);
  v9 = v8;
  if (v8)
  {
    v8->super._payloadType = 0;
    if (v6)
    {
      v8->_wrmClient = -[WRMClient initWithDelegate:]([WRMClient alloc], "initWithDelegate:", v8);
      v9->_realtimeContext.rtpHandle = v9->super._rtpHandle;
      WRMInitialize((uint64_t)&v9->_realtimeContext, (uint64_t)v9->super._rtpHandle);
      -[VCAudioStreamTransport setWRMCallId:](v9, "setWRMCallId:", v7);
      v10 = RTPSetWRMInfo((uint64_t)v9->super._rtpHandle, (uint64_t)&v9->_realtimeContext);
      if (v10 < 0)
      {
        v11 = v10;
        if ((VCAudioStreamTransport *)objc_opt_class() == v9)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            v13 = VRTraceErrorLogLevelToCSTR();
            v14 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCAudioStreamTransport initWithHandle:callId:localSSRC:enableNetworkMonitor:].cold.1(v13, v11, v14);
          }
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v12 = (const __CFString *)-[VCAudioStreamTransport performSelector:](v9, "performSelector:", sel_logPrefix);
          else
            v12 = &stru_1E9E58EE0;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            v15 = VRTraceErrorLogLevelToCSTR();
            v16 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136316418;
              v20 = v15;
              v21 = 2080;
              v22 = "-[VCAudioStreamTransport initWithHandle:callId:localSSRC:enableNetworkMonitor:]";
              v23 = 1024;
              v24 = 56;
              v25 = 2112;
              v26 = v12;
              v27 = 2048;
              v28 = v9;
              v29 = 1024;
              v30 = v11;
              _os_log_error_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to set the WRM info. Error=%d", buf, 0x36u);
            }
          }
        }

        return 0;
      }
    }
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  WRMUninitialize((uint64_t)&self->_realtimeContext);

  v3.receiver = self;
  v3.super_class = (Class)VCAudioStreamTransport;
  -[VCMediaStreamTransport dealloc](&v3, sel_dealloc);
}

- (void)realtimeContext
{
  return &self->_realtimeContext;
}

- (int)onStart
{
  int v3;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)VCAudioStreamTransport;
  v3 = -[VCMediaStreamTransport onStart](&v5, sel_onStart);
  if ((v3 & 0x80000000) == 0)
    -[VCAudioStreamTransport startWRM](self, "startWRM");
  return v3;
}

- (void)onStop
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[VCAudioStreamTransport stopWRM](self, "stopWRM");
  v3.receiver = self;
  v3.super_class = (Class)VCAudioStreamTransport;
  -[VCMediaStreamTransport onStop](&v3, sel_onStop);
}

uint64_t __VCAudioStreamTransport_SubmitWRMReportWithJitterBufferMetrics_block_invoke(uint64_t a1)
{
  return WRMSubmitReport(*(_QWORD *)(a1 + 32), a1 + 40);
}

- (void)setWRMCallId:(unsigned int)a3
{
  RTPSetWRMCallId((uint64_t)self->super._rtpHandle, a3);
}

- (void)startWRM
{
  __int128 v3;
  uint64_t (*v4)(_QWORD);
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (self->_wrmClient)
  {
    *(_QWORD *)&v3 = self;
    *((_QWORD *)&v3 + 1) = MEMORY[0x1E0C98BD0];
    v4 = MEMORY[0x1E0C98BC0];
    RTPSetWRMMetricsCallback((uint64_t)self->super._rtpHandle, (uint64_t)WRMReportMetricsCallback_0, &v3);
    -[WRMClient startWRMClientWithMode:metricsConfig:](self->_wrmClient, "startWRMClientWithMode:metricsConfig:", 0, 65793);
  }
}

- (void)stopWRM
{
  if (self->_wrmClient)
  {
    RTPSetWRMMetricsCallback((uint64_t)self->super._rtpHandle, 0, 0);
    -[WRMClient stopWRMClient](self->_wrmClient, "stopWRMClient");
  }
}

- (void)setWRMMetricConfig:(id *)a3
{
  RTPSetWRMMetricConfig((uint64_t)self->super._rtpHandle, (uint64_t *)a3);
}

- (void)initWithHandle:(os_log_t)log callId:localSSRC:enableNetworkMonitor:.cold.1(uint64_t a1, int a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = 136315906;
  v4 = a1;
  v5 = 2080;
  v6 = "-[VCAudioStreamTransport initWithHandle:callId:localSSRC:enableNetworkMonitor:]";
  v7 = 1024;
  v8 = 56;
  v9 = 1024;
  v10 = a2;
  _os_log_error_impl(&dword_1D8A54000, log, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to set the WRM info. Error=%d", (uint8_t *)&v3, 0x22u);
}

@end
