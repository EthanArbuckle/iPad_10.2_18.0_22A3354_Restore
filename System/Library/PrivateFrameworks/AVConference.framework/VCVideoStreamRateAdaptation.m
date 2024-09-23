@implementation VCVideoStreamRateAdaptation

- (VCVideoStreamRateAdaptation)initWithMediaStreamRateAdaptationParam:(const tagVCMediaStreamRateAdaptationParams *)a3
{
  VCVideoStreamRateAdaptation *v4;
  VCVideoStreamRateAdaptation *v5;
  double v6;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  objc_super v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  VCVideoStreamRateAdaptation *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)VCVideoStreamRateAdaptation;
  v4 = -[VCVideoStreamRateAdaptation init](&v16, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_rtpHandle = a3->var5;
    v4->_reportingAgent = a3->var2;
    v4->_reportingModuleID = VCReporting_GetDynamicReportingModuleID();
    reportingInheritModuleSpecificInfoFromParent();
    v5->_rateController = -[VCVideoStreamRateController initWithDumpID:]([VCVideoStreamRateController alloc], "initWithDumpID:", a3->var1);
    v5->_rateAdaptationEnabled = 0;
    +[VCDefaults getDoubleValueForKey:defaultValue:](VCDefaults, "getDoubleValueForKey:defaultValue:", CFSTR("videoStreamAverageBitrateWindowDuration"), 1.0);
    v5->_averageBitrateWindowDuration = v6;
    if ((VCVideoStreamRateAdaptation *)objc_opt_class() == v5)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v18 = v8;
          v19 = 2080;
          v20 = "-[VCVideoStreamRateAdaptation initWithMediaStreamRateAdaptationParam:]";
          v21 = 1024;
          v22 = 40;
          v10 = " [%s] %s:%d ";
          v11 = v9;
          v12 = 28;
LABEL_12:
          _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v7 = (const __CFString *)-[VCVideoStreamRateAdaptation performSelector:](v5, "performSelector:", sel_logPrefix);
      else
        v7 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v13 = VRTraceErrorLogLevelToCSTR();
        v14 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          v18 = v13;
          v19 = 2080;
          v20 = "-[VCVideoStreamRateAdaptation initWithMediaStreamRateAdaptationParam:]";
          v21 = 1024;
          v22 = 40;
          v23 = 2112;
          v24 = v7;
          v25 = 2048;
          v26 = v5;
          v10 = " [%s] %s:%d %@(%p) ";
          v11 = v14;
          v12 = 48;
          goto LABEL_12;
        }
      }
    }
  }
  return v5;
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
  VCVideoStreamRateAdaptation *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if ((VCVideoStreamRateAdaptation *)objc_opt_class() == self)
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
        v15 = "-[VCVideoStreamRateAdaptation dealloc]";
        v16 = 1024;
        v17 = 46;
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
      v3 = (const __CFString *)-[VCVideoStreamRateAdaptation performSelector:](self, "performSelector:", sel_logPrefix);
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
        v15 = "-[VCVideoStreamRateAdaptation dealloc]";
        v16 = 1024;
        v17 = 46;
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

  reportingCacheModuleSpecificInfo();
  v11.receiver = self;
  v11.super_class = (Class)VCVideoStreamRateAdaptation;
  -[VCMediaStreamRateAdaptation dealloc](&v11, sel_dealloc);
}

- (void)setEnableRateAdaptation:(BOOL)a3 maxBitrate:(unsigned int)a4 minBitrate:(unsigned int)a5 adaptationInterval:(double)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  self->_rateAdaptationEnabled = a3;
  if (a3)
  {
    v6 = *(_QWORD *)&a5;
    v7 = *(_QWORD *)&a4;
    -[VCVideoStreamRateController setRateControlInterval:](self->_rateController, "setRateControlInterval:", a6);
    -[VCVideoStreamRateController setMaxTargetBitrate:minTargetBitrate:](self->_rateController, "setMaxTargetBitrate:minTargetBitrate:", v7, v6);
    v9 = -[VCVideoStreamRateController minBitrate](self->_rateController, "minBitrate");
    self->_operatingBitrate = v9;
    -[VCVideoStreamRateAdaptation scheduleTMMBR:](self, "scheduleTMMBR:", v9);
    self->_isOperatingAtMinBitrate = 0;
    self->_isOperatingAtMaxBitrate = 0;
  }
}

- (BOOL)runVideoStreamRateAdaptation
{
  unint64_t v3;
  uint64_t v4;
  NSObject *v5;
  double v6;
  uint64_t v7;
  NSObject *v8;
  double v9;
  double v10;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  unsigned int v22;
  __int16 v23;
  unsigned int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (!self->_rateAdaptationEnabled)
    return 0;
  v13 = -1431655766;
  v14 = -1431655766;
  v12 = -1431655766;
  RTPGetPacketLossMetrics((uint64_t)self->_rtpHandle, &v14, &v13, &v12);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v16 = v4;
      v17 = 2080;
      v18 = "-[VCVideoStreamRateAdaptation runVideoStreamRateAdaptation]";
      v19 = 1024;
      v20 = 81;
      v21 = 1024;
      v22 = v13;
      v23 = 1024;
      v24 = v12;
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d packetsExpectedForInterval:%u packetsLostForInterval:%u", buf, 0x28u);
    }
  }
  if (v13)
  {
    LODWORD(v3) = v12;
    v6 = (double)v3 / (double)v13;
    self->_packetLossPercentage = v6 * 100.0;
    if (self->_sendTmmbrBitrate && !self->_receivedTmmbnBitrate)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCVideoStreamRateAdaptation runVideoStreamRateAdaptation].cold.1(v7, self, v8);
      }
      self->_tmmbRTT = 0.0;
      -[VCVideoStreamRateAdaptation setOperatingBitrate:](self, "setOperatingBitrate:", self->_sendTmmbrBitrate);
    }
    v9 = micro();
    self->_adaptationTime = v9;
    -[VCVideoStreamRateController doRateControlWithTime:roundTripTime:packetLossRate:operatingBitrate:averageReceivedBitrate:](self->_rateController, "doRateControlWithTime:roundTripTime:packetLossRate:operatingBitrate:averageReceivedBitrate:", self->_operatingBitrate, -[VCVideoStreamRateAdaptation averageReceivedBitrate](self, "averageReceivedBitrate"), v9, self->_tmmbRTT, v6);
    -[VCVideoStreamRateAdaptation owrd](self, "owrd");
    if (self->_maxOWRD < v10)
      self->_maxOWRD = v10;
  }
  else
  {
    self->_packetLossPercentage = 0.0;
  }
  -[VCVideoStreamRateAdaptation scheduleTMMBR:](self, "scheduleTMMBR:", -[VCVideoStreamRateController targetBitrate](self->_rateController, "targetBitrate"));
  return self->_downlinkQualityDidChange;
}

- (void)receivedTMMBN:(unsigned int)a3
{
  double v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  unsigned int receivedTmmbnBitrate;
  double tmmbRTT;
  unsigned int sendTmmbrBitrate;
  unsigned int operatingBitrate;
  uint64_t v13;
  unsigned int v14;
  double v15;
  unsigned int v16;
  unsigned int v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  int v27;
  __int16 v28;
  unsigned int v29;
  __int16 v30;
  double v31;
  __int16 v32;
  unsigned int v33;
  __int16 v34;
  unsigned int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  self->_receivedTmmbnBitrate = a3;
  v4 = micro();
  self->_tmmbnReceiveTime = v4;
  self->_tmmbRTT = v4 - self->_tmmbrSendTime;
  -[VCVideoStreamRateAdaptation setOperatingBitrate:](self, "setOperatingBitrate:", self->_receivedTmmbnBitrate);
  if (self->_downlinkQualityDidChange)
    -[VCVideoStreamRateAdaptation reportingVideoStreamEvent:](self, "reportingVideoStreamEvent:", 227);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    v7 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = objc_msgSend(-[VCVideoStreamRateAdaptation className](self, "className"), "UTF8String");
        receivedTmmbnBitrate = self->_receivedTmmbnBitrate;
        tmmbRTT = self->_tmmbRTT;
        sendTmmbrBitrate = self->_sendTmmbrBitrate;
        operatingBitrate = self->_operatingBitrate;
        v18 = 136317186;
        v19 = v5;
        v20 = 2080;
        v21 = "-[VCVideoStreamRateAdaptation receivedTMMBN:]";
        v22 = 1024;
        v23 = 134;
        v24 = 2080;
        v25 = v8;
        v26 = 1024;
        v27 = 134;
        v28 = 1024;
        v29 = receivedTmmbnBitrate;
        v30 = 2048;
        v31 = tmmbRTT;
        v32 = 1024;
        v33 = sendTmmbrBitrate;
        v34 = 1024;
        v35 = operatingBitrate;
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s:%d received TMMBN:%u RTT:%.3f requested TMMBR:%u, operatingTierBitrate:%u", (uint8_t *)&v18, 0x48u);
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v13 = objc_msgSend(-[VCVideoStreamRateAdaptation className](self, "className"), "UTF8String");
      v14 = self->_receivedTmmbnBitrate;
      v15 = self->_tmmbRTT;
      v16 = self->_sendTmmbrBitrate;
      v17 = self->_operatingBitrate;
      v18 = 136317186;
      v19 = v5;
      v20 = 2080;
      v21 = "-[VCVideoStreamRateAdaptation receivedTMMBN:]";
      v22 = 1024;
      v23 = 134;
      v24 = 2080;
      v25 = v13;
      v26 = 1024;
      v27 = 134;
      v28 = 1024;
      v29 = v14;
      v30 = 2048;
      v31 = v15;
      v32 = 1024;
      v33 = v16;
      v34 = 1024;
      v35 = v17;
      _os_log_debug_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEBUG, " [%s] %s:%d %s:%d received TMMBN:%u RTT:%.3f requested TMMBR:%u, operatingTierBitrate:%u", (uint8_t *)&v18, 0x48u);
    }
  }
}

- (void)updateVideoStall:(BOOL)a3 withStallDuration:(unsigned int)a4
{
  -[VCVideoStreamRateController updateVideoStall:withStallDuration:](self->_rateController, "updateVideoStall:withStallDuration:", a3, *(_QWORD *)&a4);
}

- (void)updateRTPReceiveWithTimestamp:(unsigned int)a3 sampleRate:(unsigned int)a4 time:(double)a5 size:(unsigned int)a6 endOfFrame:(BOOL)a7
{
  -[VCVideoStreamRateController updateRTPReceiveWithTimestamp:sampleRate:time:](self->_rateController, "updateRTPReceiveWithTimestamp:sampleRate:time:", *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a6, a7, a5);
}

- (double)owrd
{
  double result;

  -[VCVideoStreamRateController owrd](self->_rateController, "owrd");
  return result;
}

- (double)nowrd
{
  double result;

  -[VCVideoStreamRateController nowrd](self->_rateController, "nowrd");
  return result;
}

- (double)nowrdShort
{
  double result;

  -[VCVideoStreamRateController nowrdShort](self->_rateController, "nowrdShort");
  return result;
}

- (double)nowrdAcc
{
  double result;

  -[VCVideoStreamRateController nowrdAcc](self->_rateController, "nowrdAcc");
  return result;
}

- (void)setOperatingBitrate:(unsigned int)a3
{
  BOOL v4;
  unsigned int operatingBitrate;

  if (self->_operatingBitrate == a3)
  {
    if (self->_adaptationTime <= 0.0
      || self->_isOperatingAtMinBitrate
      || -[VCVideoStreamRateController minBitrate](self->_rateController, "minBitrate") < a3)
    {
      v4 = 0;
    }
    else
    {
      v4 = 1;
      self->_isOperatingAtMinBitrate = 1;
    }
  }
  else
  {
    self->_operatingBitrate = a3;
    self->_isOperatingAtMinBitrate = -[VCVideoStreamRateController minBitrate](self->_rateController, "minBitrate") >= a3;
    operatingBitrate = self->_operatingBitrate;
    self->_isOperatingAtMaxBitrate = operatingBitrate >= -[VCVideoStreamRateController maxBitrate](self->_rateController, "maxBitrate");
    v4 = 1;
  }
  self->_downlinkQualityDidChange = v4;
}

- (unsigned)averageReceivedBitrate
{
  return 1000
       * -[VCMediaStreamStats getBitrateKbpsSinceTime:](self->_stats, "getBitrateKbpsSinceTime:", self->_adaptationTime - self->_averageBitrateWindowDuration);
}

- (void)scheduleTMMBR:(unsigned int)a3
{
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  unsigned int sendTmmbrBitrate;
  uint64_t v9;
  unsigned int v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  int v20;
  __int16 v21;
  unsigned int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (a3 && self->_sendTmmbrBitrate != a3)
  {
    self->_downlinkQualityDidChange = 1;
    self->_sendTmmbrBitrate = a3;
    -[VCVideoStreamRateAdaptation reportingVideoStreamEvent:](self, "reportingVideoStreamEvent:", 226);
  }
  self->_receivedTmmbnBitrate = 0;
  self->_tmmbrSendTime = micro();
  RTCPSetSendTMMBR((uint64_t)self->_rtpHandle, self->_sendTmmbrBitrate);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    v6 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = objc_msgSend(-[VCVideoStreamRateAdaptation className](self, "className"), "UTF8String");
        sendTmmbrBitrate = self->_sendTmmbrBitrate;
        v11 = 136316418;
        v12 = v4;
        v13 = 2080;
        v14 = "-[VCVideoStreamRateAdaptation scheduleTMMBR:]";
        v15 = 1024;
        v16 = 207;
        v17 = 2080;
        v18 = v7;
        v19 = 1024;
        v20 = 207;
        v21 = 1024;
        v22 = sendTmmbrBitrate;
        _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s:%d TMMBR scheduled - new bitrate:%u", (uint8_t *)&v11, 0x32u);
      }
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v9 = objc_msgSend(-[VCVideoStreamRateAdaptation className](self, "className"), "UTF8String");
      v10 = self->_sendTmmbrBitrate;
      v11 = 136316418;
      v12 = v4;
      v13 = 2080;
      v14 = "-[VCVideoStreamRateAdaptation scheduleTMMBR:]";
      v15 = 1024;
      v16 = 207;
      v17 = 2080;
      v18 = v9;
      v19 = 1024;
      v20 = 207;
      v21 = 1024;
      v22 = v10;
      _os_log_debug_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEBUG, " [%s] %s:%d %s:%d TMMBR scheduled - new bitrate:%u", (uint8_t *)&v11, 0x32u);
    }
  }
}

- (id)className
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)reportingVideoStreamEvent:(unsigned __int16)a3
{
  int v3;
  const __CFAllocator *v5;
  __CFDictionary *Mutable;
  CFStringRef v7;
  CFStringRef v8;
  uint64_t v9;
  CFStringRef v10;
  uint64_t v11;
  CFStringRef v12;
  uint64_t v13;
  CFStringRef v14;
  uint64_t v15;
  CFStringRef v16;
  uint64_t v17;
  CFStringRef v18;
  uint64_t v19;
  CFStringRef v20;
  const __CFString *v21;
  CFStringRef v22;
  uint64_t v23;

  v3 = a3;
  v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (v3 == 227)
  {
    v22 = CFStringCreateWithFormat(v5, 0, CFSTR("%d"), self->_receivedTmmbnBitrate);
    CFDictionaryAddValue(Mutable, CFSTR("VCVSTMMB"), v22);
    CFRelease(v22);
    -[VCVideoStreamRateAdaptation roundTripTime](self, "roundTripTime");
    v20 = CFStringCreateWithFormat(v5, 0, CFSTR("%.5f"), v23);
    v21 = CFSTR("VCVSRxRoundTripTime");
  }
  else
  {
    if (v3 != 226)
      return;
    v7 = CFStringCreateWithFormat(v5, 0, CFSTR("%d"), self->_sendTmmbrBitrate);
    CFDictionaryAddValue(Mutable, CFSTR("VCVSTMMB"), v7);
    CFRelease(v7);
    v8 = CFStringCreateWithFormat(v5, 0, CFSTR("%d"), self->_operatingBitrate);
    CFDictionaryAddValue(Mutable, CFSTR("VCVSRxOperatingBitrate"), v8);
    CFRelease(v8);
    -[VCVideoStreamRateAdaptation packetLossPercentage](self, "packetLossPercentage");
    v10 = CFStringCreateWithFormat(v5, 0, CFSTR("%.5f"), v9);
    CFDictionaryAddValue(Mutable, CFSTR("VCVSRxPacketLossPercentage"), v10);
    CFRelease(v10);
    -[VCVideoStreamRateAdaptation roundTripTime](self, "roundTripTime");
    v12 = CFStringCreateWithFormat(v5, 0, CFSTR("%.5f"), v11);
    CFDictionaryAddValue(Mutable, CFSTR("VCVSRxRoundTripTime"), v12);
    CFRelease(v12);
    -[VCVideoStreamRateAdaptation owrd](self, "owrd");
    v14 = CFStringCreateWithFormat(v5, 0, CFSTR("%.5f"), v13);
    CFDictionaryAddValue(Mutable, CFSTR("VCVSRxOWRD"), v14);
    CFRelease(v14);
    -[VCVideoStreamRateAdaptation nowrd](self, "nowrd");
    v16 = CFStringCreateWithFormat(v5, 0, CFSTR("%.5f"), v15);
    CFDictionaryAddValue(Mutable, CFSTR("VCVSRxNOWRD"), v16);
    CFRelease(v16);
    -[VCVideoStreamRateAdaptation nowrdShort](self, "nowrdShort");
    v18 = CFStringCreateWithFormat(v5, 0, CFSTR("%.5f"), v17);
    CFDictionaryAddValue(Mutable, CFSTR("VCVSRxNOWRDSHORT"), v18);
    CFRelease(v18);
    -[VCVideoStreamRateAdaptation nowrdAcc](self, "nowrdAcc");
    v20 = CFStringCreateWithFormat(v5, 0, CFSTR("%.5f"), v19);
    v21 = CFSTR("VCVSRxNOWRDACC");
  }
  CFDictionaryAddValue(Mutable, v21, v20);
  CFRelease(v20);
  reportingVideoStreamEvent();
  CFRelease(Mutable);
}

- (tagHANDLE)rtpHandle
{
  return self->_rtpHandle;
}

- (BOOL)isOperatingAtMinBitrate
{
  return self->_isOperatingAtMinBitrate;
}

- (BOOL)isOperatingAtMaxBitrate
{
  return self->_isOperatingAtMaxBitrate;
}

- (double)packetLossPercentage
{
  return self->_packetLossPercentage;
}

- (double)roundTripTime
{
  return self->_tmmbRTT;
}

- (double)maxOWRD
{
  return self->_maxOWRD;
}

- (void)setMaxOWRD:(double)a3
{
  self->_maxOWRD = a3;
}

- (unsigned)sendTmmbrBitrate
{
  return self->_sendTmmbrBitrate;
}

- (unsigned)operatingBitrate
{
  return self->_operatingBitrate;
}

- (VCMediaStreamStats)stats
{
  return self->_stats;
}

- (void)setStats:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 144);
}

- (void)runVideoStreamRateAdaptation
{
  int v4;
  uint64_t v5;
  __int16 v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = 136316162;
  v5 = a1;
  v6 = 2080;
  v7 = "-[VCVideoStreamRateAdaptation runVideoStreamRateAdaptation]";
  v8 = 1024;
  v9 = 90;
  v10 = 2080;
  v11 = objc_msgSend((id)objc_msgSend(a2, "className"), "UTF8String");
  v12 = 1024;
  v13 = 90;
  _os_log_error_impl(&dword_1D8A54000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d %s:%d - Failed to receive TMMBN!", (uint8_t *)&v4, 0x2Cu);
}

@end
