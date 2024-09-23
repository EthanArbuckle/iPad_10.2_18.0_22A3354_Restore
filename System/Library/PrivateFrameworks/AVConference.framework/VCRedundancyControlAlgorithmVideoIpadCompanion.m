@implementation VCRedundancyControlAlgorithmVideoIpadCompanion

- (void)updateRedundancyStrategyWithNetworkStatistics:(tagVCStatisticsMessage *)a3
{
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  NSObject *v8;

  if (a3->type == 3)
  {
    self->_packetLossPercentage = a3->var0.network.packetLossPercentage;
    -[VCRedundancyControlAlgorithmVideoIpadCompanion updateBurstyLoss:](self, "updateBurstyLoss:", a3->var0.baseband.transmittedBytes);
    v4 = -[VCRedundancyControlAlgorithmVideoIpadCompanion computeRedundancyWithLossPercentage](self, "computeRedundancyWithLossPercentage");
    v5 = -[VCRedundancyControlAlgorithmVideoIpadCompanion computeRedundancyWithBurstyLoss](self, "computeRedundancyWithBurstyLoss");
    if (v4 <= v5)
      v6 = v5;
    else
      v6 = v4;
    self->_redundancyPercentage = v6;
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCRedundancyControlAlgorithmVideoIpadCompanion updateRedundancyStrategyWithNetworkStatistics:].cold.1(v7, v8);
  }
}

- (void)updateBurstyLoss:(unsigned int)a3
{
  unsigned int burstyLossArraySize;

  self->_burstyLoss[self->_burstyLossArrayIndex] = a3;
  self->_burstyLossArrayIndex = (self->_burstyLossArrayIndex + 1) % 0x1F4;
  burstyLossArraySize = self->_burstyLossArraySize;
  if (burstyLossArraySize <= 0x1F3)
    self->_burstyLossArraySize = burstyLossArraySize + 1;
}

- (unsigned)computeRedundancyWithLossPercentage
{
  unsigned int packetLossPercentage;
  int v3;
  unsigned int v4;

  packetLossPercentage = self->_packetLossPercentage;
  if (packetLossPercentage >= 0xB)
    v3 = 100;
  else
    v3 = 50;
  if (packetLossPercentage >= 6)
    v4 = v3;
  else
    v4 = 25;
  if (packetLossPercentage >= 2)
    return v4;
  else
    return 0;
}

- (unsigned)computeRedundancyWithBurstyLoss
{
  uint64_t burstyLossArraySize;
  unsigned int v3;
  unsigned int *burstyLoss;
  unsigned int v5;
  unsigned int v6;

  burstyLossArraySize = self->_burstyLossArraySize;
  if (!(_DWORD)burstyLossArraySize)
    return 0;
  v3 = 0;
  burstyLoss = self->_burstyLoss;
  do
  {
    v6 = *burstyLoss++;
    v5 = v6;
    if (v3 <= v6)
      v3 = v5;
    --burstyLossArraySize;
  }
  while (burstyLossArraySize);
  if (!v3)
    return 0;
  if (v3 < 3)
    return 25;
  if (v3 >= 5)
    return 100;
  return 50;
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
  v5 = "-[VCRedundancyControlAlgorithmVideoIpadCompanion updateRedundancyStrategyWithNetworkStatistics:]";
  v6 = 1024;
  v7 = 28;
  _os_log_error_impl(&dword_1D8A54000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d wrong type of statistics message is processed by VCRedundancyControl", (uint8_t *)&v2, 0x1Cu);
}

@end
