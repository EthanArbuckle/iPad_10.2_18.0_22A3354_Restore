@implementation CSAudioZeroCounter

- (CSAudioZeroCounter)initWithToken:(id)a3 sampleRate:(float)a4 numChannels:(unsigned int)a5
{
  id v9;
  CSAudioZeroCounter *v10;
  CSAudioZeroCounter *v11;
  _BOOL4 v12;
  int numChannels;
  objc_super v15;

  v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CSAudioZeroCounter;
  v10 = -[CSAudioZeroCounter init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_continuousZeroCounter = 0;
    objc_storeStrong((id *)&v10->_methodToken, a3);
    v11->_sampleRate = a4;
    v11->_numChannels = a5;
    v11->_zeroCounterWinSzForCSLogging = (float)((float)((float)+[CSConfig zeroFilterWindowSizeInMsForCSLogging](CSConfig, "zeroFilterWindowSizeInMsForCSLogging")/ 1000.0)* a4);
    v11->_zeroCounterHeartBeatThreshold = (float)((float)((float)+[CSConfig zeroFilterCSLoggingHeartBeatThresholdInMS](CSConfig, "zeroFilterCSLoggingHeartBeatThresholdInMS")/ 1000.0)* a4);
    v11->_zeroCounterWinSzForReport = (float)((float)((float)+[CSConfig zeroFilterWindowSizeInMsForReport](CSConfig, "zeroFilterWindowSizeInMsForReport")/ 1000.0)* a4);
    v12 = +[CSUtils shouldDeinterleaveAudioOnCS](CSUtils, "shouldDeinterleaveAudioOnCS");
    v11->_shouldDeinterleaveAudio = v12;
    if (v12)
      numChannels = v11->_numChannels;
    else
      numChannels = 1;
    v11->_analyzeStep = numChannels;
    v11->_maxContinuousZeroCount = 0;
    v11->_loggingSampleHeartBeat = 0;
  }

  return v11;
}

- (void)resetWithSampleRate:(float)a3
{
  unint64_t v5;

  self->_sampleRate = a3;
  self->_zeroCounterWinSzForCSLogging = (float)((float)((float)+[CSConfig zeroFilterWindowSizeInMsForCSLogging](CSConfig, "zeroFilterWindowSizeInMsForCSLogging")/ 1000.0)* a3);
  self->_zeroCounterWinSzForReport = (float)((float)((float)+[CSConfig zeroFilterWindowSizeInMsForReport](CSConfig, "zeroFilterWindowSizeInMsForReport")/ 1000.0)* a3);
  v5 = +[CSConfig zeroFilterCSLoggingHeartBeatThresholdInMS](CSConfig, "zeroFilterCSLoggingHeartBeatThresholdInMS");
  self->_maxContinuousZeroCount = 0;
  *(_QWORD *)&self->_zeroCounterHeartBeatThreshold = (float)((float)((float)v5 / 1000.0) * a3);
}

- (void)getZeroStatisticsFromBuffer:(id)a3 entireSamples:(unsigned int)a4
{
  id v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int maxContinuousZeroCount;
  unsigned int continuousZeroCounter;
  unsigned int v11;
  void *v12;
  NSObject *v13;
  unsigned int v14;
  unsigned int zeroCounterWinSzForCSLogging;
  unsigned int v16;
  unsigned int loggingSampleHeartBeat;
  NSObject *v18;
  NSString *v19;
  unsigned int v20;
  NSString *methodToken;
  unsigned int v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  NSString *v26;
  __int16 v27;
  unsigned int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = objc_retainAutorelease(a3);
  v7 = objc_msgSend(v6, "bytes");
  if (!self->_shouldDeinterleaveAudio)
    a4 /= self->_numChannels;
  if (a4)
  {
    v8 = 0;
    while (!*(_WORD *)(v7 + 2 * v8))
    {
      zeroCounterWinSzForCSLogging = self->_zeroCounterWinSzForCSLogging;
      v16 = self->_continuousZeroCounter + 1;
      self->_continuousZeroCounter = v16;
      if (v16 > zeroCounterWinSzForCSLogging)
      {
        loggingSampleHeartBeat = self->_loggingSampleHeartBeat;
        if (!(loggingSampleHeartBeat % self->_zeroCounterHeartBeatThreshold))
        {
          v18 = CSLogCategoryAudio;
          if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
          {
            methodToken = self->_methodToken;
            *(_DWORD *)buf = 136315650;
            v24 = "-[CSAudioZeroCounter getZeroStatisticsFromBuffer:entireSamples:]";
            v25 = 2112;
            v26 = methodToken;
            v27 = 1026;
            v28 = v16;
            _os_log_error_impl(&dword_1B502E000, v18, OS_LOG_TYPE_ERROR, "%s In %@: Continuous digital zero in this audio chunk detected, lasting %{public}u samples per channel", buf, 0x1Cu);
            loggingSampleHeartBeat = self->_loggingSampleHeartBeat;
          }
        }
        v14 = loggingSampleHeartBeat + 1;
        goto LABEL_18;
      }
LABEL_19:
      v8 += self->_analyzeStep;
      if (v8 >= a4)
        goto LABEL_20;
    }
    maxContinuousZeroCount = self->_maxContinuousZeroCount;
    continuousZeroCounter = self->_continuousZeroCounter;
    v11 = self->_zeroCounterWinSzForCSLogging;
    if (maxContinuousZeroCount <= continuousZeroCounter)
      maxContinuousZeroCount = self->_continuousZeroCounter;
    self->_maxContinuousZeroCount = maxContinuousZeroCount;
    if (continuousZeroCounter > v11)
    {
      v12 = (void *)MEMORY[0x1B5E46720]();
      v13 = CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
      {
        v19 = self->_methodToken;
        v20 = self->_continuousZeroCounter;
        *(_DWORD *)buf = 136315650;
        v24 = "-[CSAudioZeroCounter getZeroStatisticsFromBuffer:entireSamples:]";
        v25 = 2112;
        v26 = v19;
        v27 = 1026;
        v28 = v20;
        _os_log_error_impl(&dword_1B502E000, v13, OS_LOG_TYPE_ERROR, "%s In %@: Continuous digital zero ended, lasting %{public}u samples per channel", buf, 0x1Cu);
      }
      objc_autoreleasePoolPop(v12);
    }
    v14 = 0;
    self->_continuousZeroCounter = 0;
LABEL_18:
    self->_loggingSampleHeartBeat = v14;
    goto LABEL_19;
  }
LABEL_20:
  v22 = self->_continuousZeroCounter;
  if (v22)
  {
    if (self->_maxContinuousZeroCount > v22)
      v22 = self->_maxContinuousZeroCount;
    self->_maxContinuousZeroCount = v22;
  }

}

- (void)stopCountingZeroStatisticsWithReporter:(id)a3
{
  id v4;
  double v5;
  unsigned int continuousZeroCounter;
  NSObject *v7;
  unsigned int maxContinuousZeroCount;
  NSString *methodToken;
  int v10;
  const char *v11;
  __int16 v12;
  NSString *v13;
  __int16 v14;
  unsigned int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  continuousZeroCounter = self->_continuousZeroCounter;
  if (continuousZeroCounter > self->_zeroCounterWinSzForCSLogging)
  {
    v7 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      methodToken = self->_methodToken;
      v10 = 136315650;
      v11 = "-[CSAudioZeroCounter stopCountingZeroStatisticsWithReporter:]";
      v12 = 2112;
      v13 = methodToken;
      v14 = 1026;
      v15 = continuousZeroCounter;
      _os_log_error_impl(&dword_1B502E000, v7, OS_LOG_TYPE_ERROR, "%s In %@: Continuous digital zero detected, lasting %{public}u samples per channel", (uint8_t *)&v10, 0x1Cu);
    }
  }
  maxContinuousZeroCount = self->_maxContinuousZeroCount;
  if (maxContinuousZeroCount > self->_zeroCounterWinSzForReport)
  {
    *(float *)&v5 = (float)maxContinuousZeroCount;
    objc_msgSend(v4, "reportDigitalZerosWithAudioZeroRun:", v5);
  }
  self->_continuousZeroCounter = 0;
  self->_maxContinuousZeroCount = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_methodToken, 0);
}

@end
