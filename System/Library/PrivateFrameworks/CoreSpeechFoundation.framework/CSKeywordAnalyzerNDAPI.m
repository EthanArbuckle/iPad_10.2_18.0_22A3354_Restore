@implementation CSKeywordAnalyzerNDAPI

- (CSKeywordAnalyzerNDAPI)initWithConfigPath:(id)a3 resourcePath:(id)a4
{
  id v6;
  id v7;
  CSKeywordAnalyzerNDAPI *v8;
  CSNovDetector *v9;
  CSNovDetector *novDetector;
  CSKeywordAnalyzerNDAPI *v11;
  NSObject *v12;
  objc_super v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CSKeywordAnalyzerNDAPI;
  v8 = -[CSKeywordAnalyzerNDAPI init](&v14, sel_init);
  if (v8
    && (v9 = -[CSNovDetector initWithConfigPath:resourcePath:]([CSNovDetector alloc], "initWithConfigPath:resourcePath:", v6, v7), novDetector = v8->_novDetector, v8->_novDetector = v9, novDetector, !v8->_novDetector))
  {
    v12 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[CSKeywordAnalyzerNDAPI initWithConfigPath:resourcePath:]";
      _os_log_error_impl(&dword_1B502E000, v12, OS_LOG_TYPE_ERROR, "%s NDAPI initialization failed", buf, 0xCu);
    }
    v11 = 0;
  }
  else
  {
    v11 = v8;
  }

  return v11;
}

- (void)reset
{
  self->_lastSampleFed = 0;
  self->_sampleFedWrapAroundOffset = 0;
  -[CSNovDetector reset](self->_novDetector, "reset");
  -[CSKeywordAnalyzerNDAPI _resetStartAnalyzeTime](self, "_resetStartAnalyzeTime");
}

- (void)resetBest
{
  -[CSNovDetector resetBest](self->_novDetector, "resetBest");
}

- (void)_resetStartAnalyzeTime
{
  self->_isStartSampleCountMarked = 0;
  self->_startAnalyzeSampleCount = 0;
}

- (void)_setStartAnalyzeTime:(unint64_t)a3
{
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  unint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!self->_isStartSampleCountMarked)
  {
    self->_isStartSampleCountMarked = 1;
    self->_startAnalyzeSampleCount = a3;
    v4 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315394;
      v6 = "-[CSKeywordAnalyzerNDAPI _setStartAnalyzeTime:]";
      v7 = 2050;
      v8 = a3;
      _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s set StartAnalyzeSampleCount = %{public}lld", (uint8_t *)&v5, 0x16u);
    }
  }
}

- (void)processAudioChunk:(id)a3
{
  id v3;

  v3 = -[CSKeywordAnalyzerNDAPI getAnalyzedResultsFromAudioChunk:](self, "getAnalyzedResultsFromAudioChunk:", a3);
}

- (id)getAnalyzedResultsFromAudioChunk:(id)a3
{
  -[CSKeywordAnalyzerNDAPI _processAudioChunk:](self, "_processAudioChunk:", a3);
  return -[CSKeywordAnalyzerNDAPI getAnalyzedResults](self, "getAnalyzedResults");
}

- (id)getBestAnalyzedResultsFromAudioChunk:(id)a3
{
  -[CSKeywordAnalyzerNDAPI _processAudioChunk:](self, "_processAudioChunk:", a3);
  return -[CSKeywordAnalyzerNDAPI getBestAnalyzedResults](self, "getBestAnalyzedResults");
}

- (void)_processAudioChunk:(id)a3
{
  id v4;
  uint64_t v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[CSKeywordAnalyzerNDAPI _setStartAnalyzeTime:](self, "_setStartAnalyzeTime:", objc_msgSend(v4, "startSampleCount"));
  v5 = objc_msgSend(v4, "numSamples");
  v6 = +[CSConfig inputRecordingIsFloat](CSConfig, "inputRecordingIsFloat");
  objc_msgSend(v4, "dataForChannel:", self->_activeChannel);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    -[CSKeywordAnalyzerNDAPI analyzeWavFloatData:numSamples:](self, "analyzeWavFloatData:numSamples:", v7, v5);
  else
    -[CSKeywordAnalyzerNDAPI analyzeWavData:numSamples:](self, "analyzeWavData:numSamples:", v7, v5);

  -[CSNovDetector getAnalyzedResultForPhId:](self->_novDetector, "getAnalyzedResultForPhId:", self->_activePhId);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = v8;
    if (objc_msgSend(v8, "sampleFed") < self->_lastSampleFed)
      self->_sampleFedWrapAroundOffset += 0xFFFFFFFFLL;
    self->_lastSampleFed = objc_msgSend(v9, "sampleFed");
    v8 = v9;
  }

}

- (void)analyzeWavData:(id)a3 numSamples:(unint64_t)a4
{
  -[CSNovDetector analyzeWavData:numSamples:](self->_novDetector, "analyzeWavData:numSamples:", a3, a4);
}

- (void)analyzeWavFloatData:(id)a3 numSamples:(unint64_t)a4
{
  -[CSNovDetector analyzeWavFloatData:numSamples:](self->_novDetector, "analyzeWavFloatData:numSamples:", a3, a4);
}

- (id)_keywordAnalyzerNDAPIResultFromNovDetectorResult:(id)a3 phId:(unint64_t)a4
{
  id v6;
  CSKeywordAnalyzerNDAPIResult *v7;
  uint64_t v8;

  if (a3)
  {
    v6 = a3;
    v7 = objc_alloc_init(CSKeywordAnalyzerNDAPIResult);
    -[CSKeywordAnalyzerNDAPIResult setPhId:](v7, "setPhId:", a4);
    -[CSKeywordAnalyzerNDAPIResult setSamplesFed:](v7, "setSamplesFed:", objc_msgSend(v6, "sampleFed"));
    -[CSKeywordAnalyzerNDAPIResult setBestPhrase:](v7, "setBestPhrase:", objc_msgSend(v6, "bestPhrase"));
    -[CSKeywordAnalyzerNDAPIResult setBestStart:](v7, "setBestStart:", self->_startAnalyzeSampleCount + objc_msgSend(v6, "bestStart") + self->_sampleFedWrapAroundOffset);
    -[CSKeywordAnalyzerNDAPIResult setBestEnd:](v7, "setBestEnd:", self->_startAnalyzeSampleCount + objc_msgSend(v6, "bestEnd") + self->_sampleFedWrapAroundOffset);
    objc_msgSend(v6, "bestScore");
    -[CSKeywordAnalyzerNDAPIResult setBestScore:](v7, "setBestScore:");
    -[CSKeywordAnalyzerNDAPIResult setIsEarlyWarning:](v7, "setIsEarlyWarning:", objc_msgSend(v6, "earlyWarning"));
    v8 = objc_msgSend(v6, "sampleFed");

    -[CSKeywordAnalyzerNDAPIResult setSamplesAtFire:](v7, "setSamplesAtFire:", self->_startAnalyzeSampleCount + v8 + self->_sampleFedWrapAroundOffset);
    -[CSKeywordAnalyzerNDAPIResult setStartSampleCount:](v7, "setStartSampleCount:", self->_startAnalyzeSampleCount);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)getAnalyzedResults
{
  unsigned int v3;
  unsigned int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = -[CSNovDetector numResultsAvailable](self->_novDetector, "numResultsAvailable");
  if (v3)
  {
    v4 = v3;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 0;
    v7 = v4;
    do
    {
      -[CSNovDetector getAnalyzedResultForPhId:](self->_novDetector, "getAnalyzedResultForPhId:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSKeywordAnalyzerNDAPI _keywordAnalyzerNDAPIResultFromNovDetectorResult:phId:](self, "_keywordAnalyzerNDAPIResultFromNovDetectorResult:phId:", v8, v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v9);

      ++v6;
    }
    while (v7 != v6);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)getBestAnalyzedResults
{
  void *v3;
  void *v4;

  -[CSNovDetector getBestAnalyzedResult](self->_novDetector, "getBestAnalyzedResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSKeywordAnalyzerNDAPI _keywordAnalyzerNDAPIResultFromNovDetectorResult:phId:](self, "_keywordAnalyzerNDAPIResultFromNovDetectorResult:phId:", v3, objc_msgSend(v3, "bestPhrase"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)getSuperVectorWithEndPoint:(unint64_t)a3
{
  return -[CSNovDetector getSuperVectorWithEndPoint:](self->_novDetector, "getSuperVectorWithEndPoint:", a3 - (self->_startAnalyzeSampleCount + self->_sampleFedWrapAroundOffset));
}

- (float)getThreshold
{
  void *v2;
  void *v3;
  float v4;
  float v5;
  NSObject *v6;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[CSNovDetector getOptionValue:](self->_novDetector, "getOptionValue:", CFSTR("threshold_normal"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "floatValue");
    v5 = v4;
  }
  else
  {
    v6 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_FAULT))
    {
      v8 = 136315138;
      v9 = "-[CSKeywordAnalyzerNDAPI getThreshold]";
      _os_log_fault_impl(&dword_1B502E000, v6, OS_LOG_TYPE_FAULT, "%s NDAPI config doesn't contain threshold_normal", (uint8_t *)&v8, 0xCu);
    }
    v5 = INFINITY;
  }

  return v5;
}

- (float)getLoggingThreshold
{
  void *v2;
  void *v3;
  float v4;
  float v5;
  NSObject *v6;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[CSNovDetector getOptionValue:](self->_novDetector, "getOptionValue:", CFSTR("threshold_logging"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "floatValue");
    v5 = v4;
  }
  else
  {
    v6 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315138;
      v9 = "-[CSKeywordAnalyzerNDAPI getLoggingThreshold]";
      _os_log_error_impl(&dword_1B502E000, v6, OS_LOG_TYPE_ERROR, "%s NDAPI config doesn't contain threshold_logging", (uint8_t *)&v8, 0xCu);
    }
    v5 = INFINITY;
  }

  return v5;
}

- (float)getRejectLoggingThreshold
{
  void *v2;
  void *v3;
  float v4;
  float v5;
  NSObject *v6;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[CSNovDetector getOptionValue:](self->_novDetector, "getOptionValue:", CFSTR("threshold_reject_logging"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "floatValue");
    v5 = v4;
  }
  else
  {
    v6 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315138;
      v9 = "-[CSKeywordAnalyzerNDAPI getRejectLoggingThreshold]";
      _os_log_error_impl(&dword_1B502E000, v6, OS_LOG_TYPE_ERROR, "%s NDAPI config doesn't contain threshold_reject_logging", (uint8_t *)&v8, 0xCu);
    }
    v5 = INFINITY;
  }

  return v5;
}

- (unint64_t)activeChannel
{
  return self->_activeChannel;
}

- (void)setActiveChannel:(unint64_t)a3
{
  self->_activeChannel = a3;
}

- (unsigned)activePhId
{
  return self->_activePhId;
}

- (void)setActivePhId:(unsigned int)a3
{
  self->_activePhId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_novDetector, 0);
}

@end
