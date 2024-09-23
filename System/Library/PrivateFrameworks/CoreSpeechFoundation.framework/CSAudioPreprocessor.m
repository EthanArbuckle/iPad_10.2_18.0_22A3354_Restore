@implementation CSAudioPreprocessor

- (CSAudioPreprocessor)initWithSampleRate:(float)a3 withNumberOfChannels:(int)a4 recordType:(int64_t)a5
{
  uint64_t v6;
  CSAudioPreprocessor *v8;
  CSVoiceTriggerAwareZeroFilter *v9;
  CSVoiceTriggerAwareZeroFilter *zeroFilter;
  CSBeepCanceller *v11;
  CSBeepCanceller *beepCanceller;
  double v13;
  objc_super v15;

  v6 = *(_QWORD *)&a4;
  v15.receiver = self;
  v15.super_class = (Class)CSAudioPreprocessor;
  v8 = -[CSAudioPreprocessor init](&v15, sel_init);
  if (v8)
  {
    if (+[CSUtils supportZeroFilter:](CSUtils, "supportZeroFilter:", +[CSConfig inputRecordingNumberOfChannels](CSConfig, "inputRecordingNumberOfChannels")))
    {
      v9 = objc_alloc_init(CSVoiceTriggerAwareZeroFilter);
      zeroFilter = v8->_zeroFilter;
      v8->_zeroFilter = v9;

      -[CSVoiceTriggerAwareZeroFilter setDelegate:](v8->_zeroFilter, "setDelegate:", v8);
    }
    if (+[CSUtils supportBeepCanceller:recordType:](CSUtils, "supportBeepCanceller:recordType:", +[CSConfig inputRecordingNumberOfChannels](CSConfig, "inputRecordingNumberOfChannels"), a5))
    {
      v11 = objc_alloc_init(CSBeepCanceller);
      beepCanceller = v8->_beepCanceller;
      v8->_beepCanceller = v11;

      -[CSBeepCanceller setDelegate:](v8->_beepCanceller, "setDelegate:", v8);
    }
    -[CSAudioPreprocessor setNumChannels:](v8, "setNumChannels:", v6);
    *(float *)&v13 = a3;
    -[CSAudioPreprocessor resetWithSampleRate:containsVoiceTrigger:voiceTriggerInfo:](v8, "resetWithSampleRate:containsVoiceTrigger:voiceTriggerInfo:", 0, 0, v13);
  }
  return v8;
}

- (void)resetWithSampleRate:(float)a3 containsVoiceTrigger:(BOOL)a4 voiceTriggerInfo:(id)a5
{
  _BOOL8 v5;
  id v8;
  NSObject *v9;
  double v10;
  CSAudioZeroCounter *zeroCounter;
  CSAudioZeroCounter *v12;
  objc_class *v13;
  void *v14;
  double v15;
  CSAudioZeroCounter *v16;
  CSAudioZeroCounter *v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  int v23;
  const char *v24;
  __int16 v25;
  double v26;
  __int16 v27;
  _BOOL4 v28;
  uint64_t v29;

  v5 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v23 = 136315650;
    v24 = "-[CSAudioPreprocessor resetWithSampleRate:containsVoiceTrigger:voiceTriggerInfo:]";
    v25 = 2050;
    v26 = a3;
    v27 = 1026;
    v28 = v5;
    _os_log_impl(&dword_1B502E000, v9, OS_LOG_TYPE_DEFAULT, "%s Resetting audio preprocessor : %{public}f, containsVoiceTrigger:%{public}d", (uint8_t *)&v23, 0x1Cu);
  }
  if (CSIsInternalBuild_onceToken != -1)
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_33);
  if (CSIsInternalBuild_isInternal)
  {
    zeroCounter = self->_zeroCounter;
    if (zeroCounter)
    {
      *(float *)&v10 = a3;
      -[CSAudioZeroCounter resetWithSampleRate:](zeroCounter, "resetWithSampleRate:", v10);
    }
    else
    {
      v12 = [CSAudioZeroCounter alloc];
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v15 = a3;
      v16 = -[CSAudioZeroCounter initWithToken:sampleRate:numChannels:](v12, "initWithToken:sampleRate:numChannels:", v14, 1, v15);
      v17 = self->_zeroCounter;
      self->_zeroCounter = v16;

    }
  }
  *(float *)&v10 = a3;
  -[CSAudioPreprocessor setSampleRate:](self, "setSampleRate:", v10);
  *(float *)&v18 = a3;
  if (-[CSAudioPreprocessor _isNarrowBand:](self, "_isNarrowBand:", v18))
  {
    +[CSAudioSampleRateConverter upsampler](CSAudioSampleRateConverter, "upsampler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSAudioPreprocessor setUpsampler:](self, "setUpsampler:", v19);

  }
  else
  {
    -[CSAudioPreprocessor setUpsampler:](self, "setUpsampler:", 0);
  }
  -[CSAudioPreprocessor zeroFilter](self, "zeroFilter");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v21 = a3;
  objc_msgSend(v20, "resetWithSampleRate:containsVoiceTrigger:voiceTriggerInfo:", v5, v8, v21);

  -[CSAudioPreprocessor beepCanceller](self, "beepCanceller");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "reset");

}

- (void)processBuffer:(id)a3 atTime:(unint64_t)a4 arrivalTimestampToAudioRecorder:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v8 = a3;
  v14 = v8;
  if (self->_numChannels > 1)
  {
    -[CSAudioPreprocessor delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "audioPreprocessor:hasAvailableBuffer:atTime:arrivalTimestampToAudioRecorder:numberOfChannels:", self, v14, a4, a5, self->_numChannels);
    v10 = v14;
  }
  else
  {
    -[CSAudioZeroCounter getZeroStatisticsFromBuffer:entireSamples:](self->_zeroCounter, "getZeroStatisticsFromBuffer:entireSamples:", v8, ((unint64_t)objc_msgSend(v8, "length") >> 1)/ +[CSConfig inputRecordingNumberOfChannels](CSConfig, "inputRecordingNumberOfChannels"));
    -[CSAudioPreprocessor upsampler](self, "upsampler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v14;
    if (v9)
    {
      -[CSAudioSampleRateConverter convertSampleRateOfBuffer:](self->_upsampler, "convertSampleRateOfBuffer:", v14);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[CSAudioPreprocessor zeroFilter](self, "zeroFilter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[CSAudioPreprocessor zeroFilter](self, "zeroFilter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "processBuffer:atTime:", v10, a4);
    }
    else
    {
      -[CSAudioPreprocessor beepCanceller](self, "beepCanceller");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        -[CSAudioPreprocessor beepCanceller](self, "beepCanceller");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "cancelBeepFromSamples:timestamp:", v10, a4);
      }
      else
      {
        -[CSAudioPreprocessor delegate](self, "delegate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "audioPreprocessor:hasAvailableBuffer:atTime:arrivalTimestampToAudioRecorder:numberOfChannels:", self, v10, a4, a5, self->_numChannels);
      }
    }
  }

}

- (void)flush
{
  NSObject *v3;
  void *v4;
  void *v5;
  CSAudioZeroCounter *zeroCounter;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[CSAudioPreprocessor flush]";
    _os_log_impl(&dword_1B502E000, v3, OS_LOG_TYPE_DEFAULT, "%s Flushing audio preprocessor", (uint8_t *)&v8, 0xCu);
  }
  -[CSAudioPreprocessor zeroFilter](self, "zeroFilter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flush");

  -[CSAudioPreprocessor beepCanceller](self, "beepCanceller");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "flush");

  zeroCounter = self->_zeroCounter;
  +[CSVoiceTriggerStatAggregator sharedAggregator](CSVoiceTriggerStatAggregator, "sharedAggregator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSAudioZeroCounter stopCountingZeroStatisticsWithReporter:](zeroCounter, "stopCountingZeroStatisticsWithReporter:", v7);

  -[CSAudioPreprocessor _reportMetrics](self, "_reportMetrics");
}

- (void)willBeepWithRecordRoute:(id)a3 playbackRoute:(id)a4
{
  id v5;

  if (!+[CSUtils isHeadphoneDeviceWithRecordRoute:playbackRoute:](CSUtils, "isHeadphoneDeviceWithRecordRoute:playbackRoute:", a3, a4))
  {
    -[CSAudioPreprocessor beepCanceller](self, "beepCanceller");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "willBeep");

  }
}

- (void)reportMetricsForSiriRequestWithUUID:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (objc_class *)MEMORY[0x1E0CB3A28];
  v5 = a3;
  v8 = (id)objc_msgSend([v4 alloc], "initWithUUIDString:", v5);

  if (v8)
  {
    -[CSAudioPreprocessor _fetchCurrentMetrics](self, "_fetchCurrentMetrics");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      +[CSFAudioMetricsSelfLogger sharedLogger](CSFAudioMetricsSelfLogger, "sharedLogger");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logCoreSpeechPreprocessorCompletedWithMHUUID:withMetricsDictionary:", v8, v6);

    }
  }

}

- (void)_reportMetrics
{
  void *v2;
  id v3;

  -[CSAudioPreprocessor _fetchCurrentMetrics](self, "_fetchCurrentMetrics");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CFE7D0], "sharedAnalytics");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "logEventWithType:context:", 241, v3);

  }
}

- (id)_fetchCurrentMetrics
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSVoiceTriggerAwareZeroFilter metrics](self->_zeroFilter, "metrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("ZeroFilterMetrics"));
    v5 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315394;
      v11 = "-[CSAudioPreprocessor _fetchCurrentMetrics]";
      v12 = 2114;
      v13 = v4;
      _os_log_impl(&dword_1B502E000, v5, OS_LOG_TYPE_DEFAULT, "%s Zero Filter Metrics: %{public}@", (uint8_t *)&v10, 0x16u);
    }
  }
  -[CSBeepCanceller metrics](self->_beepCanceller, "metrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("BeepCancellerMetrics"));
    v7 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315394;
      v11 = "-[CSAudioPreprocessor _fetchCurrentMetrics]";
      v12 = 2114;
      v13 = v6;
      _os_log_impl(&dword_1B502E000, v7, OS_LOG_TYPE_DEFAULT, "%s Beep Canceller Metrics : %{public}@", (uint8_t *)&v10, 0x16u);
    }
  }
  v8 = (void *)objc_msgSend(v3, "mutableCopy");

  return v8;
}

- (BOOL)_isNarrowBand:(float)a3
{
  float v4;

  +[CSConfig inputRecordingSampleRateNarrowBand](CSConfig, "inputRecordingSampleRateNarrowBand");
  return v4 == a3;
}

- (void)zeroFilter:(id)a3 zeroFilteredBufferAvailable:(id)a4 atHostTime:(unint64_t)a5
{
  id v7;
  void *v8;
  id v9;

  v7 = a4;
  -[CSAudioPreprocessor beepCanceller](self, "beepCanceller");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CSAudioPreprocessor beepCanceller](self, "beepCanceller");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cancelBeepFromSamples:timestamp:", v7, a5);
  }
  else
  {
    -[CSAudioPreprocessor delegate](self, "delegate");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "audioPreprocessor:hasAvailableBuffer:atTime:arrivalTimestampToAudioRecorder:numberOfChannels:", self, v7, a5, 0, self->_numChannels);
  }

}

- (void)beepCancellerDidCancelSamples:(id)a3 buffer:(id)a4 timestamp:(unint64_t)a5
{
  id v7;
  id v8;

  v7 = a4;
  -[CSAudioPreprocessor delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "audioPreprocessor:hasAvailableBuffer:atTime:arrivalTimestampToAudioRecorder:numberOfChannels:", self, v7, a5, 0, self->_numChannels);

}

- (CSAudioPreprocessorDelegate)delegate
{
  return (CSAudioPreprocessorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (float)sampleRate
{
  return self->_sampleRate;
}

- (void)setSampleRate:(float)a3
{
  self->_sampleRate = a3;
}

- (CSAudioSampleRateConverter)upsampler
{
  return self->_upsampler;
}

- (void)setUpsampler:(id)a3
{
  objc_storeStrong((id *)&self->_upsampler, a3);
}

- (CSVoiceTriggerAwareZeroFilter)zeroFilter
{
  return self->_zeroFilter;
}

- (void)setZeroFilter:(id)a3
{
  objc_storeStrong((id *)&self->_zeroFilter, a3);
}

- (CSBeepCanceller)beepCanceller
{
  return self->_beepCanceller;
}

- (void)setBeepCanceller:(id)a3
{
  objc_storeStrong((id *)&self->_beepCanceller, a3);
}

- (CSAudioZeroCounter)zeroCounter
{
  return self->_zeroCounter;
}

- (void)setZeroCounter:(id)a3
{
  objc_storeStrong((id *)&self->_zeroCounter, a3);
}

- (int)numChannels
{
  return self->_numChannels;
}

- (void)setNumChannels:(int)a3
{
  self->_numChannels = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zeroCounter, 0);
  objc_storeStrong((id *)&self->_beepCanceller, 0);
  objc_storeStrong((id *)&self->_zeroFilter, 0);
  objc_storeStrong((id *)&self->_upsampler, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
