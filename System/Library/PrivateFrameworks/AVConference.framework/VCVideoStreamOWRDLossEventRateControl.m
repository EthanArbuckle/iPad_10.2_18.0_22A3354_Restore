@implementation VCVideoStreamOWRDLossEventRateControl

- (VCVideoStreamOWRDLossEventRateControl)init
{
  VCVideoStreamOWRDLossEventRateControl *v2;
  VCVideoStreamOWRDLossEventRateControl *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)VCVideoStreamOWRDLossEventRateControl;
  v2 = -[VCVideoStreamOWRDLossEventRateControl init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    -[VCVideoStreamOWRDLossEventRateControl setMaxTierIndex:minTierIndex:](v2, "setMaxTierIndex:minTierIndex:", 26, 0);
    v3->_rateControlInterval = 0.5;
    +[VCDefaults getDoubleValueForKey:defaultValue:](VCDefaults, "getDoubleValueForKey:defaultValue:", CFSTR("videoStreamRampUpFrozenDuration"), 2.0);
    v3->_rampUpFrozenDuration = v4;
    +[VCDefaults getDoubleValueForKey:defaultValue:](VCDefaults, "getDoubleValueForKey:defaultValue:", CFSTR("videoStreamRampUpNoLossEventDurationRatio"), 4.0);
    v3->_rampUpNoLossEventDurationRatio = v5;
    +[VCDefaults getDoubleValueForKey:defaultValue:](VCDefaults, "getDoubleValueForKey:defaultValue:", CFSTR("videoStreamRampDownLossEventCountThreshold"), 2.0);
    v3->_rampDownLossEventCountThreshold = v6;
    +[VCDefaults getDoubleValueForKey:defaultValue:](VCDefaults, "getDoubleValueForKey:defaultValue:", CFSTR("videoStreamRampDownLossEventBitrateThreshold"), 502000.0);
    v3->_rampDownLossEventBitrateThreshold = v7;
    +[VCDefaults getDoubleValueForKey:defaultValue:](VCDefaults, "getDoubleValueForKey:defaultValue:", CFSTR("videoStreamRampUpStatusRateLimitedThreshold"), 0.5);
    v3->_rampUpStatusRateLimitedThreshold = v8;
    +[VCDefaults getDoubleValueForKey:defaultValue:](VCDefaults, "getDoubleValueForKey:defaultValue:", CFSTR("videoStreamRampDownOWRDThreshold"), 0.15);
    v3->_rampDownOWRDThreshold = v9;
    +[VCDefaults getDoubleValueForKey:defaultValue:](VCDefaults, "getDoubleValueForKey:defaultValue:", CFSTR("videoStreamRampDownLossRateThreshold"), 0.005);
    v3->_rampDownLossRateThreshold = v10;
  }
  return v3;
}

- (void)setMaxTierIndex:(unsigned __int16)a3 minTierIndex:(unsigned __int16)a4
{
  self->_maxTierIndex = a3;
  self->_minTierIndex = a4;
  self->_currentTierIndex = a4;
  self->_state = 2;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ state:%d OWRD:%.3f RTT:%.3f packetLossRate:%f"), -[VCVideoStreamOWRDLossEventRateControl className](self, "className"), self->_state, *(_QWORD *)&self->_owrd, *(_QWORD *)&self->_roundTripTime, *(_QWORD *)&self->_packetLossRate);
}

- (void)doRateControlWithTime:(double)a3 roundTripTime:(double)a4 packetLossRate:(double)a5 operatingTierIndex:(unsigned __int16)a6 averageReceivedBitrate:(unsigned int)a7
{
  int state;
  unsigned __int16 v11;
  double rampUpFrozenTime;
  VCVideoStreamOWRDLossEventRateControl *v13;
  uint64_t v14;

  if (self->_state != 3)
  {
    self->_rampUpStatus = 0;
    self->_rateControlTime = a3;
    self->_roundTripTime = a4;
    self->_averageReceivedBitrate = a7;
    -[VCVideoStreamOWRDLossEventRateControl updatePacketLossRate:time:](self, "updatePacketLossRate:time:", a5, a3);
    self->_currentTierIndex = a6;
    state = self->_state;
    if (state)
    {
      if (state == 1)
      {
        self->_rampUpStatus |= 1uLL;
        if (-[VCVideoStreamOWRDLossEventRateControl shouldRampDown](self, "shouldRampDown"))
        {
          self->_currentTierIndex = -[VCVideoStreamOWRDLossEventRateControl rampDownTier](self, "rampDownTier");
          self->_rampUpFrozenTime = a3;
          rampUpFrozenTime = a3;
        }
        else
        {
          rampUpFrozenTime = self->_rampUpFrozenTime;
        }
        if (a3 - rampUpFrozenTime <= self->_rampUpFrozenDuration)
          goto LABEL_20;
        goto LABEL_18;
      }
      if (state == 2)
      {
        if (-[VCVideoStreamOWRDLossEventRateControl shouldRampDown](self, "shouldRampDown"))
        {
          self->_currentTierIndex = -[VCVideoStreamOWRDLossEventRateControl rampDownTier](self, "rampDownTier");
LABEL_18:
          v13 = self;
          v14 = 0;
          goto LABEL_19;
        }
        if (-[VCVideoStreamOWRDLossEventRateControl shouldRampUp](self, "shouldRampUp"))
        {
          v11 = -[VCVideoStreamOWRDLossEventRateControl rampUpTier](self, "rampUpTier");
          goto LABEL_13;
        }
      }
    }
    else
    {
      if (-[VCVideoStreamOWRDLossEventRateControl shouldRampDown](self, "shouldRampDown"))
      {
        v11 = -[VCVideoStreamOWRDLossEventRateControl rampDownTier](self, "rampDownTier");
LABEL_13:
        self->_currentTierIndex = v11;
        goto LABEL_20;
      }
      if (-[VCVideoStreamOWRDLossEventRateControl shouldRampUp](self, "shouldRampUp"))
      {
        self->_currentTierIndex = -[VCVideoStreamOWRDLossEventRateControl rampUpTier](self, "rampUpTier");
        v13 = self;
        v14 = 1;
LABEL_19:
        -[VCVideoStreamOWRDLossEventRateControl stateChange:](v13, "stateChange:", v14);
      }
    }
LABEL_20:
    self->_targetBitrate = g_adwTxRateTiers[self->_currentTierIndex];
  }
}

- (void)printRateControlFullInfoWithLogDump:(void *)a3 time:(double)a4 videoStall:(BOOL)a5 videoFrozenDuration:(double)a6 averageTargetBitrate:(unsigned int)a7
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (a3)
    VRLogfilePrintWithTimestamp((uint64_t)a3, "%8.3f/%04X:\t%.4f\t%.4f\t%.4f\t%.4f %c\tRTT:%-4u\tPLR:%4.2f@%.1f\tRRx:0\tMBL:0\t%3u/%3u\t 0:0/0  0:0/0 CS: 0 0 0 BB: %u\t%d\t0\t UAT S _\t%d\n", (uint64_t)a3, a5, *(uint64_t *)&a7, v7, v8, v9, SLOBYTE(a4));
}

- (double)nowrd
{
  return 0.0;
}

- (double)nowrdShort
{
  return 0.0;
}

- (double)nowrdAcc
{
  return 0.0;
}

- (void)stateChange:(int)a3
{
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  int state;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (self->_state != a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v7 = objc_msgSend(-[VCVideoStreamOWRDLossEventRateControl className](self, "className"), "UTF8String");
        state = self->_state;
        v9 = 136316674;
        v10 = v5;
        v11 = 2080;
        v12 = "-[VCVideoStreamOWRDLossEventRateControl stateChange:]";
        v13 = 1024;
        v14 = 193;
        v15 = 2080;
        v16 = v7;
        v17 = 1024;
        v18 = 193;
        v19 = 1024;
        v20 = state;
        v21 = 1024;
        v22 = a3;
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s:%d Exiting state:%d Entering state:%d", (uint8_t *)&v9, 0x38u);
      }
    }
    -[VCVideoStreamOWRDLossEventRateControl stateExit](self, "stateExit");
    self->_state = a3;
    -[VCVideoStreamOWRDLossEventRateControl stateEnter](self, "stateEnter");
  }
}

- (void)stateEnter
{
  if (self->_state == 1)
    self->_rampUpFrozenTime = self->_rateControlTime;
}

- (unsigned)rampUpTier
{
  if ((unsigned __int16)(self->_currentTierIndex + 1) >= self->_maxTierIndex)
    return self->_maxTierIndex;
  else
    return self->_currentTierIndex + 1;
}

- (unsigned)rampDownTier
{
  int v2;

  v2 = self->_currentTierIndex - 2;
  if (v2 <= self->_minTierIndex)
    LOWORD(v2) = self->_minTierIndex;
  return v2;
}

- (BOOL)shouldRampDown
{
  BOOL v3;
  uint64_t v4;
  int v5;

  v3 = self->_owrd >= self->_rampDownOWRDThreshold;
  v4 = g_adwTxRateTiers[self->_currentTierIndex];
  v5 = -[VCVideoStreamOWRDLossEventRateControl lossEventCount](self, "lossEventCount");
  if (v5 >= -[VCVideoStreamOWRDLossEventRateControl lossEventCountThresholdForBitrate:](self, "lossEventCountThresholdForBitrate:", v4))
  {
    -[VCVideoStreamOWRDLossEventRateControl resetLossEventBuffer](self, "resetLossEventBuffer");
    return 1;
  }
  return v3;
}

- (BOOL)shouldRampUp
{
  double v3;
  double rateControlInterval;
  double v5;
  BOOL result;
  unsigned int averageReceivedBitrate;

  v3 = self->_rateControlTime - self->_lastLossEventTime;
  rateControlInterval = self->_rateControlInterval;
  v5 = self->_rampUpNoLossEventDurationRatio * rateControlInterval;
  result = v3 >= v5;
  if (v3 < v5)
    self->_rampUpStatus |= 2uLL;
  averageReceivedBitrate = self->_averageReceivedBitrate;
  if (averageReceivedBitrate)
  {
    LODWORD(rateControlInterval) = g_adwTxRateTiers[self->_currentTierIndex];
    if (self->_rampUpStatusRateLimitedThreshold * (double)*(unint64_t *)&rateControlInterval > (double)averageReceivedBitrate
      && self->_state != 2)
    {
      result = 0;
      self->_rampUpStatus |= 4uLL;
    }
  }
  return result;
}

- (void)updatePacketLossRate:(double)a3 time:(double)a4
{
  BOOL *lossEventBuffer;
  uint64_t lossEventBufferIndex;
  int v6;
  BOOL v7;
  int v8;
  int v9;

  self->_packetLossRate = a3;
  lossEventBuffer = self->_lossEventBuffer;
  lossEventBufferIndex = self->_lossEventBufferIndex;
  if (self->_rampDownLossRateThreshold >= a3)
  {
    lossEventBuffer[lossEventBufferIndex] = 0;
  }
  else
  {
    lossEventBuffer[lossEventBufferIndex] = 1;
    self->_lastLossEventTime = a4;
  }
  v6 = lossEventBufferIndex + 1;
  v7 = -v6 < 0;
  v8 = -v6 & 3;
  v9 = v6 & 3;
  if (!v7)
    v9 = -v8;
  self->_lossEventBufferIndex = v9;
}

- (int)lossEventCount
{
  uint8x8_t v2;

  v2.i32[0] = *(_DWORD *)self->_lossEventBuffer;
  return vaddvq_s32((int32x4_t)vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(v2)));
}

- (int)lossEventCountThresholdForBitrate:(unsigned int)a3
{
  if (self->_rampDownLossEventBitrateThreshold <= (double)a3)
    return 1;
  else
    return (int)self->_rampDownLossEventCountThreshold;
}

- (void)resetLossEventBuffer
{
  *(_QWORD *)self->_lossEventBuffer = 0;
}

- (void)calculateOWRDWithTimestamp:(unsigned int)a3 sampleRate:(unsigned int)a4 time:(double)a5
{
  unsigned int firstSendTimestamp;
  double firstReceiveTime;
  unsigned int v11;
  unsigned int previousTimestampDiff;
  uint64_t v13;
  NSObject *v14;
  double v15;
  double shortAverageLag;
  double longAverageLag;
  uint64_t v19;
  NSObject *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  double v29;
  double v30;
  double owrd;
  double v32;
  double v33;
  double v34;
  int v35;
  uint64_t v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  _BYTE v42[44];
  __int16 v43;
  double v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  firstSendTimestamp = self->_firstSendTimestamp;
  if (!firstSendTimestamp)
  {
    self->_firstSendTimestamp = a3;
    firstSendTimestamp = a3;
  }
  firstReceiveTime = self->_firstReceiveTime;
  if (firstReceiveTime == 0.0)
  {
    self->_firstReceiveTime = a5;
    firstReceiveTime = a5;
  }
  if (self->_previousSendTimestamp < a3)
  {
    v11 = a3 - firstSendTimestamp;
    previousTimestampDiff = self->_previousTimestampDiff;
    if (v11 - previousTimestampDiff <= 0x7FFFFFFE)
    {
      if (v11 < previousTimestampDiff)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
        {
          v13 = VRTraceErrorLogLevelToCSTR();
          v14 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v35 = 136315650;
            v36 = v13;
            v37 = 2080;
            v38 = "-[VCVideoStreamOWRDLossEventRateControl calculateOWRDWithTimestamp:sampleRate:time:]";
            v39 = 1024;
            v40 = 316;
            _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Time counter wrapped around", (uint8_t *)&v35, 0x1Cu);
          }
        }
        ++self->_sendTimestampWrappedAround;
        firstReceiveTime = self->_firstReceiveTime;
      }
      self->_previousTimestampDiff = v11;
    }
    v15 = a5 - firstReceiveTime - (double)(v11 - self->_sendTimestampWrappedAround) / (double)a4;
    self->_previousSendTimestamp = a3;
    shortAverageLag = self->_shortAverageLag;
    if (shortAverageLag == 0.0 || (longAverageLag = self->_longAverageLag, longAverageLag == 0.0))
    {
      self->_shortAverageLag = v15;
      self->_longAverageLag = v15;
      longAverageLag = v15;
      shortAverageLag = v15;
    }
    if (v15 - shortAverageLag <= 30.0 && longAverageLag - v15 <= 30.0)
    {
      v23 = v15 * 0.0001 + longAverageLag * 0.9999;
      v24 = v15 * 0.1 + shortAverageLag * 0.9;
      self->_shortAverageLag = v24;
      self->_longAverageLag = v23;
      v25 = v24 - v23;
      self->_owrd = v25;
      if (v25 < 0.0)
      {
        self->_longAverageLag = v24;
        self->_owrd = 0.0;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        v26 = VRTraceErrorLogLevelToCSTR();
        v27 = *MEMORY[0x1E0CF2758];
        v28 = *MEMORY[0x1E0CF2758];
        if (*MEMORY[0x1E0CF2748])
        {
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            v29 = self->_shortAverageLag;
            v30 = self->_longAverageLag;
            owrd = self->_owrd;
            v35 = 136317186;
            v36 = v26;
            v37 = 2080;
            v38 = "-[VCVideoStreamOWRDLossEventRateControl calculateOWRDWithTimestamp:sampleRate:time:]";
            v39 = 1024;
            v40 = 345;
            v41 = 1024;
            *(_DWORD *)v42 = a3;
            *(_WORD *)&v42[4] = 2048;
            *(double *)&v42[6] = a5;
            *(_WORD *)&v42[14] = 2048;
            *(double *)&v42[16] = v15;
            *(_WORD *)&v42[24] = 2048;
            *(double *)&v42[26] = v29;
            *(_WORD *)&v42[34] = 2048;
            *(double *)&v42[36] = v30;
            v43 = 2048;
            v44 = owrd;
            _os_log_impl(&dword_1D8A54000, v27, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d calculateOWRDWithTimestamp: timestamp: %u, now: %f, Lag %fs short %fs: long %fs : owrd %fs", (uint8_t *)&v35, 0x54u);
          }
        }
        else if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          v32 = self->_shortAverageLag;
          v33 = self->_longAverageLag;
          v34 = self->_owrd;
          v35 = 136317186;
          v36 = v26;
          v37 = 2080;
          v38 = "-[VCVideoStreamOWRDLossEventRateControl calculateOWRDWithTimestamp:sampleRate:time:]";
          v39 = 1024;
          v40 = 345;
          v41 = 1024;
          *(_DWORD *)v42 = a3;
          *(_WORD *)&v42[4] = 2048;
          *(double *)&v42[6] = a5;
          *(_WORD *)&v42[14] = 2048;
          *(double *)&v42[16] = v15;
          *(_WORD *)&v42[24] = 2048;
          *(double *)&v42[26] = v32;
          *(_WORD *)&v42[34] = 2048;
          *(double *)&v42[36] = v33;
          v43 = 2048;
          v44 = v34;
          _os_log_debug_impl(&dword_1D8A54000, v27, OS_LOG_TYPE_DEBUG, " [%s] %s:%d calculateOWRDWithTimestamp: timestamp: %u, now: %f, Lag %fs short %fs: long %fs : owrd %fs", (uint8_t *)&v35, 0x54u);
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v19 = VRTraceErrorLogLevelToCSTR();
      v20 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v21 = self->_shortAverageLag;
        v22 = self->_longAverageLag;
        v35 = 136316674;
        v36 = v19;
        v37 = 2080;
        v38 = "-[VCVideoStreamOWRDLossEventRateControl calculateOWRDWithTimestamp:sampleRate:time:]";
        v39 = 1024;
        v40 = 333;
        v41 = 2048;
        *(double *)v42 = v15;
        *(_WORD *)&v42[8] = 2048;
        *(double *)&v42[10] = v21;
        *(_WORD *)&v42[18] = 2048;
        *(double *)&v42[20] = v22;
        *(_WORD *)&v42[28] = 2048;
        *(_QWORD *)&v42[30] = 0x403E000000000000;
        _os_log_error_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_ERROR, " [%s] %s:%d calculateOWRDWithTimestamp: Lag (%fs) looks spurios (short %fs: long %fs : threshold %fs), discarding", (uint8_t *)&v35, 0x44u);
      }
    }
  }
}

- (id)className
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (int)state
{
  return self->_state;
}

- (unsigned)targetBitrate
{
  return self->_targetBitrate;
}

- (double)owrd
{
  return self->_owrd;
}

- (double)rateControlInterval
{
  return self->_rateControlInterval;
}

- (void)setRateControlInterval:(double)a3
{
  self->_rateControlInterval = a3;
}

@end
