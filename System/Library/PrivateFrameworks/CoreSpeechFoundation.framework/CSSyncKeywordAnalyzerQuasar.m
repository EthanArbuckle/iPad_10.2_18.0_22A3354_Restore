@implementation CSSyncKeywordAnalyzerQuasar

- (CSSyncKeywordAnalyzerQuasar)initWithConfigPath:(id)a3 triggerTokensArray:(id)a4 preventDuplicatedReset:(BOOL)a5 memoryLock:(BOOL)a6
{
  _BOOL8 v6;
  double v10;
  id v11;
  CSSyncKeywordAnalyzerQuasar *v12;
  uint64_t v13;
  NSDictionary *phToPhIdMap;
  void *v15;
  double v16;
  double v17;
  NSObject *v18;
  uint64_t v19;
  _EARSyncSpeechRecognizer *syncRecognizer;
  void *v21;
  double v22;
  double v23;
  NSObject *v24;
  CSSyncKeywordAnalyzerQuasar *v25;
  objc_super v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  double v31;
  uint64_t v32;

  v6 = a6;
  v32 = *MEMORY[0x1E0C80C00];
  v10 = COERCE_DOUBLE(a3);
  v11 = a4;
  v27.receiver = self;
  v27.super_class = (Class)CSSyncKeywordAnalyzerQuasar;
  v12 = -[CSSyncKeywordAnalyzerQuasar init](&v27, sel_init);
  if (v12)
  {
    +[CSSyncKeywordAnalyzerQuasar _phToPhIdMapFromTriggerTokensArray:](CSSyncKeywordAnalyzerQuasar, "_phToPhIdMapFromTriggerTokensArray:", v11);
    v13 = objc_claimAutoreleasedReturnValue();
    phToPhIdMap = v12->_phToPhIdMap;
    v12->_phToPhIdMap = (NSDictionary *)v13;

    v12->_numPhrases = objc_msgSend(v11, "count");
    v12->_preventDuplicatedReset = a5;
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "systemUptime");
    v17 = v16;

    v18 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v29 = "-[CSSyncKeywordAnalyzerQuasar initWithConfigPath:triggerTokensArray:preventDuplicatedReset:memoryLock:]";
      v30 = 2114;
      v31 = v10;
      _os_log_impl(&dword_1B502E000, v18, OS_LOG_TYPE_DEFAULT, "%s Initializing Quasar with config: %{public}@", buf, 0x16u);
    }
    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1F180]), "initWithConfiguration:memoryLock:", *(_QWORD *)&v10, v6);
    syncRecognizer = v12->_syncRecognizer;
    v12->_syncRecognizer = (_EARSyncSpeechRecognizer *)v19;

    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "systemUptime");
    v23 = v22;

    v12->_requireReset = 1;
    v24 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v29 = "-[CSSyncKeywordAnalyzerQuasar initWithConfigPath:triggerTokensArray:preventDuplicatedReset:memoryLock:]";
      v30 = 2050;
      v31 = (v23 - v17) * 1000.0;
      _os_log_impl(&dword_1B502E000, v24, OS_LOG_TYPE_DEFAULT, "%s Speech model loading took %{public}.3fms", buf, 0x16u);
    }
  }
  v25 = v12;

  return v25;
}

- (void)reset
{
  NSObject *v3;
  _EARSyncSpeechRecognizer *syncRecognizer;
  float v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[CSSyncKeywordAnalyzerQuasar reset]";
    _os_log_impl(&dword_1B502E000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  if (self->_requireReset)
  {
    syncRecognizer = self->_syncRecognizer;
    +[CSConfig inputRecordingSampleRate](CSConfig, "inputRecordingSampleRate");
    LODWORD(v7) = 120;
    LOBYTE(v6) = 0;
    -[_EARSyncSpeechRecognizer resetWithSamplingRate:language:taskType:userId:sessionId:deviceId:farField:audioSource:maxAudioBufferSizeSeconds:](syncRecognizer, "resetWithSamplingRate:language:taskType:userId:sessionId:deviceId:farField:audioSource:maxAudioBufferSizeSeconds:", v5, &stru_1E6885088, CFSTR("Dictation"), &stru_1E6885088, &stru_1E6885088, &stru_1E6885088, v6, &stru_1E6885088, v7);
    if (self->_preventDuplicatedReset)
      self->_requireReset = 0;
  }
}

- (void)flushAudio
{
  id v2;

  v2 = -[CSSyncKeywordAnalyzerQuasar getResultsFromFlushedAudio](self, "getResultsFromFlushedAudio");
}

- (id)getResultsFromFlushedAudio
{
  NSObject *v3;
  uint64_t v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  float v14;
  int v16;
  const char *v17;
  __int16 v18;
  double v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 136315138;
    v17 = "-[CSSyncKeywordAnalyzerQuasar getResultsFromFlushedAudio]";
    _os_log_impl(&dword_1B502E000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v16, 0xCu);
  }
  kdebug_trace();
  v4 = mach_absolute_time();
  v5 = os_signpost_id_generate((os_log_t)CSLogContextFacilityCoreSpeech);
  v6 = (id)CSLogContextFacilityCoreSpeech;
  v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    v16 = 134349570;
    v17 = (const char *)v4;
    v18 = 2080;
    v19 = COERCE_DOUBLE("SiriX");
    v20 = 2080;
    v21 = "enableTelemetry=YES";
    _os_signpost_emit_with_name_impl(&dword_1B502E000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "SecondPassInferenceLatency", "%{public, signpost.description:begin_time}llu, %s %s", (uint8_t *)&v16, 0x20u);
  }

  -[_EARSyncSpeechRecognizer resultsWithEndedAudio](self->_syncRecognizer, "resultsWithEndedAudio");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSSyncKeywordAnalyzerQuasar _getAnalyzedResults:](self, "_getAnalyzedResults:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = mach_absolute_time();
  v11 = (id)CSLogContextFacilityCoreSpeech;
  v12 = v11;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    v16 = 134349570;
    v17 = (const char *)v10;
    v18 = 2080;
    v19 = COERCE_DOUBLE("SiriX");
    v20 = 2080;
    v21 = "enableTelemetry=YES";
    _os_signpost_emit_with_name_impl(&dword_1B502E000, v12, OS_SIGNPOST_INTERVAL_END, v5, "SecondPassInferenceLatency", "%{public, signpost.description:end_time}llu, %s %s", (uint8_t *)&v16, 0x20u);
  }

  v13 = (id)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    +[CSFTimeUtils hostTimeToSeconds:](CSFTimeUtils, "hostTimeToSeconds:", v10 - v4);
    v16 = 136315394;
    v17 = "-[CSSyncKeywordAnalyzerQuasar getResultsFromFlushedAudio]";
    v18 = 2048;
    v19 = v14;
    _os_log_impl(&dword_1B502E000, v13, OS_LOG_TYPE_DEFAULT, "%s Secondpass model inference took: %.3f seconds", (uint8_t *)&v16, 0x16u);
  }

  return v9;
}

- (void)processAudioChunk:(id)a3
{
  id v3;

  v3 = -[CSSyncKeywordAnalyzerQuasar getAnalyzedResultsFromAudioChunk:](self, "getAnalyzedResultsFromAudioChunk:", a3);
}

- (id)getAnalyzedResultsFromAudioChunk:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  _BOOL4 v7;
  unint64_t v8;
  _EARSyncSpeechRecognizer *syncRecognizer;
  void *v10;
  void *v11;

  v4 = a3;
  self->_requireReset = 1;
  objc_msgSend(v4, "dataForChannel:", self->_activeChannel);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");
  v7 = +[CSConfig inputRecordingIsFloat](CSConfig, "inputRecordingIsFloat");
  v8 = v6 >> 1;
  syncRecognizer = self->_syncRecognizer;
  if (v7)
    -[_EARSyncSpeechRecognizer resultsWithAddedFloatAudio:numberOfSamples:taskName:](syncRecognizer, "resultsWithAddedFloatAudio:numberOfSamples:taskName:", v5, v8, &stru_1E6885088);
  else
    -[_EARSyncSpeechRecognizer resultsWithAddedAudio:numberOfSamples:taskName:](syncRecognizer, "resultsWithAddedAudio:numberOfSamples:taskName:", v5, v8, &stru_1E6885088);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSSyncKeywordAnalyzerQuasar _getAnalyzedResults:](self, "_getAnalyzedResults:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_getAnalyzedResults:(id)a3
{
  void *v4;
  unint64_t v5;
  CSSyncKeywordAnalyzerQuasarResult *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  NSDictionary *phToPhIdMap;
  void *v16;
  void *v17;
  unint64_t v18;
  NSObject *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  uint64_t v28;
  NSObject *v29;
  const char *v30;
  uint32_t v31;
  uint64_t v32;
  id v34;
  CSSyncKeywordAnalyzerQuasar *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  unint64_t v43;
  __int16 v44;
  void *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v34 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_numPhrases)
  {
    v5 = 0;
    do
    {
      v6 = -[CSSyncKeywordAnalyzerQuasarResult initWithConfidence:]([CSSyncKeywordAnalyzerQuasarResult alloc], "initWithConfidence:", -1000.0);
      objc_msgSend(v4, "addObject:", v6);

      ++v5;
    }
    while (v5 < self->_numPhrases);
  }
  v35 = self;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v7 = v34;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v37 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "tokens");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "lastObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12
          || (objc_msgSend(v12, "tokenName"),
              v13 = (void *)objc_claimAutoreleasedReturnValue(),
              v14 = v13 == 0,
              v13,
              v14))
        {
          v28 = CSLogContextFacilityCoreSpeech;
          if (!os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
            goto LABEL_23;
          *(_DWORD *)buf = 136315394;
          v41 = "-[CSSyncKeywordAnalyzerQuasar _getAnalyzedResults:]";
          v42 = 2114;
          v43 = (unint64_t)v12;
          v29 = v28;
          v30 = "%s Invalid token : %{public}@";
          v31 = 22;
LABEL_22:
          _os_log_error_impl(&dword_1B502E000, v29, OS_LOG_TYPE_ERROR, v30, buf, v31);
          goto LABEL_23;
        }
        phToPhIdMap = v35->_phToPhIdMap;
        objc_msgSend(v12, "tokenName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary objectForKeyedSubscript:](phToPhIdMap, "objectForKeyedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "unsignedIntegerValue");

        v19 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v41 = "-[CSSyncKeywordAnalyzerQuasar _getAnalyzedResults:]";
          v42 = 2048;
          v43 = v18;
          v44 = 2114;
          v45 = v12;
          _os_log_impl(&dword_1B502E000, v19, OS_LOG_TYPE_DEFAULT, "%s %tu, token = %{public}@", buf, 0x20u);
        }
        if (v18 >= objc_msgSend(v4, "count"))
        {
          v32 = CSLogContextFacilityCoreSpeech;
          if (!os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
            goto LABEL_23;
          *(_DWORD *)buf = 136315394;
          v41 = "-[CSSyncKeywordAnalyzerQuasar _getAnalyzedResults:]";
          v42 = 1024;
          LODWORD(v43) = v18;
          v29 = v32;
          v30 = "%s Unable to handle: %d";
          v31 = 18;
          goto LABEL_22;
        }
        objc_msgSend(v4, "objectAtIndex:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "triggerConfidence");
        v22 = v21;

        objc_msgSend(v12, "confidence");
        v24 = v23;
        objc_msgSend(v4, "objectAtIndexedSubscript:", v18);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v25;
        if (v24 >= v22)
          v27 = v24;
        else
          v27 = v22;
        objc_msgSend(v25, "setTriggerConfidence:", v27);

LABEL_23:
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
    }
    while (v8);
  }

  return v4;
}

- (unint64_t)activeChannel
{
  return self->_activeChannel;
}

- (void)setActiveChannel:(unint64_t)a3
{
  self->_activeChannel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phToPhIdMap, 0);
  objc_storeStrong((id *)&self->_syncRecognizer, 0);
}

+ (id)_phToPhIdMapFromTriggerTokensArray:(id)a3
{
  id v3;
  void *v4;
  unint64_t i;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i < objc_msgSend(v3, "count"); ++i)
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", i);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("_"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v16;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v8);
          v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKey:", v13, v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

  }
  return v4;
}

+ (void)dumpEARSpeechRecognitionResults:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSObject *v11;
  uint64_t v12;
  id obj;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  uint64_t v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = a3;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
  if (v3)
  {
    v14 = 0;
    v15 = *(_QWORD *)v23;
    do
    {
      v4 = 0;
      v16 = v3;
      do
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v4);
        v6 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v28 = "+[CSSyncKeywordAnalyzerQuasar dumpEARSpeechRecognitionResults:]";
          v29 = 2048;
          v30 = v14;
          _os_log_impl(&dword_1B502E000, v6, OS_LOG_TYPE_DEFAULT, "%s Res-%lu: ", buf, 0x16u);
          ++v14;
        }
        v20 = 0u;
        v21 = 0u;
        v18 = 0u;
        v19 = 0u;
        objc_msgSend(v5, "tokens");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        v17 = v4;
        if (v8)
        {
          v9 = *(_QWORD *)v19;
          do
          {
            for (i = 0; i != v8; ++i)
            {
              if (*(_QWORD *)v19 != v9)
                objc_enumerationMutation(v7);
              v11 = CSLogContextFacilityCoreSpeech;
              if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
              {
                v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
                *(_DWORD *)buf = 136315394;
                v28 = "+[CSSyncKeywordAnalyzerQuasar dumpEARSpeechRecognitionResults:]";
                v29 = 2112;
                v30 = v12;
                _os_log_impl(&dword_1B502E000, v11, OS_LOG_TYPE_DEFAULT, "%s tok=%@", buf, 0x16u);
              }
            }
            v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          }
          while (v8);
        }

        v4 = v17 + 1;
      }
      while (v17 + 1 != v16);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
    }
    while (v3);
  }

}

@end
