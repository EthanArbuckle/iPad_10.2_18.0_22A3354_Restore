@implementation IMPingStatistics

- (IMPingStatistics)initWithMaxRTT:(double)a3 medianRTT:(double)a4 avgRTT:(double)a5 minRTT:(double)a6 transmitted:(int)a7 successful:(int)a8 received:(int)a9
{
  IMPingStatistics *result;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)IMPingStatistics;
  result = -[IMPingStatistics init](&v17, sel_init);
  if (result)
  {
    result->_medianRoundtripTime = a4;
    result->_averageRoundtripTime = a5;
    result->_minRoundtripTime = a6;
    result->_maxRoundtripTime = a3;
    result->_numPingsTransmitted = a7;
    result->_numPingsReceived = a9;
    result->_numPacketsSuccessfullySent = a8;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  id result;

  v5 = (void *)objc_msgSend_allocWithZone_(IMPingStatistics, a2, (uint64_t)a3, v3);
  result = (id)objc_msgSend_initWithMaxRTT_medianRTT_avgRTT_minRTT_transmitted_successful_received_(v5, v6, self->_numPingsTransmitted, self->_numPacketsSuccessfullySent, self->_numPingsReceived, self->_maxRoundtripTime, self->_medianRoundtripTime, self->_averageRoundtripTime, self->_minRoundtripTime);
  if (result)
    *((_QWORD *)result + 8) = *(_QWORD *)&self->_standardDeviationRoundtripTime;
  return result;
}

- (void)_addTransmittedPacket:(BOOL)a3
{
  ++self->_numPingsTransmitted;
  if (a3)
    ++self->_numPacketsSuccessfullySent;
}

- (void)_addReceivedPacket:(double)a3
{
  double minRoundtripTime;
  double v5;
  int numPingsReceived;

  minRoundtripTime = self->_minRoundtripTime;
  if (minRoundtripTime == 0.0 || minRoundtripTime > a3)
    self->_minRoundtripTime = a3;
  if (self->_maxRoundtripTime < a3)
    self->_maxRoundtripTime = a3;
  v5 = self->_sumRoundtripTimes + a3;
  self->_sumRoundtripTimes = v5;
  numPingsReceived = self->_numPingsReceived;
  self->_averageRoundtripTime = v5 / (double)numPingsReceived;
  self->_numPingsReceived = numPingsReceived + 1;
}

- (double)packetLossRate
{
  int numPingsTransmitted;

  numPingsTransmitted = self->_numPingsTransmitted;
  if (numPingsTransmitted)
    return 1.0 - (float)((float)self->_numPingsReceived / (float)numPingsTransmitted);
  else
    return 0.0;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  double standardDeviationRoundtripTime;
  uint64_t numPingsTransmitted;
  uint64_t numPacketsSuccessfullySent;
  uint64_t numPingsReceived;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v14 = *(_OWORD *)&self->_minRoundtripTime;
  v13 = *(_OWORD *)&self->_medianRoundtripTime;
  standardDeviationRoundtripTime = self->_standardDeviationRoundtripTime;
  numPacketsSuccessfullySent = self->_numPacketsSuccessfullySent;
  numPingsTransmitted = self->_numPingsTransmitted;
  numPingsReceived = self->_numPingsReceived;
  objc_msgSend_packetLossRate(self, a2, v2, v3);
  return (id)objc_msgSend_stringWithFormat_(v4, v9, (uint64_t)CFSTR("Ping Statistics:sent = %d, successful = %d, received = %d, min = %f, max = %f, median = %f, average = %f, standardDeviation = %f, packetLossRate = %f"), v10, numPingsTransmitted, numPacketsSuccessfullySent, numPingsReceived, v14, v13, *(_QWORD *)&standardDeviationRoundtripTime, v11);
}

- (double)medianRoundtripTime
{
  return self->_medianRoundtripTime;
}

- (void)_setMedianRoundtripTime:(double)a3
{
  self->_medianRoundtripTime = a3;
}

- (double)averageRoundtripTime
{
  return self->_averageRoundtripTime;
}

- (double)minRoundtripTime
{
  return self->_minRoundtripTime;
}

- (void)_setMinRoundtripTime:(double)a3
{
  self->_minRoundtripTime = a3;
}

- (double)maxRoundtripTime
{
  return self->_maxRoundtripTime;
}

- (void)_setMaxRoundtripTime:(double)a3
{
  self->_maxRoundtripTime = a3;
}

- (int)numPingsTransmitted
{
  return self->_numPingsTransmitted;
}

- (int)numPingsReceived
{
  return self->_numPingsReceived;
}

- (int)packetsSuccessfullySent
{
  return self->_packetsSuccessfullySent;
}

- (double)standardDeviationRoundtripTime
{
  return self->_standardDeviationRoundtripTime;
}

- (void)_setStandardDeviationRoundtripTime:(double)a3
{
  self->_standardDeviationRoundtripTime = a3;
}

@end
