@implementation CSVoiceTriggerAwareZeroFilter

- (CSVoiceTriggerAwareZeroFilter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSVoiceTriggerAwareZeroFilter;
  return -[CSVoiceTriggerAwareZeroFilter init](&v3, sel_init);
}

- (void)resetWithSampleRate:(float)a3 containsVoiceTrigger:(BOOL)a4 voiceTriggerInfo:(id)a5
{
  _BOOL4 v5;
  id v8;
  unint64_t v9;
  double v10;
  NSObject *v11;
  double v12;
  double v13;
  CSAudioZeroFilter *v14;
  CSAudioZeroFilter *zeroFilter;
  void *v16;
  float v17;
  double v18;
  NSObject *v19;
  unint64_t numSamplesProcessed;
  int v21;
  const char *v22;
  __int16 v23;
  unint64_t v24;
  __int16 v25;
  double v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v5 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  self->_vtEndInSampleCount = 0;
  self->_sampleRate = a3;
  self->_numSamplesProcessed = 0;
  v9 = (unint64_t)(float)((float)((float)+[CSConfig zeroFilterWindowSizeInMs](CSConfig, "zeroFilterWindowSizeInMs")/ 1000.0)* a3);
  +[CSFTimeUtils getHostClockFrequency](CSFTimeUtils, "getHostClockFrequency");
  v10 = a3;
  v11 = CSLogContextFacilityCoreSpeech;
  v13 = v12 / a3;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
  {
    v21 = 136315650;
    v22 = "-[CSVoiceTriggerAwareZeroFilter resetWithSampleRate:containsVoiceTrigger:voiceTriggerInfo:]";
    v23 = 2050;
    v24 = v9;
    v25 = 2050;
    v26 = v13;
    _os_log_impl(&dword_1B502E000, v11, OS_LOG_TYPE_INFO, "%s zeroFilterWinSz: %{public}tu, numHostTicksPerAudioSample: %{public}f", (uint8_t *)&v21, 0x20u);
  }
  v14 = -[CSAudioZeroFilter initWithZeroWindowSize:approxAbsSpeechThreshold:numHostTicksPerAudioSample:]([CSAudioZeroFilter alloc], "initWithZeroWindowSize:approxAbsSpeechThreshold:numHostTicksPerAudioSample:", v9, +[CSConfig zeroFilterApproxAbsSpeechThreshold](CSConfig, "zeroFilterApproxAbsSpeechThreshold"), v13);
  zeroFilter = self->_zeroFilter;
  self->_zeroFilter = v14;

  if (v8)
  {
    if (v5)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("triggerEndSeconds"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "floatValue");
      v18 = v17;

      self->_vtEndInSampleCount = (unint64_t)(v10 * v18);
      v19 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
      {
        numSamplesProcessed = self->_numSamplesProcessed;
        v21 = 136315906;
        v22 = "-[CSVoiceTriggerAwareZeroFilter resetWithSampleRate:containsVoiceTrigger:voiceTriggerInfo:]";
        v23 = 2050;
        v24 = (unint64_t)(v10 * v18);
        v25 = 2050;
        v26 = *(double *)&numSamplesProcessed;
        v27 = 2114;
        v28 = v8;
        _os_log_impl(&dword_1B502E000, v19, OS_LOG_TYPE_INFO, "%s _vtEndInSampleCount:%{public}ld, _numSamplesProcessed: %{public}ld, voiceTriggerInfo: %{public}@", (uint8_t *)&v21, 0x2Au);
      }
    }
  }

}

- (void)processBuffer:(id)a3 atTime:(unint64_t)a4
{
  id v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t numSamplesProcessed;
  unint64_t vtEndInSampleCount;
  unint64_t v11;
  id v12;
  unint64_t v13;
  void *v14;
  double v15;
  unint64_t v16;
  id WeakRetained;
  CSAudioZeroFilter *zeroFilter;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;

  v6 = a3;
  v7 = objc_msgSend(v6, "length");
  v8 = v7 >> 1;
  vtEndInSampleCount = self->_vtEndInSampleCount;
  numSamplesProcessed = self->_numSamplesProcessed;
  v11 = vtEndInSampleCount - numSamplesProcessed;
  if (vtEndInSampleCount < numSamplesProcessed)
  {
    v12 = v6;
    self->_numSamplesProcessed += v8;
    if (!v12)
      goto LABEL_22;
    goto LABEL_16;
  }
  if (v8 >= v11)
    v13 = vtEndInSampleCount - numSamplesProcessed;
  else
    v13 = v7 >> 1;
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", objc_msgSend(objc_retainAutorelease(v6), "bytes"), 2 * v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
  if (v8 <= v11)
  {
    v16 = 0;
    v12 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", objc_msgSend(objc_retainAutorelease(v6), "bytes") + 2 * v13, 2 * (v8 - v13));
    v12 = (id)objc_claimAutoreleasedReturnValue();
    +[CSFTimeUtils getHostClockFrequency](CSFTimeUtils, "getHostClockFrequency");
    v16 = (unint64_t)((double)a4 + (double)v13 * (v15 / self->_sampleRate));
  }
  self->_numSamplesProcessed += v8;
  if (v14)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "zeroFilter:zeroFilteredBufferAvailable:atHostTime:", self, v14, a4);

  }
  a4 = v16;
  if (v12)
  {
LABEL_16:
    zeroFilter = self->_zeroFilter;
    if (zeroFilter)
    {
      v24 = 0;
      v19 = -[CSAudioZeroFilter filterZerosInAudioPacket:atBufferHostTime:filteredPacket:](zeroFilter, "filterZerosInAudioPacket:atBufferHostTime:filteredPacket:", v12, a4, &v24);
      v20 = v24;
      v21 = v20;
      if (v20 && objc_msgSend(v20, "length"))
      {
        v22 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v22, "zeroFilter:zeroFilteredBufferAvailable:atHostTime:", self, v21, v19);

      }
    }
    else
    {
      v23 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v23, "zeroFilter:zeroFilteredBufferAvailable:atHostTime:", self, v12, a4);

    }
  }
LABEL_22:

}

- (void)flush
{
  CSAudioZeroFilter *zeroFilter;
  uint64_t v4;
  id v5;
  id WeakRetained;
  id v7;

  zeroFilter = self->_zeroFilter;
  v7 = 0;
  v4 = -[CSAudioZeroFilter endAudioAndFetchAnyTrailingZerosPacket:](zeroFilter, "endAudioAndFetchAnyTrailingZerosPacket:", &v7);
  v5 = v7;
  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "zeroFilter:zeroFilteredBufferAvailable:atHostTime:", self, v5, v4);

  }
}

- (id)metrics
{
  return -[CSAudioZeroFilter metrics](self->_zeroFilter, "metrics");
}

- (CSVoiceTriggerAwareZeroFilterDelegate)delegate
{
  return (CSVoiceTriggerAwareZeroFilterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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

- (unint64_t)vtEndInSampleCount
{
  return self->_vtEndInSampleCount;
}

- (void)setVtEndInSampleCount:(unint64_t)a3
{
  self->_vtEndInSampleCount = a3;
}

- (unint64_t)numSamplesProcessed
{
  return self->_numSamplesProcessed;
}

- (void)setNumSamplesProcessed:(unint64_t)a3
{
  self->_numSamplesProcessed = a3;
}

- (CSAudioZeroFilter)zeroFilter
{
  return self->_zeroFilter;
}

- (void)setZeroFilter:(id)a3
{
  objc_storeStrong((id *)&self->_zeroFilter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zeroFilter, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
