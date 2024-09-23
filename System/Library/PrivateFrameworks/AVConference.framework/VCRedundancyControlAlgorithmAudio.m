@implementation VCRedundancyControlAlgorithmAudio

- (VCRedundancyControlAlgorithmAudio)initWithMode:(unsigned int)a3
{
  uint64_t v3;
  VCRedundancyControlAlgorithmAudio *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  NSObject *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  NSObject *v18;
  objc_super v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  double v28;
  __int16 v29;
  double v30;
  __int16 v31;
  double v32;
  __int16 v33;
  double v34;
  __int16 v35;
  double v36;
  __int16 v37;
  double v38;
  uint64_t v39;

  v3 = *(_QWORD *)&a3;
  v39 = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)VCRedundancyControlAlgorithmAudio;
  v4 = -[VCRedundancyControlAlgorithmAudio init](&v20, sel_init);
  if (!v4)
    return v4;
  if ((_DWORD)v3 == 3)
  {
    v5 = 16.0;
    v6 = 4.0;
    v7 = 18.0;
    v8 = 6.0;
    goto LABEL_6;
  }
  if ((_DWORD)v3 == 2)
  {
    v5 = 6.0;
    v6 = 3.0;
    v7 = 8.0;
    v8 = 4.0;
LABEL_6:
    v4->_packetLossPercentageIncreaseThresholds[0] = VCDefaults_GetDoubleValueForKey(CFSTR("redundancyControllerIncreaseToLevel1PLR"), 2.0);
    v4->_packetLossPercentageIncreaseThresholds[1] = VCDefaults_GetDoubleValueForKey(CFSTR("redundancyControllerIncreaseToLevel2PLR"), v8);
    v4->_packetLossPercentageIncreaseThresholds[2] = VCDefaults_GetDoubleValueForKey(CFSTR("redundancyControllerIncreaseToLevel3PLR"), v7);
    v4->_packetLossPercentageDecreaseThresholds[0] = VCDefaults_GetDoubleValueForKey(CFSTR("redundancyControllerDecreaseToLevel0PLR"), 1.0);
    v4->_packetLossPercentageDecreaseThresholds[1] = VCDefaults_GetDoubleValueForKey(CFSTR("redundancyControllerDecreaseToLevel1PLR"), v6);
    v4->_packetLossPercentageDecreaseThresholds[2] = VCDefaults_GetDoubleValueForKey(CFSTR("redundancyControllerDecreaseToLevel2PLR"), v5);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v11 = v4->_packetLossPercentageIncreaseThresholds[0];
        v12 = v4->_packetLossPercentageIncreaseThresholds[1];
        v13 = v4->_packetLossPercentageIncreaseThresholds[2];
        v14 = v4->_packetLossPercentageDecreaseThresholds[0];
        v15 = v4->_packetLossPercentageDecreaseThresholds[1];
        v16 = v4->_packetLossPercentageDecreaseThresholds[2];
        *(_DWORD *)buf = 136317186;
        v22 = v9;
        v23 = 2080;
        v24 = "-[VCRedundancyControlAlgorithmAudio initWithMode:]";
        v25 = 1024;
        v26 = 76;
        v27 = 2048;
        v28 = v11;
        v29 = 2048;
        v30 = v12;
        v31 = 2048;
        v32 = v13;
        v33 = 2048;
        v34 = v14;
        v35 = 2048;
        v36 = v15;
        v37 = 2048;
        v38 = v16;
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Using Audio RED cutover points RED0to1=%0.2f RED1to2=%0.2f RED2to3=%0.2f RED1to0=%0.2f RED2to1=%0.2f RED3to2=%0.2f", buf, 0x58u);
      }
    }
    return v4;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v17 = VRTraceErrorLogLevelToCSTR();
    v18 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCRedundancyControlAlgorithmAudio initWithMode:].cold.1(v17, v3, v18);
  }

  return 0;
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
    -[VCRedundancyControlAlgorithmAudio processNWConnectionStatistics:](self, "processNWConnectionStatistics:", &v15);
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
    -[VCRedundancyControlAlgorithmAudio processRCNetworkStatistics:](self, "processRCNetworkStatistics:", &v15);
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
      -[VCRedundancyControlAlgorithmAudio processNWConnectionStatistics:].cold.1();
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
  double packetLossPercentageAudio;
  double packetLossPercentage;
  double v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  unint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
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
            v13 = 136315906;
            v14 = v4;
            v15 = 2080;
            v16 = "-[VCRedundancyControlAlgorithmAudio processRCNetworkStatistics:]";
            v17 = 1024;
            v18 = 113;
            v19 = 2048;
            v20 = v7;
            _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Filter out statistics not belong to this redundancyController with statisticsID:%llu", (uint8_t *)&v13, 0x26u);
          }
        }
        else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          -[VCRedundancyControlAlgorithmAudio processRCNetworkStatistics:].cold.1();
        }
      }
    }
    else
    {
      packetLossPercentageAudio = a3->var0.network.packetLossPercentageAudio;
      packetLossPercentage = self->_packetLossPercentage;
      if (packetLossPercentageAudio <= packetLossPercentage)
        v12 = packetLossPercentage * 0.9985 + packetLossPercentageAudio * 0.0015;
      else
        v12 = packetLossPercentage * 0.1 + packetLossPercentageAudio * 0.9;
      self->_isPacketLossIncreasing = v12 >= self->_packetLossPercentageThreshold;
      self->_packetLossPercentage = v12;
      self->_burstLossPacketCount = a3->var0.baseband.transmittedBytes;
      self->_isUplinkRecentlyCongested = a3->var0.feedback.videoReceivedPackets != 0;
      -[VCRedundancyControlAlgorithmAudio computeRedundancyInfo](self, "computeRedundancyInfo");
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCRedundancyControlAlgorithmAudio processRCNetworkStatistics:].cold.2(v8, v9);
  }
}

- (void)computeRedundancyInfo
{
  uint64_t v3;
  signed int v4;
  double v5;

  if (!self->_isPacketLossIncreasing)
  {
    v3 = 48;
    goto LABEL_6;
  }
  if (!self->_isUplinkRecentlyCongested && !self->_isOffChannelActivityHigh)
  {
    v3 = 24;
LABEL_6:
    self->_redundancyPercentage = -[VCRedundancyControlAlgorithmAudio updateRedundancyPercentageWithPLRThresholds:](self, "updateRedundancyPercentageWithPLRThresholds:", (char *)self + v3);
  }
  v4 = 20 * self->_burstLossPacketCount;
  v5 = (double)v4;
  if (v4 < 41)
    v5 = 40.0;
  if (v4 >= 180)
    v5 = 180.0;
  self->_redundancyInterval = v5;
}

- (unsigned)updateRedundancyPercentageWithPLRThresholds:(double *)a3
{
  uint64_t v4;
  unsigned int v5;
  int v6;
  uint64_t v7;
  NSObject *v8;
  double packetLossPercentage;
  double packetLossPercentageThreshold;
  unsigned int redundancyPercentage;
  int v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  double v20;
  __int16 v21;
  double v22;
  __int16 v23;
  unsigned int v24;
  __int16 v25;
  unsigned int v26;
  uint64_t v27;

  v4 = 0;
  v27 = *MEMORY[0x1E0C80C00];
  do
  {
    if (self->_packetLossPercentage < a3[v4])
      break;
    ++v4;
  }
  while (v4 != 3);
  v5 = 100 * v4;
  if (100 * (_DWORD)v4 != self->_redundancyPercentage)
  {
    v6 = (v4 - self->_isPacketLossIncreasing) & ~(((int)v4 - self->_isPacketLossIncreasing) >> 31);
    if (v6 >= 2)
      v6 = 2;
    self->_packetLossPercentageThreshold = a3[v6];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        packetLossPercentage = self->_packetLossPercentage;
        packetLossPercentageThreshold = self->_packetLossPercentageThreshold;
        redundancyPercentage = self->_redundancyPercentage;
        v13 = 136316674;
        v14 = v7;
        v15 = 2080;
        v16 = "-[VCRedundancyControlAlgorithmAudio updateRedundancyPercentageWithPLRThresholds:]";
        v17 = 1024;
        v18 = 159;
        v19 = 2048;
        v20 = packetLossPercentage;
        v21 = 2048;
        v22 = packetLossPercentageThreshold;
        v23 = 1024;
        v24 = redundancyPercentage;
        v25 = 1024;
        v26 = v5;
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Audio redundancy percentage change due to packet loss: %lf, new threshold: %lf [%d to %d]", (uint8_t *)&v13, 0x3Cu);
      }
    }
  }
  return v5;
}

- (unsigned)redundancyPercentage
{
  return self->_redundancyPercentage;
}

- (double)redundancyInterval
{
  return self->_redundancyInterval;
}

- (void)initWithMode:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[22];

  *(_DWORD *)v3 = 136315906;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2080;
  *(_QWORD *)&v3[14] = "-[VCRedundancyControlAlgorithmAudio initWithMode:]";
  OUTLINED_FUNCTION_5(&dword_1D8A54000, a2, a3, " [%s] %s:%d Invalid redundancy controller mode=%u", *(const char **)v3, *(const char **)&v3[8], (unint64_t)"-[VCRedundancyControlAlgorithmAudio initWithMode:]" >> 16, 69);
  OUTLINED_FUNCTION_3();
}

- (void)processNWConnectionStatistics:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];

  OUTLINED_FUNCTION_8_0();
  *(_QWORD *)&v3[6] = "-[VCRedundancyControlAlgorithmAudio processNWConnectionStatistics:]";
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d wrong type of statistics message is processed by VCRedundancyControl type=%d", v2, *(const char **)v3, (unint64_t)"-[VCRedundancyControlAlgorithmAudio processNWConnectionStatistics:]" >> 16, 96);
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
  v3 = "-[VCRedundancyControlAlgorithmAudio processRCNetworkStatistics:]";
  v4 = 1024;
  v5 = 113;
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
  v5 = "-[VCRedundancyControlAlgorithmAudio processRCNetworkStatistics:]";
  v6 = 1024;
  v7 = 109;
  _os_log_error_impl(&dword_1D8A54000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d wrong type of statistics message is processed by VCRedundancyControl", (uint8_t *)&v2, 0x1Cu);
  OUTLINED_FUNCTION_3();
}

@end
