@implementation VCEmulatedNetworkAlgorithmQueueDelay

- (VCEmulatedNetworkAlgorithmQueueDelay)init
{
  VCEmulatedNetworkAlgorithmQueueDelay *result;
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)VCEmulatedNetworkAlgorithmQueueDelay;
  result = -[VCEmulatedNetworkAlgorithmQueueDelay init](&v3, sel_init);
  if (result)
    result->_networkQueueDelay = 0;
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
  uint64_t v14;
  NSObject *v15;
  unsigned int networkQueueDelay;
  unsigned int networkQueueDelayMean;
  unsigned int networkQueueDelayStdDev;
  int v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  unsigned int v26;
  __int16 v27;
  unsigned int v28;
  __int16 v29;
  unsigned int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("FixedDelay")), "objectForKeyedSubscript:", CFSTR("time"));
  v8 = (void *)objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("FixedDelay")), "objectForKeyedSubscript:", CFSTR("value"));
  v9 = objc_msgSend(v8, "count");
  if (v9 >= 1)
  {
    VCEmulatedNetworkAlgorithm_UpdateIndexWithIntervalArray(v7, &self->_currentIndexForDelay, &self->_lastNetworkQueueDelayLoadTime, v9, a3);
    self->_networkQueueDelay = objc_msgSend((id)objc_msgSend(v8, "objectAtIndexedSubscript:", self->_currentIndexForDelay), "intValue");
  }
  v10 = (void *)objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("GaussianDelay")), "objectForKeyedSubscript:", CFSTR("time"));
  v11 = (void *)objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("GaussianDelay")), "objectForKeyedSubscript:", CFSTR("mean"));
  v12 = (void *)objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("GaussianDelay")), "objectForKeyedSubscript:", CFSTR("stdDev"));
  v13 = objc_msgSend(v11, "count");
  if (v13 >= 1)
  {
    VCEmulatedNetworkAlgorithm_UpdateIndexWithIntervalArray(v10, &self->_currentIndexForDelayDistribution, &self->_lastNetworkQueueDelayDistributionLoadTime, v13, a3);
    self->_networkQueueDelayMean = objc_msgSend((id)objc_msgSend(v11, "objectAtIndexedSubscript:", self->_currentIndexForDelayDistribution), "intValue");
    self->_networkQueueDelayStdDev = objc_msgSend((id)objc_msgSend(v12, "objectAtIndexedSubscript:", self->_currentIndexForDelayDistribution), "intValue");
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      networkQueueDelay = self->_networkQueueDelay;
      networkQueueDelayMean = self->_networkQueueDelayMean;
      networkQueueDelayStdDev = self->_networkQueueDelayStdDev;
      v19 = 136316418;
      v20 = v14;
      v21 = 2080;
      v22 = "-[VCEmulatedNetworkAlgorithmQueueDelay updateSettingsAtTime:impairments:]";
      v23 = 1024;
      v24 = 49;
      v25 = 1024;
      v26 = networkQueueDelay;
      v27 = 1024;
      v28 = networkQueueDelayMean;
      v29 = 1024;
      v30 = networkQueueDelayStdDev;
      _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Current emulated network delay: [%d, %d, %d]", (uint8_t *)&v19, 0x2Eu);
    }
  }
}

- (double)computeNetworkDelay
{
  unsigned int networkQueueDelayMean;
  double v4;
  long double v5;
  double v6;
  double v7;
  long double v8;
  unint64_t v9;

  networkQueueDelayMean = self->_networkQueueDelayMean;
  if (self->_networkQueueDelayStdDev)
  {
    v4 = (double)networkQueueDelayMean;
    v5 = ((double)arc4random_uniform(0xFFFFFFFF) + 1.0) * 2.32830644e-10;
    v6 = ((double)arc4random_uniform(0xFFFFFFFF) + 1.0) * 2.32830644e-10;
    v7 = sqrt(log(v5) * -2.0);
    v8 = sin(v6 * 6.28318531);
    LODWORD(v9) = self->_networkQueueDelayStdDev;
    networkQueueDelayMean = (v4 + v7 * v8 * (double)v9);
  }
  else if (!networkQueueDelayMean)
  {
    networkQueueDelayMean = self->_networkQueueDelay;
  }
  return (double)networkQueueDelayMean / 1000.0;
}

- (void)process:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  -[VCEmulatedNetworkAlgorithmQueueDelay computeNetworkDelay](self, "computeNetworkDelay");
  v6 = v5;
  objc_msgSend(a3, "departureTime");
  v8 = v7;
  objc_msgSend(a3, "arrivalTime");
  v10 = v9;
  objc_msgSend(a3, "departureTime");
  if (v11 == 0.0 || (objc_msgSend(a3, "arrivalTime"), v13 == 0.0) || v8 - v10 > v6)
  {
    objc_msgSend(a3, "departureTime");
    self->_expectedProcessEndTime = v12;
  }
  else
  {
    objc_msgSend(a3, "arrivalTime", v8 - v10);
    self->_expectedProcessEndTime = v6 + v14;
    objc_msgSend(a3, "setDepartureTime:");
  }
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
