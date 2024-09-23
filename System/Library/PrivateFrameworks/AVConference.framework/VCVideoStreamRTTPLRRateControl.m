@implementation VCVideoStreamRTTPLRRateControl

- (VCVideoStreamRTTPLRRateControl)init
{
  VCVideoStreamRTTPLRRateControl *v2;
  VCVideoStreamRTTPLRRateControl *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)VCVideoStreamRTTPLRRateControl;
  v2 = -[VCVideoStreamRTTPLRRateControl init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    -[VCVideoStreamRTTPLRRateControl setMaxTierIndex:minTierIndex:](v2, "setMaxTierIndex:minTierIndex:", 26, 0);
    +[VCDefaults getDoubleValueForKey:defaultValue:](VCDefaults, "getDoubleValueForKey:defaultValue:", CFSTR("videoStreamRampUpFrozenDuration"), 10.0);
    v3->_rampUpFrozenDuration = v4;
    +[VCDefaults getDoubleValueForKey:defaultValue:](VCDefaults, "getDoubleValueForKey:defaultValue:", CFSTR("videoStreamRampUpPacketLossRate"), 0.01);
    v3->_rampUpPacketLossRate = v5;
    +[VCDefaults getDoubleValueForKey:defaultValue:](VCDefaults, "getDoubleValueForKey:defaultValue:", CFSTR("videoStreamRampDownPacketLossRate"), 0.03);
    v3->_rampDownPacketLossRate = v6;
    +[VCDefaults getDoubleValueForKey:defaultValue:](VCDefaults, "getDoubleValueForKey:defaultValue:", CFSTR("videoStreamRampDownRoundTripTime"), 0.25);
    v3->_rampDownRoundTripTime = v7;
  }
  return v3;
}

- (void)setMaxTierIndex:(unsigned __int16)a3 minTierIndex:(unsigned __int16)a4
{
  self->_maxTierIndex = a3;
  self->_minTierIndex = a4;
  self->_currentTierIndex = a4;
  self->_state = 0;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ state:%d RTT:%.3f packetLossRate:%f"), -[VCVideoStreamRTTPLRRateControl className](self, "className"), self->_state, *(_QWORD *)&self->_roundTripTime, *(_QWORD *)&self->_packetLossRate);
}

- (void)doRateControlWithTime:(double)a3 roundTripTime:(double)a4 packetLossRate:(double)a5 operatingTierIndex:(unsigned __int16)a6 averageReceivedBitrate:(unsigned int)a7
{
  int state;
  VCVideoStreamRTTPLRRateControl *v10;
  uint64_t v11;
  double rampUpFrozenTime;

  state = self->_state;
  if (state != 3)
  {
    self->_rateControlTime = a3;
    self->_packetLossRate = a5;
    self->_roundTripTime = a4;
    self->_currentTierIndex = a6;
    if (state == 1)
    {
      if (-[VCVideoStreamRTTPLRRateControl shouldRampDown](self, "shouldRampDown"))
      {
        self->_currentTierIndex = -[VCVideoStreamRTTPLRRateControl rampDownTier](self, "rampDownTier");
        self->_rampUpFrozenTime = a3;
        rampUpFrozenTime = a3;
      }
      else
      {
        rampUpFrozenTime = self->_rampUpFrozenTime;
      }
      if (a3 - rampUpFrozenTime <= self->_rampUpFrozenDuration)
        goto LABEL_14;
      v10 = self;
      v11 = 0;
    }
    else
    {
      if (state)
      {
LABEL_14:
        self->_targetBitrate = g_adwTxRateTiers[self->_currentTierIndex];
        return;
      }
      if (!-[VCVideoStreamRTTPLRRateControl shouldRampDown](self, "shouldRampDown"))
      {
        if (-[VCVideoStreamRTTPLRRateControl shouldRampUp](self, "shouldRampUp"))
          self->_currentTierIndex = -[VCVideoStreamRTTPLRRateControl rampUpTier](self, "rampUpTier");
        goto LABEL_14;
      }
      self->_currentTierIndex = -[VCVideoStreamRTTPLRRateControl rampDownTier](self, "rampDownTier");
      v10 = self;
      v11 = 1;
    }
    -[VCVideoStreamRTTPLRRateControl stateChange:](v10, "stateChange:", v11);
    goto LABEL_14;
  }
}

- (void)printRateControlFullInfoWithLogDump:(void *)a3 time:(double)a4 videoStall:(BOOL)a5 videoFrozenDuration:(double)a6 averageTargetBitrate:(unsigned int)a7
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (a3)
    VRLogfilePrintWithTimestamp((uint64_t)a3, "%8.3f/%04X:\t%.4f\t%.4f\t%.4f\t%.4f %c\tRTT:%-4u\tPLR:%4.2f@%.1f\tRRx:0\tMBL:0\t%3u/%3u\t 0:0/0  0:0/0 CS: 0 0 0 BB: 0\t0\t0\t UAT S _\t%d\n", (uint64_t)a3, a5, *(uint64_t *)&a7, v7, v8, v9, SLOBYTE(a4));
}

- (double)owrd
{
  return 0.0;
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

- (id)className
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
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
        v7 = objc_msgSend(-[VCVideoStreamRTTPLRRateControl className](self, "className"), "UTF8String");
        state = self->_state;
        v9 = 136316674;
        v10 = v5;
        v11 = 2080;
        v12 = "-[VCVideoStreamRTTPLRRateControl stateChange:]";
        v13 = 1024;
        v14 = 155;
        v15 = 2080;
        v16 = v7;
        v17 = 1024;
        v18 = 155;
        v19 = 1024;
        v20 = state;
        v21 = 1024;
        v22 = a3;
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s:%d Exiting state:%d Entering state:%d", (uint8_t *)&v9, 0x38u);
      }
    }
    -[VCVideoStreamRTTPLRRateControl stateExit](self, "stateExit");
    self->_state = a3;
    -[VCVideoStreamRTTPLRRateControl stateEnter](self, "stateEnter");
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
  return self->_roundTripTime >= self->_rampDownRoundTripTime || self->_packetLossRate >= self->_rampDownPacketLossRate;
}

- (BOOL)shouldRampUp
{
  return self->_packetLossRate < self->_rampUpPacketLossRate;
}

- (int)state
{
  return self->_state;
}

- (unsigned)targetBitrate
{
  return self->_targetBitrate;
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
