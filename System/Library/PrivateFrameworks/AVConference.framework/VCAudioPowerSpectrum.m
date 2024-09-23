@implementation VCAudioPowerSpectrum

- (VCAudioPowerSpectrum)initWithBinCount:(unsigned int)a3 streamToken:(int64_t)a4 sinkContext:(void *)a5 sinkCallback:(void *)a6
{
  VCAudioPowerSpectrum *result;
  uint64_t v11;
  NSObject *v12;
  objc_super v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  unsigned int v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (a3 && a5 && a6)
  {
    v13.receiver = self;
    v13.super_class = (Class)VCAudioPowerSpectrum;
    result = -[VCAudioPowerSpectrum init](&v13, sel_init);
    if (result)
    {
      result->_realtimeContext.outputBinCount = a3;
      result->_streamToken = a4;
      result->_realtimeContext.sinkContext = a5;
      result->_realtimeContext.sinkCallback = a6;
      result->_realtimeContext.averageLevel = -120.0;
      result->_realtimeContext.streamToken = a4;
    }
  }
  else
  {

    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        v15 = v11;
        v16 = 2080;
        v17 = "-[VCAudioPowerSpectrum initWithBinCount:streamToken:sinkContext:sinkCallback:]";
        v18 = 1024;
        v19 = 35;
        v20 = 1024;
        v21 = a3;
        v22 = 2048;
        v23 = a5;
        v24 = 2048;
        v25 = a6;
        _os_log_error_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_ERROR, " [%s] %s:%d Power spectrum initialzed with incorrect arguments: binCount[%d] sinkContext[%p] sinkCallback[%p]!", buf, 0x36u);
      }
    }
    return 0;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  _VCAudioPowerSpectrum_CleanUp((uint64_t)&self->_realtimeContext);
  v3.receiver = self;
  v3.super_class = (Class)VCAudioPowerSpectrum;
  -[VCAudioPowerSpectrum dealloc](&v3, sel_dealloc);
}

- (void)realtimeContext
{
  return &self->_realtimeContext;
}

- (_VCRange)frequencyRange
{
  float min;
  float max;
  _VCRange result;

  min = self->_realtimeContext.frequencyRange.min;
  max = self->_realtimeContext.frequencyRange.max;
  result.max = max;
  result.min = min;
  return result;
}

- (NSString)description
{
  id v3;
  objc_class *v4;
  void *v5;
  unint64_t v6;
  _VCAudioPowerSpectrumChannel *channels;
  char *v8;
  unsigned int *v9;
  int v10;
  unsigned int v11;
  float *v12;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@: [%f;%f] : "),
                 NSStringFromClass(v4),
                 self->_realtimeContext.frequencyRange.min,
                 self->_realtimeContext.frequencyRange.max);
  if (self->_realtimeContext.format.mChannelsPerFrame)
  {
    v6 = 0;
    do
    {
      channels = self->_realtimeContext.channels;
      objc_msgSend(v5, "appendFormat:", CFSTR("\n channel[%d] bins:"), v6);
      v8 = (char *)channels + 112 * v6;
      v10 = *((_DWORD *)v8 + 24);
      v9 = (unsigned int *)(v8 + 96);
      if (v10)
      {
        v11 = 0;
        v12 = (float *)(*((_QWORD *)channels + 14 * v6 + 13) + 8);
        do
        {
          objc_msgSend(v5, "appendFormat:", CFSTR("[%f;%f;%f]"), *v12, *(v12 - 2), *(v12 - 1));
          ++v11;
          v12 += 3;
        }
        while (v11 < *v9);
      }
      ++v6;
    }
    while (v6 < self->_realtimeContext.format.mChannelsPerFrame);
  }
  return (NSString *)v5;
}

- (int64_t)streamToken
{
  return self->_streamToken;
}

@end
