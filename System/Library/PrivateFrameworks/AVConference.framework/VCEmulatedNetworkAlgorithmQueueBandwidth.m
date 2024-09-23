@implementation VCEmulatedNetworkAlgorithmQueueBandwidth

- (VCEmulatedNetworkAlgorithmQueueBandwidth)init
{
  VCEmulatedNetworkAlgorithmQueueBandwidth *result;
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)VCEmulatedNetworkAlgorithmQueueBandwidth;
  result = -[VCEmulatedNetworkAlgorithmQueueBandwidth init](&v3, sel_init);
  if (result)
    result->_networkQueueServiceRate = 50000000;
  return result;
}

- (void)updateSettingsAtTime:(double)a3 impairments:(id)a4
{
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  NSObject *v18;
  unsigned int networkQueueServiceRate;
  unsigned int networkQueueServiceRateMean;
  unsigned int networkQueueServiceRateStdDev;
  unsigned int networkQueueAQMRate;
  int v23;
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  unsigned int v30;
  __int16 v31;
  unsigned int v32;
  __int16 v33;
  unsigned int v34;
  __int16 v35;
  unsigned int v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("FixedBandwidth")), "objectForKeyedSubscript:", CFSTR("time"));
  v8 = (void *)objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("FixedBandwidth")), "objectForKeyedSubscript:", CFSTR("value"));
  v9 = objc_msgSend(v8, "count");
  if (v9 >= 1)
  {
    VCEmulatedNetworkAlgorithm_UpdateIndexWithIntervalArray(v7, &self->_currentIndexForServiceRate, &self->_lastNetworkQueueServiceRateLoadTime, v9, a3);
    self->_networkQueueServiceRate = objc_msgSend((id)objc_msgSend(v8, "objectAtIndexedSubscript:", self->_currentIndexForServiceRate), "intValue");
  }
  v10 = (void *)objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("GaussianBandwidth")), "objectForKeyedSubscript:", CFSTR("time"));
  v11 = (void *)objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("GaussianBandwidth")), "objectForKeyedSubscript:", CFSTR("mean"));
  v12 = (void *)objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("GaussianBandwidth")), "objectForKeyedSubscript:", CFSTR("stdDev"));
  v13 = objc_msgSend(v11, "count");
  if (v13 >= 1)
  {
    VCEmulatedNetworkAlgorithm_UpdateIndexWithIntervalArray(v10, &self->_currentIndexForServiceRateDistribution, &self->_lastNetworkQueueServiceRateDistributionLoadTime, v13, a3);
    self->_networkQueueServiceRateMean = objc_msgSend((id)objc_msgSend(v11, "objectAtIndexedSubscript:", self->_currentIndexForServiceRateDistribution), "intValue");
    self->_networkQueueServiceRateStdDev = objc_msgSend((id)objc_msgSend(v12, "objectAtIndexedSubscript:", self->_currentIndexForServiceRateDistribution), "intValue");
  }
  v14 = (void *)objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("AQMBandwidth")), "objectForKeyedSubscript:", CFSTR("time"));
  v15 = (void *)objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("AQMBandwidth")), "objectForKeyedSubscript:", CFSTR("value"));
  v16 = objc_msgSend(v15, "count");
  if (v16 >= 1)
  {
    VCEmulatedNetworkAlgorithm_UpdateIndexWithIntervalArray(v14, &self->_currentIndexForAQMRate, &self->_lastNetworkQueueAQMRateLoadTime, v16, a3);
    self->_networkQueueAQMRate = objc_msgSend((id)objc_msgSend(v15, "objectAtIndexedSubscript:", self->_currentIndexForAQMRate), "intValue");
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v17 = VRTraceErrorLogLevelToCSTR();
    v18 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      networkQueueServiceRate = self->_networkQueueServiceRate;
      networkQueueServiceRateMean = self->_networkQueueServiceRateMean;
      networkQueueServiceRateStdDev = self->_networkQueueServiceRateStdDev;
      networkQueueAQMRate = self->_networkQueueAQMRate;
      v23 = 136316674;
      v24 = v17;
      v25 = 2080;
      v26 = "-[VCEmulatedNetworkAlgorithmQueueBandwidth updateSettingsAtTime:impairments:]";
      v27 = 1024;
      v28 = 62;
      v29 = 1024;
      v30 = networkQueueServiceRate;
      v31 = 1024;
      v32 = networkQueueServiceRateMean;
      v33 = 1024;
      v34 = networkQueueServiceRateStdDev;
      v35 = 1024;
      v36 = networkQueueAQMRate;
      _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Current emulated network serviceRate=%d, serviceRateMean=%d, serviceRateStdDev=%d, AQMRate=%d", (uint8_t *)&v23, 0x34u);
    }
  }
}

- (double)computeNetworkServiceRate
{
  unsigned int networkQueueServiceRateMean;
  double v4;
  long double v5;
  double v6;
  double v7;
  long double v8;
  unint64_t v9;

  networkQueueServiceRateMean = self->_networkQueueServiceRateMean;
  if (self->_networkQueueServiceRateStdDev)
  {
    v4 = (double)networkQueueServiceRateMean;
    v5 = ((double)arc4random_uniform(0xFFFFFFFF) + 1.0) * 2.32830644e-10;
    v6 = ((double)arc4random_uniform(0xFFFFFFFF) + 1.0) * 2.32830644e-10;
    v7 = sqrt(log(v5) * -2.0);
    v8 = sin(v6 * 6.28318531);
    LODWORD(v9) = self->_networkQueueServiceRateStdDev;
    return v4 + v7 * v8 * (double)v9;
  }
  else
  {
    if (!networkQueueServiceRateMean)
      return (double)self->_networkQueueServiceRate;
    return (double)networkQueueServiceRateMean;
  }
}

- (void)process:(id)a3
{
  double v5;
  double v6;
  unsigned int v7;
  unint64_t v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  int v15;
  int v16;
  unsigned int networkQueueServiceRate;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  int v22;
  int v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  int v35;
  __int16 v36;
  int v37;
  __int16 v38;
  int v39;
  __int16 v40;
  unsigned int v41;
  __int16 v42;
  double v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  -[VCEmulatedNetworkAlgorithmQueueBandwidth computeNetworkServiceRate](self, "computeNetworkServiceRate");
  self->_networkQueueServiceRate = v5;
  v6 = 0.0;
  if ((objc_msgSend(a3, "isLost") & 1) == 0)
  {
    v7 = objc_msgSend(a3, "size");
    v8 = 8.0;
    LODWORD(v8) = self->_networkQueueServiceRate;
    v6 = (double)v7 * 8.0 / (double)v8;
  }
  objc_msgSend(a3, "networkServiceTime");
  self->_expectedProcessEndTime = v6 + v9;
  objc_msgSend(a3, "setDepartureTime:");
  if (self->_networkQueueAQMRate)
  {
    objc_msgSend(a3, "setIsDroppedByAQM:", -[VCEmulatedNetworkAlgorithmQueueBandwidth shouldDropPacketWithCurrentAQMBudget:](self, "shouldDropPacketWithCurrentAQMBudget:", a3));
    if ((objc_msgSend(a3, "isLost") & 1) != 0)
      v10 = 1;
    else
      v10 = objc_msgSend(a3, "isDroppedByAQM");
    objc_msgSend(a3, "setIsLost:", v10);
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    v13 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = objc_msgSend(a3, "packetID");
        v15 = objc_msgSend(a3, "isLost");
        v16 = objc_msgSend(a3, "size");
        networkQueueServiceRate = self->_networkQueueServiceRate;
        objc_msgSend(a3, "arrivalTime");
        v19 = v18;
        objc_msgSend(a3, "departureTime");
        v28 = 136317442;
        v29 = v11;
        v30 = 2080;
        v31 = "-[VCEmulatedNetworkAlgorithmQueueBandwidth process:]";
        v32 = 1024;
        v33 = 84;
        v34 = 1024;
        v35 = v14;
        v36 = 1024;
        v37 = v15;
        v38 = 1024;
        v39 = v16;
        v40 = 1024;
        v41 = networkQueueServiceRate;
        v42 = 2048;
        v43 = v6;
        v44 = 2048;
        v45 = v19;
        v46 = 2048;
        v47 = v20;
        _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d packetID=%d, isLost=%d, packet size=%d, serviceRate=%d, serviceTime=%f, arrivalTime=%f, departureTime=%f", (uint8_t *)&v28, 0x52u);
      }
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v21 = objc_msgSend(a3, "packetID");
      v22 = objc_msgSend(a3, "isLost");
      v23 = objc_msgSend(a3, "size");
      v24 = self->_networkQueueServiceRate;
      objc_msgSend(a3, "arrivalTime");
      v26 = v25;
      objc_msgSend(a3, "departureTime");
      v28 = 136317442;
      v29 = v11;
      v30 = 2080;
      v31 = "-[VCEmulatedNetworkAlgorithmQueueBandwidth process:]";
      v32 = 1024;
      v33 = 84;
      v34 = 1024;
      v35 = v21;
      v36 = 1024;
      v37 = v22;
      v38 = 1024;
      v39 = v23;
      v40 = 1024;
      v41 = v24;
      v42 = 2048;
      v43 = v6;
      v44 = 2048;
      v45 = v26;
      v46 = 2048;
      v47 = v27;
      _os_log_debug_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEBUG, " [%s] %s:%d packetID=%d, isLost=%d, packet size=%d, serviceRate=%d, serviceTime=%f, arrivalTime=%f, departureTime=%f", (uint8_t *)&v28, 0x52u);
    }
  }
}

- (BOOL)shouldDropPacketWithCurrentAQMBudget:(id)a3
{
  int v5;

  if ((objc_msgSend(a3, "isLost") & 1) == 0)
  {
    v5 = objc_msgSend(a3, "size");
    if (v5 > -[VCEmulatedNetworkAlgorithmQueueBandwidth getRemainingAQMBudgetWithPacket:](self, "getRemainingAQMBudgetWithPacket:", a3))return 1;
    -[VCEmulatedNetworkAlgorithmQueueBandwidth addPacketToBudgetBuffer:](self, "addPacketToBudgetBuffer:", a3);
  }
  return 0;
}

- (void)addPacketToBudgetBuffer:(id)a3
{
  int *p_budgentBufferIndex;
  int budgetBufferSize;
  int v7;
  BOOL v8;
  int v9;
  int v10;
  double v11;

  p_budgentBufferIndex = &self->_budgentBufferIndex;
  budgetBufferSize = self->_budgetBufferSize;
  if (budgetBufferSize < 1)
    goto LABEL_5;
  v7 = *p_budgentBufferIndex + 1;
  v8 = -v7 < 0;
  v9 = -v7 & 0xFFF;
  v10 = v7 & 0xFFF;
  if (!v8)
    v10 = -v9;
  *p_budgentBufferIndex = v10;
  if (budgetBufferSize <= 0xFFF)
LABEL_5:
    self->_budgetBufferSize = budgetBufferSize + 1;
  objc_msgSend(a3, "arrivalTime");
  self->_budgetBufferPktTime[*p_budgentBufferIndex] = v11;
  self->_budgetBufferPktSize[*p_budgentBufferIndex] = (double)objc_msgSend(a3, "size");
}

- (int)getRemainingAQMBudgetWithPacket:(id)a3
{
  unint64_t v3;
  int *p_budgentBufferIndex;
  double v6;
  double v7;
  int v8;
  int result;
  double v10;
  int v11;
  int v12;

  p_budgentBufferIndex = &self->_budgentBufferIndex;
  LODWORD(v3) = self->_networkQueueAQMRate;
  v6 = (double)v3 * 0.5 * 0.125;
  objc_msgSend(a3, "arrivalTime");
  v8 = p_budgentBufferIndex[1];
  result = (int)v6;
  if (v8 >= 1)
  {
    v10 = v7 + -0.5;
    v11 = *p_budgentBufferIndex;
    do
    {
      if (v11 <= 0)
        v12 = -(-v11 & 0xFFF);
      else
        v12 = v11 & 0xFFF;
      if (self->_budgetBufferPktTime[v12] <= v10)
        break;
      result = (int)((double)result - self->_budgetBufferPktSize[v12]);
      --v11;
      --v8;
    }
    while (v8);
  }
  return result;
}

- (double)expectedProcessEndTime
{
  return self->_expectedProcessEndTime;
}

- (unsigned)packetCountInNetworkQueue
{
  return self->_packetCountInNetworkQueue;
}

- (void)setPacketCountInNetworkQueue:(unsigned int)a3
{
  self->_packetCountInNetworkQueue = a3;
}

- (int)packetCountBytesInNetworkQueue
{
  return self->_packetCountBytesInNetworkQueue;
}

- (void)setPacketCountBytesInNetworkQueue:(int)a3
{
  self->_packetCountBytesInNetworkQueue = a3;
}

@end
