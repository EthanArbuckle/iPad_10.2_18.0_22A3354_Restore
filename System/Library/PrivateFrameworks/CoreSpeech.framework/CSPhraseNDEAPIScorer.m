@implementation CSPhraseNDEAPIScorer

- (CSPhraseNDEAPIScorer)initWithAsset:(id)a3 assetConfig:(id)a4 firstPassSource:(unint64_t)a5 activeChannel:(unint64_t)a6 siriLanguage:(id)a7 shouldEnableShadowMicScore:(BOOL)a8 rtmodelRequestOptions:(id)a9
{
  _BOOL4 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  CSPhraseNDEAPIScorer *v18;
  CSPhraseNDEAPIScorer *v19;
  void *v20;
  char v21;
  void *v22;
  float v23;
  CSShadowMicScoreCreator *v24;
  CSShadowMicScoreCreator *shadowMicScoreCreator;
  NSMutableData *v26;
  NSMutableData *dataBufferNDEAPI;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  CSKeywordAnalyzerNDEAPI *keywordAnalyzerNDEAPI;
  objc_super v35;

  v9 = a8;
  v14 = a3;
  v15 = a4;
  v16 = a7;
  v17 = a9;
  v35.receiver = self;
  v35.super_class = (Class)CSPhraseNDEAPIScorer;
  v18 = -[CSPhraseNDEAPIScorer init](&v35, sel_init);
  v19 = v18;
  if (v18)
  {
    if (v9 && v18->_shadowMicScoreThresholdForVAD != -1.0)
    {
      objc_msgSend(v17, "accessoryInfo");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "supportsAlwaysOnAccelerometer");

      if ((v21 & 1) == 0)
      {
        objc_msgSend(v15, "wearerDetectionConfig");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "shadowMicScoreThreshold");
        v19->_shadowMicScoreThresholdForVAD = v23;

        v24 = objc_alloc_init(CSShadowMicScoreCreator);
        shadowMicScoreCreator = v19->_shadowMicScoreCreator;
        v19->_shadowMicScoreCreator = v24;

      }
    }
    v26 = (NSMutableData *)objc_alloc_init(MEMORY[0x1E0C99DF0]);
    dataBufferNDEAPI = v19->_dataBufferNDEAPI;
    v19->_dataBufferNDEAPI = v26;

    v19->_dataBufferPositionNDEAPI = 0;
    v19->_hasReceivedEarlyDetectNDEAPIResult = 0;
    v19->_hearstNumberOfBytesPerChunk = objc_msgSend(MEMORY[0x1E0D19090], "hearstNumberOfBytesPerChunk");
    v19->_hearstNumberOfSamplesPerChunk = objc_msgSend(MEMORY[0x1E0D19090], "hearstNumberOfSamplesPerChunk");
    objc_msgSend(v15, "phraseConfigs");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSPhraseNDEAPIScorer _rtModelFromAsset:requestOptions:forSiriLanguage:withPhraseCount:](v19, "_rtModelFromAsset:requestOptions:forSiriLanguage:withPhraseCount:", v14, v17, v16, objc_msgSend(v28, "count"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = objc_alloc(MEMORY[0x1E0D19140]);
    objc_msgSend(v29, "modelData");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "initWithBlob:", v31);
    keywordAnalyzerNDEAPI = v19->_keywordAnalyzerNDEAPI;
    v19->_keywordAnalyzerNDEAPI = (CSKeywordAnalyzerNDEAPI *)v32;

    -[CSKeywordAnalyzerNDEAPI setActiveChannel:](v19->_keywordAnalyzerNDEAPI, "setActiveChannel:", a6);
    -[CSKeywordAnalyzerNDEAPI setDelegate:](v19->_keywordAnalyzerNDEAPI, "setDelegate:", v19);

  }
  return v19;
}

- (void)reset
{
  self->_hasReceivedNDEAPIResult = 0;
  -[CSKeywordAnalyzerNDEAPI reset](self->_keywordAnalyzerNDEAPI, "reset");
}

- (void)processAudioChunk:(id)a3 activeChannel:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  unint64_t v10;
  char *v11;
  size_t v12;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "dataForChannel:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSShadowMicScoreCreator addDataToBuffer:](self->_shadowMicScoreCreator, "addDataToBuffer:", v7);
  if (self->_shadowMicScoreCreator)
  {
    if (objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingIsFloat"))
    {
      objc_msgSend(MEMORY[0x1E0D19100], "convertToShortLPCMBufFromFloatLPCMBuf:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "length"))
        -[NSMutableData appendData:](self->_dataBufferNDEAPI, "appendData:", v8);

    }
    else
    {
      -[NSMutableData appendData:](self->_dataBufferNDEAPI, "appendData:", v7);
    }
    for (;
          -[NSMutableData length](self->_dataBufferNDEAPI, "length") - self->_dataBufferPositionNDEAPI >= self->_hearstNumberOfBytesPerChunk;
          self->_dataBufferPositionNDEAPI += self->_hearstNumberOfBytesPerChunk)
    {
      MEMORY[0x1E0C80A78]();
      v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
      if (v10 >= 0x200)
        v12 = 512;
      else
        v12 = v10;
      bzero((char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v12);
      -[NSMutableData getBytes:range:](self->_dataBufferNDEAPI, "getBytes:range:", v11, self->_dataBufferPositionNDEAPI, self->_hearstNumberOfBytesPerChunk);
      v13 = (id)-[CSKeywordAnalyzerNDEAPI processAudioBytes:withNumberOfSamples:](self->_keywordAnalyzerNDEAPI, "processAudioBytes:withNumberOfSamples:", v11, self->_hearstNumberOfSamplesPerChunk);
    }
  }
  else
  {
    v9 = (id)-[CSKeywordAnalyzerNDEAPI processAudioChunk:](self->_keywordAnalyzerNDEAPI, "processAudioChunk:", v6);
  }

}

- (double)currentShadowMicScore
{
  double result;

  -[CSShadowMicScoreCreator calculateShadowMicScore](self->_shadowMicScoreCreator, "calculateShadowMicScore");
  -[CSShadowMicScoreCreator shadowMicScore](self->_shadowMicScoreCreator, "shadowMicScore");
  return result;
}

- (void)keywordAnalyzerNDEAPI:(id)a3 hasResultAvailable:(id)a4 forChannel:(unint64_t)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id WeakRetained;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v8, "isEarlyDetect") && !self->_hasReceivedEarlyDetectNDEAPIResult)
  {
    v13 = objc_msgSend(v8, "samplesFed");
    v14 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v15 = 136315394;
      v16 = "-[CSPhraseNDEAPIScorer keywordAnalyzerNDEAPI:hasResultAvailable:forChannel:]";
      v17 = 1026;
      v18 = v13;
      _os_log_impl(&dword_1C2614000, v14, OS_LOG_TYPE_DEFAULT, "%s EarlyDetectSample = %{public}d", (uint8_t *)&v15, 0x12u);
    }
    -[CSShadowMicScoreCreator setBestEarlyDetectSample:](self->_shadowMicScoreCreator, "setBestEarlyDetectSample:", v13);
    self->_hasReceivedEarlyDetectNDEAPIResult = 1;
  }
  else if (!self->_hasReceivedNDEAPIResult)
  {
    self->_hasReceivedNDEAPIResult = 1;
    v9 = objc_msgSend(v8, "bestStart");
    v10 = objc_msgSend(v8, "bestEnd");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "voiceTriggerPhraseNDEAPIScorerDidDetectedKeyword:bestStartSampleCount:bestEndSampleCount:", self, v9, v10);

    v12 = objc_msgSend(v8, "samplesFed");
    -[CSShadowMicScoreCreator setBestStartDetectSample:](self->_shadowMicScoreCreator, "setBestStartDetectSample:", v9);
    -[CSShadowMicScoreCreator setBestEndDetectSample:](self->_shadowMicScoreCreator, "setBestEndDetectSample:", v12);
    objc_msgSend(v7, "reset");
  }

}

- (id)_rtModelFromAsset:(id)a3 requestOptions:(id)a4 forSiriLanguage:(id)a5 withPhraseCount:(unint64_t)a6
{
  id v9;
  id v10;
  id v11;
  CSVoiceTriggerRTModelRequestOptions *v12;
  id v13;
  id v14;
  CSVoiceTriggerRTModelRequestOptions *v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  unint64_t v21;

  v9 = a4;
  v10 = a5;
  v11 = a3;
  v12 = [CSVoiceTriggerRTModelRequestOptions alloc];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __89__CSPhraseNDEAPIScorer__rtModelFromAsset_requestOptions_forSiriLanguage_withPhraseCount___block_invoke;
  v18[3] = &unk_1E7C262B8;
  v19 = v9;
  v20 = v10;
  v21 = a6;
  v13 = v10;
  v14 = v9;
  v15 = -[CSVoiceTriggerRTModelRequestOptions initWithCSRTModelRequestOptions:builder:](v12, "initWithCSRTModelRequestOptions:builder:", v14, v18);
  objc_msgSend(v11, "latestHearstRTModelWithRequestOptions:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (CSPhraseNDEAPIScorerDelegate)delegate
{
  return (CSPhraseNDEAPIScorerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (float)shadowMicScoreThresholdForVAD
{
  return self->_shadowMicScoreThresholdForVAD;
}

- (CSKeywordAnalyzerNDEAPI)keywordAnalyzerNDEAPI
{
  return self->_keywordAnalyzerNDEAPI;
}

- (void)setKeywordAnalyzerNDEAPI:(id)a3
{
  objc_storeStrong((id *)&self->_keywordAnalyzerNDEAPI, a3);
}

- (BOOL)hasReceivedNDEAPIResult
{
  return self->_hasReceivedNDEAPIResult;
}

- (void)setHasReceivedNDEAPIResult:(BOOL)a3
{
  self->_hasReceivedNDEAPIResult = a3;
}

- (CSShadowMicScoreCreator)shadowMicScoreCreator
{
  return self->_shadowMicScoreCreator;
}

- (void)setShadowMicScoreCreator:(id)a3
{
  objc_storeStrong((id *)&self->_shadowMicScoreCreator, a3);
}

- (NSMutableData)dataBufferNDEAPI
{
  return self->_dataBufferNDEAPI;
}

- (void)setDataBufferNDEAPI:(id)a3
{
  objc_storeStrong((id *)&self->_dataBufferNDEAPI, a3);
}

- (unint64_t)dataBufferPositionNDEAPI
{
  return self->_dataBufferPositionNDEAPI;
}

- (void)setDataBufferPositionNDEAPI:(unint64_t)a3
{
  self->_dataBufferPositionNDEAPI = a3;
}

- (unsigned)hasReceivedEarlyDetectNDEAPIResult
{
  return self->_hasReceivedEarlyDetectNDEAPIResult;
}

- (void)setHasReceivedEarlyDetectNDEAPIResult:(unsigned __int8)a3
{
  self->_hasReceivedEarlyDetectNDEAPIResult = a3;
}

- (unint64_t)hearstNumberOfBytesPerChunk
{
  return self->_hearstNumberOfBytesPerChunk;
}

- (void)setHearstNumberOfBytesPerChunk:(unint64_t)a3
{
  self->_hearstNumberOfBytesPerChunk = a3;
}

- (unint64_t)hearstNumberOfSamplesPerChunk
{
  return self->_hearstNumberOfSamplesPerChunk;
}

- (void)setHearstNumberOfSamplesPerChunk:(unint64_t)a3
{
  self->_hearstNumberOfSamplesPerChunk = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataBufferNDEAPI, 0);
  objc_storeStrong((id *)&self->_shadowMicScoreCreator, 0);
  objc_storeStrong((id *)&self->_keywordAnalyzerNDEAPI, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __89__CSPhraseNDEAPIScorer__rtModelFromAsset_requestOptions_forSiriLanguage_withPhraseCount___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  _BOOL8 v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  _BOOL4 v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (void *)a1[4];
  v4 = a2;
  v5 = objc_msgSend(v3, "allowMph")
    && objc_msgSend(MEMORY[0x1E0D19260], "supportsMphForLanguageCode:", a1[5])
    && a1[6] > 1uLL;
  v6 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v7 = a1[5];
    v8 = a1[6];
    v9 = 136315907;
    v10 = "-[CSPhraseNDEAPIScorer _rtModelFromAsset:requestOptions:forSiriLanguage:withPhraseCount:]_block_invoke";
    v11 = 2113;
    v12 = v7;
    v13 = 1024;
    v14 = v5;
    v15 = 2048;
    v16 = v8;
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s Device and locale:%{private}@ supports multiphrase detection:%d with unique phrase count:%lu)", (uint8_t *)&v9, 0x26u);
  }
  objc_msgSend(v4, "setAllowMph:", v5);
  objc_msgSend(v4, "setSiriLocale:", a1[5]);

}

@end
