@implementation VCRedundancyControlAlgorithmVideoMultiway

- (VCRedundancyControlAlgorithmVideoMultiway)init
{
  VCRedundancyControlAlgorithmVideoMultiway *result;
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)VCRedundancyControlAlgorithmVideoMultiway;
  result = -[VCRedundancyControlAlgorithmVideoMultiway init](&v3, sel_init);
  if (result)
  {
    result->_redundancyPercentage = 0;
    result->_lastPercentageChange = NAN;
  }
  return result;
}

- (void)updateRedundancyStrategyWithNetworkStatistics:(tagVCStatisticsMessage *)a3
{
  uint64_t v3;
  NSObject *v4;

  if (a3->type == 3)
  {
    self->_currentTime = a3->arrivalTime;
    self->_packetLossPercentage = a3->var0.network.packetLossPercentage;
    -[VCRedundancyControlAlgorithmVideoMultiway updateRedundancyPercentage](self, "updateRedundancyPercentage");
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCRedundancyControlAlgorithmVideoMultiway updateRedundancyStrategyWithNetworkStatistics:].cold.1(v3, v4);
  }
}

- (void)updateRedundancyPercentage
{
  double packetLossPercentage;
  double plrEnvelope;
  double v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  float v9;
  float v10;
  unsigned int v11;
  unsigned int redundancyPercentage;
  _BOOL4 v13;
  uint64_t v15;
  NSObject *v16;
  unsigned int v17;
  float v18;
  float v19;
  float v20;
  float v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  _BYTE v29[10];
  _BYTE v30[10];
  __int16 v31;
  double v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  packetLossPercentage = self->_packetLossPercentage;
  plrEnvelope = self->_plrEnvelope;
  v5 = dbl_1D910D6E0[plrEnvelope < packetLossPercentage];
  self->_plrEnvelope = plrEnvelope * (1.0 - v5) + packetLossPercentage * v5;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    v8 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = self->_packetLossPercentage;
        v10 = self->_plrEnvelope;
        v22 = 136316162;
        v23 = v6;
        v24 = 2080;
        v25 = "-[VCRedundancyControlAlgorithmVideoMultiway updateRedundancyPercentage]";
        v26 = 1024;
        v27 = 80;
        v28 = 2048;
        *(double *)v29 = v9;
        *(_WORD *)&v29[8] = 2048;
        *(double *)v30 = v10;
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Redundancy level _packetLossPercentage=%2.2f _plrEnvelope=%2.2f ", (uint8_t *)&v22, 0x30u);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v20 = self->_packetLossPercentage;
      v21 = self->_plrEnvelope;
      v22 = 136316162;
      v23 = v6;
      v24 = 2080;
      v25 = "-[VCRedundancyControlAlgorithmVideoMultiway updateRedundancyPercentage]";
      v26 = 1024;
      v27 = 80;
      v28 = 2048;
      *(double *)v29 = v20;
      *(_WORD *)&v29[8] = 2048;
      *(double *)v30 = v21;
      _os_log_debug_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Redundancy level _packetLossPercentage=%2.2f _plrEnvelope=%2.2f ", (uint8_t *)&v22, 0x30u);
    }
  }
  if (self->_plrEnvelope >= 0.5)
    v11 = 50;
  else
    v11 = 0;
  redundancyPercentage = self->_redundancyPercentage;
  v13 = self->_currentTime - self->_lastPercentageChange >= 5.0;
  if (v11 >= redundancyPercentage)
    v13 = 1;
  if (redundancyPercentage != v11 && v13)
  {
    self->_redundancyPercentage = v11;
    self->_lastPercentageChange = self->_currentTime;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v17 = self->_redundancyPercentage;
        v18 = self->_packetLossPercentage;
        v19 = self->_plrEnvelope;
        v22 = 136316674;
        v23 = v15;
        v24 = 2080;
        v25 = "-[VCRedundancyControlAlgorithmVideoMultiway updateRedundancyPercentage]";
        v26 = 1024;
        v27 = 90;
        v28 = 1024;
        *(_DWORD *)v29 = v17;
        *(_WORD *)&v29[4] = 1024;
        *(_DWORD *)&v29[6] = v11;
        *(_WORD *)v30 = 2048;
        *(double *)&v30[2] = v18;
        v31 = 2048;
        v32 = v19;
        _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Redundancy level changed from _redundancyPercentage=%d to newRedundancyPercentage=%d _packetLossPercentage=%3.3f _plrEnvelope=%3.3f", (uint8_t *)&v22, 0x3Cu);
      }
    }
  }
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
  v5 = "-[VCRedundancyControlAlgorithmVideoMultiway updateRedundancyStrategyWithNetworkStatistics:]";
  v6 = 1024;
  v7 = 67;
  _os_log_error_impl(&dword_1D8A54000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d wrong type of statistics message is processed by VCRedundancyControl", (uint8_t *)&v2, 0x1Cu);
}

@end
