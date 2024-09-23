@implementation VCMediaStreamStats

- (VCMediaStreamStats)init
{
  id v2;
  VCMediaStreamStats *v3;
  uint64_t v4;
  NSObject *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)VCMediaStreamStats;
  v2 = -[VCMediaStreamStats init](&v7, sel_init);
  v3 = (VCMediaStreamStats *)v2;
  if (v2)
  {
    if ((SummerCreateHandle((uint64_t *)v2 + 1, 400) & 0x80000000) != 0 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaStreamStats init].cold.1(v4, v5);
    }
    v3->_minFramerate = 1.79769313e308;
    v3->_minBitrateKbps = -1;
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if (self->_summerHandle != (tagHANDLE *)0xFFFFFFFFLL)
    SummerCloseHandle();
  v3.receiver = self;
  v3.super_class = (Class)VCMediaStreamStats;
  -[VCMediaStreamStats dealloc](&v3, sel_dealloc);
}

- (void)recordDataWithSize:(double)a3 atTime:(double)a4
{
  double lastRecordingTime;
  unsigned int v7;

  SummerAdd(a3, a4);
  lastRecordingTime = self->_lastRecordingTime;
  if (lastRecordingTime != 0.0)
  {
    v7 = (int)((a4 - lastRecordingTime) * 1000.0 + 0.5);
    if (self->_maxFrameDurationMillis < v7)
      self->_maxFrameDurationMillis = v7;
  }
  self->_lastRecordingTime = a4;
}

- (double)framerate
{
  double result;

  -[VCMediaStreamStats getFramerateSinceTime:](self, "getFramerateSinceTime:", micro() + -1.0);
  return result;
}

- (unsigned)bitrateKbps
{
  return -[VCMediaStreamStats getBitrateKbpsSinceTime:](self, "getBitrateKbpsSinceTime:", micro() + -1.0);
}

- (void)updateMinMaxSinceTime:(double)a3
{
  double v5;
  unsigned int v6;

  -[VCMediaStreamStats getFramerateSinceTime:](self, "getFramerateSinceTime:");
  if (self->_maxFramerate < v5)
    self->_maxFramerate = v5;
  if (self->_minFramerate > v5)
    self->_minFramerate = v5;
  v6 = -[VCMediaStreamStats getBitrateKbpsSinceTime:](self, "getBitrateKbpsSinceTime:", a3);
  if (self->_maxBitrateKbps < v6)
    self->_maxBitrateKbps = v6;
  if (self->_minBitrateKbps > v6)
    self->_minBitrateKbps = v6;
}

- (double)getFramerateSinceTime:(double)a3
{
  int v3;
  double result;
  double v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6 = -1431655766;
  v5 = NAN;
  v3 = SummerLengthPred(a3, (uint64_t)self->_summerHandle, (uint64_t (*)(double, double, double))SummerGreaterThan, &v5, &v6);
  result = 0.0;
  if ((v3 & 0x80000000) == 0 && v5 > 0.0)
    return (double)v6 / v5;
  return result;
}

- (unsigned)getBitrateKbpsSinceTime:(double)a3
{
  double v3;
  double v5;
  double v6[2];

  v6[1] = *(double *)MEMORY[0x1E0C80C00];
  v5 = NAN;
  v6[0] = NAN;
  v3 = 0.0;
  if ((SummerSumPred(a3, 0.0, (uint64_t)self->_summerHandle, (unsigned int (*)(double, double, double))SummerGreaterThan, (double (*)(double, double, double))SummerIdentity, &v5, v6) & 0x80000000) == 0&& v5 > 0.0)
  {
    v3 = v6[0] * 8.0 / v5;
  }
  return (v3 / 1000.0 + 0.5);
}

- (unsigned)minBitrateKbps
{
  return self->_minBitrateKbps;
}

- (void)setMinBitrateKbps:(unsigned int)a3
{
  self->_minBitrateKbps = a3;
}

- (unsigned)maxBitrateKbps
{
  return self->_maxBitrateKbps;
}

- (void)setMaxBitrateKbps:(unsigned int)a3
{
  self->_maxBitrateKbps = a3;
}

- (double)minFramerate
{
  return self->_minFramerate;
}

- (void)setMinFramerate:(double)a3
{
  self->_minFramerate = a3;
}

- (double)maxFramerate
{
  return self->_maxFramerate;
}

- (void)setMaxFramerate:(double)a3
{
  self->_maxFramerate = a3;
}

- (unsigned)maxFrameDurationMillis
{
  return self->_maxFrameDurationMillis;
}

- (void)setMaxFrameDurationMillis:(unsigned __int16)a3
{
  self->_maxFrameDurationMillis = a3;
}

- (void)init
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
  v5 = "-[VCMediaStreamStats init]";
  v6 = 1024;
  v7 = 24;
  _os_log_error_impl(&dword_1D8A54000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d failed to create Summer handle!", (uint8_t *)&v2, 0x1Cu);
}

@end
