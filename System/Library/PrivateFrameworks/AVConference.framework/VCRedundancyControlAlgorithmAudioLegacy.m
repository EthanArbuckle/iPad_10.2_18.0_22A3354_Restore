@implementation VCRedundancyControlAlgorithmAudioLegacy

- (void)updateRedundancyStrategyWithNetworkStatistics:(tagVCStatisticsMessage *)a3
{
  uint64_t v3;
  NSObject *v4;

  if (a3->type == 3)
  {
    self->_packetLossPercentage = a3->var0.network.packetLossPercentage;
    self->_isUplinkRecentlyCongested = a3->var0.feedback.videoReceivedPackets != 0;
    -[VCRedundancyControlAlgorithmAudioLegacy computeRedundancyInfo](self, "computeRedundancyInfo");
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCRedundancyControlAlgorithmAudioLegacy updateRedundancyStrategyWithNetworkStatistics:].cold.1(v3, v4);
  }
}

- (void)computeRedundancyInfo
{
  int v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = *a2;
  v4 = 136315906;
  v5 = a1;
  v6 = 2080;
  v7 = "-[VCRedundancyControlAlgorithmAudioLegacy computeRedundancyInfo]";
  v8 = 1024;
  v9 = 61;
  v10 = 1024;
  v11 = v3;
  _os_log_error_impl(&dword_1D8A54000, log, OS_LOG_TYPE_ERROR, " [%s] %s:%d Redundancy percentage: %d is out of bound in legacy duplication", (uint8_t *)&v4, 0x22u);
}

- (unsigned)redundancyPercentage
{
  return self->_redundancyPercentage;
}

- (double)redundancyInterval
{
  return self->_redundancyInterval;
}

- (void)updateRedundancyStrategyWithNetworkStatistics:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
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
  v5 = "-[VCRedundancyControlAlgorithmAudioLegacy updateRedundancyStrategyWithNetworkStatistics:]";
  v6 = 1024;
  v7 = 24;
  _os_log_error_impl(&dword_1D8A54000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d wrong type of statistics message is processed by VCRedundancyControl", (uint8_t *)&v2, 0x1Cu);
}

@end
