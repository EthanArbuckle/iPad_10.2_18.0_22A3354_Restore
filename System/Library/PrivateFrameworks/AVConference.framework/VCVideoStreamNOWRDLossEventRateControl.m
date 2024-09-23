@implementation VCVideoStreamNOWRDLossEventRateControl

- (VCVideoStreamNOWRDLossEventRateControl)init
{
  VCVideoStreamNOWRDLossEventRateControl *v2;
  VCVideoStreamNOWRDLossEventRateControl *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)VCVideoStreamNOWRDLossEventRateControl;
  v2 = -[VCVideoStreamNOWRDLossEventRateControl init](&v15, sel_init);
  v3 = v2;
  if (v2)
  {
    -[VCVideoStreamNOWRDLossEventRateControl setMaxTierIndex:minTierIndex:](v2, "setMaxTierIndex:minTierIndex:", 26, 0);
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
    +[VCDefaults getDoubleValueForKey:defaultValue:](VCDefaults, "getDoubleValueForKey:defaultValue:", CFSTR("videoStreamRampDownLossRateThreshold"), 0.005);
    v3->_rampDownLossRateThreshold = v9;
    +[VCDefaults getDoubleValueForKey:defaultValue:](VCDefaults, "getDoubleValueForKey:defaultValue:", CFSTR("videoStreamRampDownNOWRDThreshold"), 0.1);
    v3->_nowrdRampDownThreshold = v10;
    +[VCDefaults getDoubleValueForKey:defaultValue:](VCDefaults, "getDoubleValueForKey:defaultValue:", CFSTR("videoStreamRampUpNOWRDThreshold"), 0.005);
    v3->_nowrdRampUpThreshold = v11;
    +[VCDefaults getDoubleValueForKey:defaultValue:](VCDefaults, "getDoubleValueForKey:defaultValue:", CFSTR("videoStreamRampDownNOWRDAccThreshold"), 0.1);
    v3->_nowrdAccRampDownThreshold = v12;
    +[VCDefaults getDoubleValueForKey:defaultValue:](VCDefaults, "getDoubleValueForKey:defaultValue:", CFSTR("videoStreamRampUpNOWRDAccThreshold"), 0.1);
    v3->_nowrdAccRampUpThreshold = v13;
    v3->_doRateControlCounter = 0;
  }
  return v3;
}

- (void)setMaxTierIndex:(unsigned __int16)a3 minTierIndex:(unsigned __int16)a4
{
  self->_maxTierIndex = a3;
  self->_minTierIndex = a4;
  self->_currentTierIndex = a4;
  self->_targetBitrate = g_adwTxRateTiers[a4];
  self->_state = 2;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ state:%d OWRD:%.3f NOWRD:%.3f NOWRDACC:%.3f RTT:%.3f packetLossRate:%f rampingStatus:0x%04X"), -[VCVideoStreamNOWRDLossEventRateControl className](self, "className"), self->_state, *(_QWORD *)&self->_owrd, *(_QWORD *)&self->_nowrd, *(_QWORD *)&self->_nowrdAcc, *(_QWORD *)&self->_roundTripTime, *(_QWORD *)&self->_packetLossRate, self->_rampDownStatus | self->_rampUpStatus);
}

- (void)doRateControlWithTime:(double)a3 roundTripTime:(double)a4 packetLossRate:(double)a5 operatingTierIndex:(unsigned __int16)a6 averageReceivedBitrate:(unsigned int)a7
{
  int state;
  unsigned __int16 v11;
  double rampUpFrozenTime;
  VCVideoStreamNOWRDLossEventRateControl *v13;
  uint64_t v14;

  if (self->_state != 3)
  {
    *(_QWORD *)&self->_rampUpStatus = 0;
    self->_rateControlTime = a3;
    self->_roundTripTime = a4;
    self->_averageReceivedBitrate = a7;
    ++self->_doRateControlCounter;
    -[VCVideoStreamNOWRDLossEventRateControl updatePacketLossRate:time:](self, "updatePacketLossRate:time:", a5, a3);
    self->_currentTierIndex = a6;
    self->_prevOperatingTierIndex = a6;
    state = self->_state;
    if (state)
    {
      if (state == 1)
      {
        self->_rampUpStatus |= 1u;
        if (-[VCVideoStreamNOWRDLossEventRateControl shouldRampDown](self, "shouldRampDown"))
        {
          self->_currentTierIndex = -[VCVideoStreamNOWRDLossEventRateControl rampDownTier](self, "rampDownTier");
          self->_rampUpFrozenTime = a3;
          rampUpFrozenTime = a3;
        }
        else
        {
          rampUpFrozenTime = self->_rampUpFrozenTime;
        }
        if (a3 - rampUpFrozenTime <= self->_rampUpFrozenDuration)
          goto LABEL_20;
LABEL_18:
        v13 = self;
        v14 = 0;
        goto LABEL_19;
      }
      if (state == 2)
      {
        if (!-[VCVideoStreamNOWRDLossEventRateControl shouldRampDown](self, "shouldRampDown"))
        {
          if (-[VCVideoStreamNOWRDLossEventRateControl shouldRampUp](self, "shouldRampUp"))
            self->_currentTierIndex = -[VCVideoStreamNOWRDLossEventRateControl rampUpTier](self, "rampUpTier");
          goto LABEL_20;
        }
        self->_currentTierIndex = -[VCVideoStreamNOWRDLossEventRateControl rampDownTier](self, "rampDownTier");
        goto LABEL_18;
      }
LABEL_20:
      self->_targetBitrate = g_adwTxRateTiers[self->_currentTierIndex];
      return;
    }
    if (-[VCVideoStreamNOWRDLossEventRateControl shouldRampDown](self, "shouldRampDown"))
    {
      v11 = -[VCVideoStreamNOWRDLossEventRateControl rampDownTier](self, "rampDownTier");
    }
    else
    {
      if (!-[VCVideoStreamNOWRDLossEventRateControl shouldRampUp](self, "shouldRampUp"))
        goto LABEL_20;
      v11 = -[VCVideoStreamNOWRDLossEventRateControl rampUpTier](self, "rampUpTier");
    }
    self->_currentTierIndex = v11;
    v13 = self;
    v14 = 1;
LABEL_19:
    -[VCVideoStreamNOWRDLossEventRateControl stateChange:](v13, "stateChange:", v14);
    goto LABEL_20;
  }
}

- (void)printRateControlFullInfoWithLogDump:(void *)a3 time:(double)a4 videoStall:(BOOL)a5 videoFrozenDuration:(double)a6 averageTargetBitrate:(unsigned int)a7
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (a3)
  {
    if (self->_doRateControlCounter)
      VRLogfilePrintWithTimestamp((uint64_t)a3, "%8.3f/%04X:\t%.4f\t%.4f\t%.4f\t%.4f %c\tRTT:%-4u\tPLR:%4.2f@%.1f\tRRx:%3u\tMBL:0\t%3u/%3u\t 0:0/0  0:0/0 CS: 0 0 0 BB: %u\t%04X\t%u\t UAT S _\t%d\n", (uint64_t)a3, a5, *(uint64_t *)&a7, v7, v8, v9, SLOBYTE(a4));
  }
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
        v7 = objc_msgSend(-[VCVideoStreamNOWRDLossEventRateControl className](self, "className"), "UTF8String");
        state = self->_state;
        v9 = 136316674;
        v10 = v5;
        v11 = 2080;
        v12 = "-[VCVideoStreamNOWRDLossEventRateControl stateChange:]";
        v13 = 1024;
        v14 = 223;
        v15 = 2080;
        v16 = v7;
        v17 = 1024;
        v18 = 223;
        v19 = 1024;
        v20 = state;
        v21 = 1024;
        v22 = a3;
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s:%d Exiting state:%d Entering state:%d", (uint8_t *)&v9, 0x38u);
      }
    }
    -[VCVideoStreamNOWRDLossEventRateControl stateExit](self, "stateExit");
    self->_state = a3;
    -[VCVideoStreamNOWRDLossEventRateControl stateEnter](self, "stateEnter");
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
  self->_nowrdAcc = 0.0;
  return v2;
}

- (BOOL)shouldRampDown
{
  uint64_t v3;
  double nowrd;
  double nowrdRampDownThreshold;
  BOOL v6;
  int v7;

  v3 = g_adwTxRateTiers[self->_currentTierIndex];
  nowrd = self->_nowrd;
  nowrdRampDownThreshold = self->_nowrdRampDownThreshold;
  v6 = nowrd > nowrdRampDownThreshold;
  if (nowrd > nowrdRampDownThreshold)
    self->_rampDownStatus |= 0x80u;
  if (self->_nowrdAcc > self->_nowrdAccRampDownThreshold)
  {
    self->_rampDownStatus |= 0x100u;
    v6 = 1;
  }
  v7 = -[VCVideoStreamNOWRDLossEventRateControl lossEventCount](self, "lossEventCount");
  if (v7 >= -[VCVideoStreamNOWRDLossEventRateControl lossEventCountThresholdForBitrate:](self, "lossEventCountThresholdForBitrate:", v3))
  {
    -[VCVideoStreamNOWRDLossEventRateControl resetLossEventBuffer](self, "resetLossEventBuffer");
    self->_rampDownStatus |= 0x20u;
    return 1;
  }
  return v6;
}

- (BOOL)shouldRampUp
{
  double v2;
  double rateControlInterval;
  double v4;
  BOOL v5;
  unsigned int averageReceivedBitrate;
  double nowrdAcc;

  v2 = self->_rateControlTime - self->_lastLossEventTime;
  rateControlInterval = self->_rateControlInterval;
  v4 = self->_rampUpNoLossEventDurationRatio * rateControlInterval;
  v5 = v2 >= v4;
  if (v2 < v4)
    self->_rampUpStatus |= 2u;
  averageReceivedBitrate = self->_averageReceivedBitrate;
  if (averageReceivedBitrate)
  {
    LODWORD(rateControlInterval) = g_adwTxRateTiers[self->_currentTierIndex];
    if (self->_rampUpStatusRateLimitedThreshold * (double)*(unint64_t *)&rateControlInterval > (double)averageReceivedBitrate
      && self->_state != 2)
    {
      v5 = 0;
      self->_rampUpStatus |= 4u;
    }
  }
  if (self->_nowrd > self->_nowrdRampUpThreshold)
  {
    v5 = 0;
    self->_rampUpStatus |= 8u;
  }
  nowrdAcc = self->_nowrdAcc;
  if (nowrdAcc == 0.0 || nowrdAcc > self->_nowrdAccRampUpThreshold)
  {
    v5 = 0;
    self->_rampUpStatus |= 0x10u;
  }
  return v5;
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
  v11 = a3 - firstSendTimestamp;
  previousTimestampDiff = self->_previousTimestampDiff;
  if (v11 != previousTimestampDiff)
  {
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
            v38 = "-[VCVideoStreamNOWRDLossEventRateControl calculateOWRDWithTimestamp:sampleRate:time:]";
            v39 = 1024;
            v40 = 367;
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
            v38 = "-[VCVideoStreamNOWRDLossEventRateControl calculateOWRDWithTimestamp:sampleRate:time:]";
            v39 = 1024;
            v40 = 396;
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
          v38 = "-[VCVideoStreamNOWRDLossEventRateControl calculateOWRDWithTimestamp:sampleRate:time:]";
          v39 = 1024;
          v40 = 396;
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
      -[VCVideoStreamNOWRDLossEventRateControl calculateNOWRD:time:](self, "calculateNOWRD:time:", self->_owrd, a5);
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
        v38 = "-[VCVideoStreamNOWRDLossEventRateControl calculateOWRDWithTimestamp:sampleRate:time:]";
        v39 = 1024;
        v40 = 384;
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

- (void)calculateNOWRD:(double)a3 time:(double)a4
{
  OWRDList *p_OWRDList;
  uint64_t rearIndex;
  int v6;
  double *owrd;
  int size;
  int v9;
  int frontIndex;
  signed int v12;
  signed int v13;
  int state;
  double v15;
  int v16;
  int v17;
  unsigned int v18;
  int v19;
  int v20;
  unsigned int v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  int v28;
  int v29;
  unsigned int v30;
  int v31;
  int v32;
  unsigned int v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;

  p_OWRDList = &self->OWRDList;
  rearIndex = self->OWRDList.rearIndex;
  if (a4 - self->OWRDList.time[rearIndex] >= 0.01)
  {
    v6 = ((int)rearIndex + 1) % 50;
    self->OWRDList.rearIndex = v6;
    owrd = self->OWRDList.owrd;
    self->OWRDList.owrd[v6] = a3;
    p_OWRDList->time[v6] = a4;
    size = self->OWRDList.size;
    if (size >= 50)
      v9 = self->OWRDList.size;
    else
      v9 = size + 1;
    self->OWRDList.size = v9;
    frontIndex = self->OWRDList.frontIndex;
    if (v6 == frontIndex && v9 != 1)
    {
      frontIndex = (char)(v6
                        + 1
                        - 50 * ((((41 * (char)(v6 + 1)) & 0x8000) != 0) + ((41 * (char)(v6 + 1)) >> 11)));
      self->OWRDList.frontIndex = frontIndex;
    }
    if (v9 >= 4)
    {
      v12 = (char)(v6
                 + 47
                 - 50 * ((((41 * (char)(v6 + 47)) & 0x8000) != 0) + ((41 * (char)(v6 + 47)) >> 11)));
      v13 = frontIndex;
      if (frontIndex != v12)
      {
        v13 = (char)(v6
                   + 47
                   - 50 * ((((41 * (char)(v6 + 47)) & 0x8000) != 0) + ((41 * (char)(v6 + 47)) >> 11)));
        while (a4 - p_OWRDList->time[v13] <= 0.5)
        {
          v13 = (v13 + 49) % 0x32u;
          if (v13 == frontIndex)
          {
            v13 = frontIndex;
            break;
          }
        }
      }
      state = self->_state;
      if (state != 2 || (v15 = 0.0, a4 - p_OWRDList->time[v13] >= 0.2))
      {
        v16 = v6 + 50;
        if (v6 > v13)
          v16 = v6;
        v17 = v16 - v13;
        v18 = v16 - v13 + 2;
        if (v16 - v13 >= -1)
          v19 = v17 + 1;
        else
          v19 = v16 - v13 + 2;
        if (v17 < 0)
        {
          v25 = 0.0;
          v24 = 0.0;
          v26 = 0.0;
        }
        else
        {
          v20 = (v13 + (v19 >> 1)) % 50;
          v21 = v18 >> 1;
          v22 = 0.0;
          v23 = 0.0;
          v24 = 0.0;
          v25 = 0.0;
          do
          {
            v25 = v25 + owrd[v13 % 50];
            v24 = v24 + owrd[v20 % 50];
            v23 = v23 + p_OWRDList->time[v13 % 50];
            v22 = v22 + p_OWRDList->time[v20 % 50];
            ++v20;
            ++v13;
            --v21;
          }
          while (v21);
          v26 = v22 - v23;
        }
        if (fabs(v26) < 0.001)
          return;
        v15 = (v24 - v25) / v26 * 0.5;
      }
      self->_nowrd = v15;
      if (frontIndex != v12)
      {
        while (a4 - p_OWRDList->time[v12] <= 0.25)
        {
          v12 = (v12 + 49) % 0x32u;
          if (v12 == frontIndex)
            goto LABEL_35;
        }
        frontIndex = v12;
      }
LABEL_35:
      if (state == 2)
      {
        v27 = 0.0;
        if (a4 - p_OWRDList->time[frontIndex] < 0.2)
          goto LABEL_49;
      }
      v28 = v6 + 50;
      if (v6 > frontIndex)
        v28 = v6;
      v29 = v28 - frontIndex;
      v30 = v28 - frontIndex + 2;
      if (v28 - frontIndex >= -1)
        v31 = v29 + 1;
      else
        v31 = v28 - frontIndex + 2;
      if (v29 < 0)
      {
        v37 = 0.0;
        v36 = 0.0;
        v38 = 0.0;
      }
      else
      {
        v32 = (frontIndex + (v31 >> 1)) % 50;
        v33 = v30 >> 1;
        v34 = 0.0;
        v35 = 0.0;
        v36 = 0.0;
        v37 = 0.0;
        do
        {
          v37 = v37 + owrd[frontIndex % 50];
          v36 = v36 + owrd[v32 % 50];
          v35 = v35 + p_OWRDList->time[frontIndex % 50];
          v34 = v34 + p_OWRDList->time[v32 % 50];
          ++v32;
          ++frontIndex;
          --v33;
        }
        while (v33);
        v38 = v34 - v35;
      }
      if (fabs(v38) >= 0.001)
      {
        v27 = (v36 - v37) / v38 * 0.25;
LABEL_49:
        self->_nowrdShort = v27;
        v39 = p_OWRDList->time[(v6 + 49) % 0x32u];
        v40 = self->_nowrdAcc + v15 * (a4 - v39) + v15 * (a4 - v39);
        if (v40 < 0.0)
          v40 = 0.0;
        self->_nowrdAcc = v40;
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

- (double)nowrd
{
  return self->_nowrd;
}

- (double)nowrdShort
{
  return self->_nowrdShort;
}

- (double)nowrdAcc
{
  return self->_nowrdAcc;
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
