@implementation VCVideoStreamRateAdaptationFeedbackOnly

- (VCVideoStreamRateAdaptationFeedbackOnly)initWithMediaStreamRateAdaptationParam:(const tagVCMediaStreamRateAdaptationParams *)a3
{
  id var8;
  VCVideoStreamRateAdaptationFeedbackOnly *v5;
  VCVideoStreamRateAdaptationFeedbackOnly *v6;
  double v7;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  objc_super v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  VCVideoStreamRateAdaptationFeedbackOnly *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  var8 = a3->var8;
  v17.receiver = self;
  v17.super_class = (Class)VCVideoStreamRateAdaptationFeedbackOnly;
  v5 = -[VCMediaStreamRateAdaptation initWithDelegate:params:](&v17, sel_initWithDelegate_params_, var8, a3);
  v6 = v5;
  if (v5)
  {
    v5->super._rtpHandle = a3->var5;
    v5->super._reportingAgent = a3->var2;
    v5->super._reportingModuleID = VCReporting_GetDynamicReportingModuleID();
    reportingInheritModuleSpecificInfoFromParent();
    v6->_statisticsCollector = -[AVCRateController statisticsCollector](v6->super.super._vcrcRateController, "statisticsCollector");
    v6->super._rateAdaptationEnabled = 0;
    v6->_useLowPrecisionEchoTimeStamp = a3->var7;
    +[VCDefaults getDoubleValueForKey:defaultValue:](VCDefaults, "getDoubleValueForKey:defaultValue:", CFSTR("videoStreamAverageBitrateWindowDuration"), 1.0);
    v6->super._averageBitrateWindowDuration = v7;
    if ((VCVideoStreamRateAdaptationFeedbackOnly *)objc_opt_class() == v6)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v19 = v9;
          v20 = 2080;
          v21 = "-[VCVideoStreamRateAdaptationFeedbackOnly initWithMediaStreamRateAdaptationParam:]";
          v22 = 1024;
          v23 = 52;
          v11 = " [%s] %s:%d ";
          v12 = v10;
          v13 = 28;
LABEL_12:
          _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v8 = (const __CFString *)-[VCVideoStreamRateAdaptationFeedbackOnly performSelector:](v6, "performSelector:", sel_logPrefix);
      else
        v8 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v14 = VRTraceErrorLogLevelToCSTR();
        v15 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          v19 = v14;
          v20 = 2080;
          v21 = "-[VCVideoStreamRateAdaptationFeedbackOnly initWithMediaStreamRateAdaptationParam:]";
          v22 = 1024;
          v23 = 52;
          v24 = 2112;
          v25 = v8;
          v26 = 2048;
          v27 = v6;
          v11 = " [%s] %s:%d %@(%p) ";
          v12 = v15;
          v13 = 48;
          goto LABEL_12;
        }
      }
    }
  }
  return v6;
}

- (void)dealloc
{
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
  objc_super v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  VCVideoStreamRateAdaptationFeedbackOnly *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if ((VCVideoStreamRateAdaptationFeedbackOnly *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v13 = v4;
        v14 = 2080;
        v15 = "-[VCVideoStreamRateAdaptationFeedbackOnly dealloc]";
        v16 = 1024;
        v17 = 58;
        v6 = " [%s] %s:%d ";
        v7 = v5;
        v8 = 28;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)-[VCVideoStreamRateAdaptationFeedbackOnly performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v13 = v9;
        v14 = 2080;
        v15 = "-[VCVideoStreamRateAdaptationFeedbackOnly dealloc]";
        v16 = 1024;
        v17 = 58;
        v18 = 2112;
        v19 = v3;
        v20 = 2048;
        v21 = self;
        v6 = " [%s] %s:%d %@(%p) ";
        v7 = v10;
        v8 = 48;
        goto LABEL_11;
      }
    }
  }
  -[VCVideoStreamRateAdaptationFeedbackOnly stopFeedbackSource](self, "stopFeedbackSource");

  v11.receiver = self;
  v11.super_class = (Class)VCVideoStreamRateAdaptationFeedbackOnly;
  -[VCVideoStreamRateAdaptation dealloc](&v11, sel_dealloc);
}

- (void)setEnableRateAdaptation:(BOOL)a3 maxBitrate:(unsigned int)a4 minBitrate:(unsigned int)a5 adaptationInterval:(double)a6
{
  if (self->super._rateAdaptationEnabled != a3)
  {
    self->super._rateAdaptationEnabled = a3;
    if (a3)
      -[VCVideoStreamRateAdaptationFeedbackOnly startFeedbackSource](self, "startFeedbackSource", a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
    else
      -[VCVideoStreamRateAdaptationFeedbackOnly stopFeedbackSource](self, "stopFeedbackSource", a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
  }
}

- (void)startFeedbackSource
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d RTPGetPreferredSendQueue failed %x", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

uint64_t __62__VCVideoStreamRateAdaptationFeedbackOnly_startFeedbackSource__block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "strong"), "sendRateControlFeedback");
}

- (void)stopFeedbackSource
{
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  VCVideoStreamRateAdaptationFeedbackOnly *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (self->_rateControlFeedbackSource)
  {
    if ((VCVideoStreamRateAdaptationFeedbackOnly *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_13;
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      v11 = 136315650;
      v12 = v4;
      v13 = 2080;
      v14 = "-[VCVideoStreamRateAdaptationFeedbackOnly stopFeedbackSource]";
      v15 = 1024;
      v16 = 114;
      v6 = " [%s] %s:%d Stop VCRC rate control feedback";
      v7 = v5;
      v8 = 28;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v3 = (const __CFString *)-[VCVideoStreamRateAdaptationFeedbackOnly performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v3 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_13;
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      v11 = 136316162;
      v12 = v9;
      v13 = 2080;
      v14 = "-[VCVideoStreamRateAdaptationFeedbackOnly stopFeedbackSource]";
      v15 = 1024;
      v16 = 114;
      v17 = 2112;
      v18 = v3;
      v19 = 2048;
      v20 = self;
      v6 = " [%s] %s:%d %@(%p) Stop VCRC rate control feedback";
      v7 = v10;
      v8 = 48;
    }
    _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v11, v8);
LABEL_13:
    dispatch_source_cancel((dispatch_source_t)self->_rateControlFeedbackSource);
    dispatch_release((dispatch_object_t)self->_rateControlFeedbackSource);
    self->_rateControlFeedbackSource = 0;
  }
}

- (void)sendRateControlFeedback
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to VCMediaControlInfoSerializeWithData %X", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)updateRTPReceiveWithTimestamp:(unsigned int)a3 sampleRate:(unsigned int)a4 time:(double)a5 size:(unsigned int)a6 endOfFrame:(BOOL)a7
{
  unsigned int previousRTPTimestamp;
  unsigned int totalPacketsReceived;
  AVCStatisticsCollector *statisticsCollector;
  AVCStatisticsCollector *v16;
  uint64_t v17;
  double v18;
  __int128 v19;
  unsigned int v20;
  unsigned int v21;
  double v22;
  _BYTE v23[152];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  self->_didReceiveVideo = 1;
  ++self->_totalPacketsReceived;
  previousRTPTimestamp = self->_previousRTPTimestamp;
  if (previousRTPTimestamp)
  {
    if (a3 != previousRTPTimestamp && a3 - previousRTPTimestamp < 0x7FFFFFFF)
    {
      self->_lastTimestamp = a3;
      self->_lastTimestampReceiveTime = a5;
      memset(&v23[8], 0, 144);
      totalPacketsReceived = self->_totalPacketsReceived;
      statisticsCollector = self->_statisticsCollector;
      v17 = 7;
      v18 = a5;
      *(_QWORD *)&v19 = 0;
      DWORD2(v19) = 4;
      HIDWORD(v19) = a3;
      v20 = a4;
      v21 = totalPacketsReceived;
      v22 = 0.0;
      *(double *)v23 = a5;
      VCRateControlSetStatistics(statisticsCollector, &v17);
      self->_previousRTPTimestamp = a3;
    }
  }
  else
  {
    self->_previousRTPTimestamp = a3;
  }
  *(_QWORD *)((char *)&v19 + 5) = 0;
  *(_QWORD *)&v19 = 0;
  memset(&v23[4], 0, 148);
  v16 = self->_statisticsCollector;
  v17 = 4;
  v18 = a5;
  BYTE13(v19) = 1;
  HIWORD(v19) = a7;
  v20 = a3;
  v21 = a6;
  v22 = a5;
  *(_DWORD *)v23 = a3;
  VCRateControlSetStatistics(v16, &v17);
}

- (void)updateRateControlInfoWithStatisticsMessage:(tagVCStatisticsMessage *)a3
{
  AVCStatisticsCollector *statisticsCollector;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _OWORD v10[12];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  statisticsCollector = self->_statisticsCollector;
  if (statisticsCollector)
  {
    v4 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 152);
    v10[10] = *(_OWORD *)((char *)&a3->var0.localRCEvent + 136);
    v10[11] = v4;
    v11 = *((_QWORD *)&a3->var0.localRCEvent + 21);
    v5 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 88);
    v10[6] = *(_OWORD *)(&a3->var0.localRCEvent + 3);
    v10[7] = v5;
    v6 = *(_OWORD *)(&a3->var0.localRCEvent + 5);
    v10[8] = *(_OWORD *)((char *)&a3->var0.localRCEvent + 104);
    v10[9] = v6;
    v7 = *(_OWORD *)(&a3->var0.localRCEvent + 1);
    v10[2] = *(_OWORD *)&a3->var0.rtcpRR.lastSequenceNumber;
    v10[3] = v7;
    v8 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 56);
    v10[4] = *(_OWORD *)((char *)&a3->var0.localRCEvent + 40);
    v10[5] = v8;
    v9 = *(_OWORD *)&a3->isVCRCInternal;
    v10[0] = *(_OWORD *)&a3->type;
    v10[1] = v9;
    VCRateControlSetStatistics(statisticsCollector, v10);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCVideoStreamRateAdaptationFeedbackOnly updateRateControlInfoWithStatisticsMessage:].cold.1();
  }
}

- (double)owrd
{
  _OWORD v3[3];
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v5 = 0u;
  v6 = 0u;
  v4 = 0u;
  memset(v3, 0, sizeof(v3));
  VCRateControlGetStatistics((uint64_t)self->_statisticsCollector, 7, (uint64_t)v3);
  return *((double *)&v4 + 1);
}

- (BOOL)didReceiveVideo
{
  return self->_didReceiveVideo;
}

- (void)setDidReceiveVideo:(BOOL)a3
{
  self->_didReceiveVideo = a3;
}

- (void)updateRateControlInfoWithStatisticsMessage:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Update VCRC information when _statisticsCollector is nil!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
