@implementation VCRedundancyControlAlgorithmAudioMultiWay

- (VCRedundancyControlAlgorithmAudioMultiWay)init
{
  VCRedundancyControlAlgorithmAudioMultiWay *result;
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)VCRedundancyControlAlgorithmAudioMultiWay;
  result = -[VCRedundancyControlAlgorithmAudioMultiWay init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)result->_packetLossPercentageIncreaseThresholds = xmmword_1D910DAF0;
    *(_QWORD *)&result->_packetLossPercentageDecreaseThresholds[1] = 0x600000003;
  }
  return result;
}

- (void)updateRedundancyStrategyWithNetworkStatistics:(tagVCStatisticsMessage *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
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
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (a3->type == 11)
  {
    v9 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 152);
    v25 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 136);
    v26 = v9;
    v27 = *((_QWORD *)&a3->var0.localRCEvent + 21);
    v10 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 88);
    v21 = *(_OWORD *)(&a3->var0.localRCEvent + 3);
    v22 = v10;
    v11 = *(_OWORD *)(&a3->var0.localRCEvent + 5);
    v23 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 104);
    v24 = v11;
    v12 = *(_OWORD *)(&a3->var0.localRCEvent + 1);
    v17 = *(_OWORD *)&a3->var0.rtcpRR.lastSequenceNumber;
    v18 = v12;
    v13 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 56);
    v19 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 40);
    v20 = v13;
    v14 = *(_OWORD *)&a3->isVCRCInternal;
    v15 = *(_OWORD *)&a3->type;
    v16 = v14;
    -[VCRedundancyControlAlgorithmAudioMultiWay processNWConnectionStatistics:](self, "processNWConnectionStatistics:", &v15);
  }
  else if (a3->type == 3)
  {
    v3 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 152);
    v25 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 136);
    v26 = v3;
    v27 = *((_QWORD *)&a3->var0.localRCEvent + 21);
    v4 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 88);
    v21 = *(_OWORD *)(&a3->var0.localRCEvent + 3);
    v22 = v4;
    v5 = *(_OWORD *)(&a3->var0.localRCEvent + 5);
    v23 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 104);
    v24 = v5;
    v6 = *(_OWORD *)(&a3->var0.localRCEvent + 1);
    v17 = *(_OWORD *)&a3->var0.rtcpRR.lastSequenceNumber;
    v18 = v6;
    v7 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 56);
    v19 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 40);
    v20 = v7;
    v8 = *(_OWORD *)&a3->isVCRCInternal;
    v15 = *(_OWORD *)&a3->type;
    v16 = v8;
    -[VCRedundancyControlAlgorithmAudioMultiWay processRCNetworkStatistics:](self, "processRCNetworkStatistics:", &v15);
  }
}

- (void)processNWConnectionStatistics:(tagVCStatisticsMessage *)a3
{
  float offChannelTimeRatio;
  BOOL v4;

  if (a3->type == 11)
  {
    LODWORD(self->_offChannelTimeRatio) = a3->var0.probing.packetReceived.bandwidthEstimation;
    offChannelTimeRatio = a3->var0.nwConnection.var0.wifi.offChannelTimeRatio;
    if (self->_isOffChannelActivityHigh)
      v4 = offChannelTimeRatio >= 0.25;
    else
      v4 = offChannelTimeRatio > 0.4;
    self->_isOffChannelActivityHigh = v4;
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCRedundancyControlAlgorithmAudioMultiWay processNWConnectionStatistics:].cold.1();
  }
}

- (void)processRCNetworkStatistics:(tagVCStatisticsMessage *)a3
{
  unint64_t *p_statisticsID;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  unint64_t v7;
  uint64_t v8;
  NSObject *v9;
  double packetLossPercentage;
  double plrEnvelope;
  double packetLossPercentageThreshold;
  double v13;
  double v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  unint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (a3->type == 3)
  {
    p_statisticsID = &a3->var0.network.statisticsID;
    if (a3->var0.network.statisticsID)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        v4 = VRTraceErrorLogLevelToCSTR();
        v5 = *MEMORY[0x1E0CF2758];
        v6 = *MEMORY[0x1E0CF2758];
        if (*MEMORY[0x1E0CF2748])
        {
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
          {
            v7 = *p_statisticsID;
            v15 = 136315906;
            v16 = v4;
            v17 = 2080;
            v18 = "-[VCRedundancyControlAlgorithmAudioMultiWay processRCNetworkStatistics:]";
            v19 = 1024;
            v20 = 95;
            v21 = 2048;
            v22 = v7;
            _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Filter out statistics not belong to this redundancyController with statisticsID:%llu", (uint8_t *)&v15, 0x26u);
          }
        }
        else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          -[VCRedundancyControlAlgorithmAudioMultiWay processRCNetworkStatistics:].cold.1();
        }
      }
    }
    else
    {
      packetLossPercentage = a3->var0.network.packetLossPercentage;
      packetLossPercentageThreshold = self->_packetLossPercentageThreshold;
      plrEnvelope = self->_plrEnvelope;
      v13 = dbl_1D910D6E0[plrEnvelope < packetLossPercentage];
      v14 = plrEnvelope * (1.0 - v13) + packetLossPercentage * v13;
      self->_plrEnvelope = v14;
      self->_isPacketLossIncreasing = v14 >= packetLossPercentageThreshold;
      self->_packetLossPercentage = packetLossPercentage;
      self->_burstLossPacketCount = a3->var0.baseband.transmittedBytes;
      self->_isUplinkRecentlyCongested = a3->var0.feedback.videoReceivedPackets != 0;
      -[VCRedundancyControlAlgorithmAudioMultiWay computeRedundancyInfo](self, "computeRedundancyInfo");
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCRedundancyControlAlgorithmAudioMultiWay processRCNetworkStatistics:].cold.2(v8, v9);
  }
}

- (void)computeRedundancyInfo
{
  uint64_t v3;
  signed int v4;
  double v5;

  if (!self->_isPacketLossIncreasing)
  {
    v3 = 36;
    goto LABEL_6;
  }
  if (!self->_isUplinkRecentlyCongested && !self->_isOffChannelActivityHigh)
  {
    v3 = 24;
LABEL_6:
    self->_redundancyPercentage = -[VCRedundancyControlAlgorithmAudioMultiWay updateRedundancyPercentageWithPLRThresholds:](self, "updateRedundancyPercentageWithPLRThresholds:", (char *)self + v3);
  }
  v4 = 20 * self->_burstLossPacketCount;
  v5 = (double)v4;
  if (v4 < 41)
    v5 = 40.0;
  if (v4 >= 180)
    v5 = 180.0;
  self->_redundancyInterval = v5;
}

- (unsigned)updateRedundancyPercentageWithPLRThresholds:(unsigned int *)a3
{
  double v3;
  uint64_t v5;
  double plrEnvelope;
  unsigned int v7;
  int v8;
  uint64_t v9;
  NSObject *v10;
  float packetLossPercentage;
  float packetLossPercentageThreshold;
  unsigned int redundancyPercentage;
  float v14;
  int v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  double v23;
  __int16 v24;
  double v25;
  __int16 v26;
  unsigned int v27;
  __int16 v28;
  unsigned int v29;
  __int16 v30;
  double v31;
  uint64_t v32;

  v5 = 0;
  v32 = *MEMORY[0x1E0C80C00];
  plrEnvelope = self->_plrEnvelope;
  do
  {
    LODWORD(v3) = a3[v5];
    v3 = (double)*(unint64_t *)&v3;
    if (plrEnvelope < v3)
      break;
    ++v5;
  }
  while (v5 != 3);
  v7 = 100 * v5;
  if (100 * (_DWORD)v5 != self->_redundancyPercentage)
  {
    v8 = (v5 - self->_isPacketLossIncreasing) & ~(((int)v5 - self->_isPacketLossIncreasing) >> 31);
    if (v8 >= 2)
      v8 = 2;
    LODWORD(plrEnvelope) = a3[v8];
    self->_packetLossPercentageThreshold = (double)*(unint64_t *)&plrEnvelope;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        packetLossPercentage = self->_packetLossPercentage;
        packetLossPercentageThreshold = self->_packetLossPercentageThreshold;
        redundancyPercentage = self->_redundancyPercentage;
        v14 = self->_plrEnvelope;
        v16 = 136316930;
        v17 = v9;
        v18 = 2080;
        v19 = "-[VCRedundancyControlAlgorithmAudioMultiWay updateRedundancyPercentageWithPLRThresholds:]";
        v20 = 1024;
        v21 = 136;
        v22 = 2048;
        v23 = packetLossPercentage;
        v24 = 2048;
        v25 = packetLossPercentageThreshold;
        v26 = 1024;
        v27 = redundancyPercentage;
        v28 = 1024;
        v29 = v7;
        v30 = 2048;
        v31 = v14;
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Audio redundancy percentage change due to packet loss: %2.3f, new threshold: %2.3f [%d to %d] plrEnvelope=%2.3f", (uint8_t *)&v16, 0x46u);
      }
    }
  }
  return v7;
}

- (unsigned)redundancyPercentage
{
  return self->_redundancyPercentage;
}

- (double)redundancyInterval
{
  return self->_redundancyInterval;
}

- (void)processNWConnectionStatistics:.cold.1()
{
  int v0;
  os_log_t v1;
  uint8_t v2[14];
  const char *v3;
  __int16 v4;
  int v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8_0();
  v3 = "-[VCRedundancyControlAlgorithmAudioMultiWay processNWConnectionStatistics:]";
  v4 = 1024;
  v5 = 78;
  v6 = 1024;
  v7 = v0;
  _os_log_error_impl(&dword_1D8A54000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d wrong type of statistics message is processed by VCRedundancyControl type=%d", v2, 0x22u);
  OUTLINED_FUNCTION_3();
}

- (void)processRCNetworkStatistics:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[14];
  const char *v3;
  __int16 v4;
  int v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8_0();
  v3 = "-[VCRedundancyControlAlgorithmAudioMultiWay processRCNetworkStatistics:]";
  v4 = 1024;
  v5 = 95;
  v6 = 2048;
  v7 = v0;
  _os_log_debug_impl(&dword_1D8A54000, v1, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Filter out statistics not belong to this redundancyController with statisticsID:%llu", v2, 0x26u);
  OUTLINED_FUNCTION_3();
}

- (void)processRCNetworkStatistics:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
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
  v5 = "-[VCRedundancyControlAlgorithmAudioMultiWay processRCNetworkStatistics:]";
  v6 = 1024;
  v7 = 91;
  _os_log_error_impl(&dword_1D8A54000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d wrong type of statistics message is processed by VCRedundancyControl", (uint8_t *)&v2, 0x1Cu);
  OUTLINED_FUNCTION_3();
}

@end
