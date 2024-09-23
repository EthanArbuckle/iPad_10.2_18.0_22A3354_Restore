@implementation CSKeywordAnalyzerQuasar

- (CSKeywordAnalyzerQuasar)initWithConfigPath:(id)a3 triggerTokens:(id)a4 useKeywordSpotting:(BOOL)a5
{
  id v8;
  id v9;
  id v10;
  dispatch_queue_t v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  _QWORD v24[4];
  id v25;
  id v26;
  objc_super v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v27.receiver = self;
  v27.super_class = (Class)CSKeywordAnalyzerQuasar;
  v10 = -[CSKeywordAnalyzerQuasar init](&v27, sel_init);
  if (v10)
  {
    v11 = dispatch_queue_create("com.apple.transcribe.Transcriber", 0);
    v12 = (void *)*((_QWORD *)v10 + 1);
    *((_QWORD *)v10 + 1) = v11;

    v13 = *((_QWORD *)v10 + 1);
    dispatch_get_global_queue(33, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    dispatch_set_target_queue(v13, v14);

    v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v16 = (void *)*((_QWORD *)v10 + 2);
    *((_QWORD *)v10 + 2) = v15;

    *((_QWORD *)v10 + 8) = 0;
    objc_msgSend(v9, "componentsSeparatedByString:", CFSTR("_"));
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)*((_QWORD *)v10 + 3);
    *((_QWORD *)v10 + 3) = v17;

    v19 = *((_QWORD *)v10 + 3);
    if (v19)
    {
      v20 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v29 = "-[CSKeywordAnalyzerQuasar initWithConfigPath:triggerTokens:useKeywordSpotting:]";
        v30 = 2114;
        v31 = v19;
        _os_log_impl(&dword_1B502E000, v20, OS_LOG_TYPE_DEFAULT, "%s Transcriber trigger token list: %{public}@", buf, 0x16u);
      }
    }
    v21 = (void *)*((_QWORD *)v10 + 5);
    *((_QWORD *)v10 + 5) = 0;

    *((_BYTE *)v10 + 48) = a5;
    v22 = *((_QWORD *)v10 + 1);
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __79__CSKeywordAnalyzerQuasar_initWithConfigPath_triggerTokens_useKeywordSpotting___block_invoke;
    v24[3] = &unk_1E6880E88;
    v25 = v8;
    v26 = v10;
    dispatch_async(v22, v24);

  }
  return (CSKeywordAnalyzerQuasar *)v10;
}

- (void)reset
{
  NSObject *v3;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[CSKeywordAnalyzerQuasar reset]";
    _os_log_impl(&dword_1B502E000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__CSKeywordAnalyzerQuasar_reset__block_invoke;
  block[3] = &unk_1E6881138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[CSKeywordAnalyzerQuasar dealloc]";
    _os_log_impl(&dword_1B502E000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  v4.receiver = self;
  v4.super_class = (Class)CSKeywordAnalyzerQuasar;
  -[CSKeywordAnalyzerQuasar dealloc](&v4, sel_dealloc);
}

- (void)runRecognition
{
  NSObject *v3;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[CSKeywordAnalyzerQuasar runRecognition]";
    _os_log_impl(&dword_1B502E000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__CSKeywordAnalyzerQuasar_runRecognition__block_invoke;
  block[3] = &unk_1E6881138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)endAudio
{
  NSObject *v3;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[CSKeywordAnalyzerQuasar endAudio]";
    _os_log_impl(&dword_1B502E000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__CSKeywordAnalyzerQuasar_endAudio__block_invoke;
  block[3] = &unk_1E6881138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)processAudioChunk:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *queue;
  id v10;
  _QWORD block[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__10200;
  v18 = __Block_byref_object_dispose__10201;
  v19 = 0;
  if (+[CSConfig inputRecordingIsFloat](CSConfig, "inputRecordingIsFloat"))
  {
    objc_msgSend(v4, "dataForChannel:", self->_activeChannel);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[CSFLPCMTypeConverter convertToShortLPCMBufFromFloatLPCMBuf:](CSFLPCMTypeConverter, "convertToShortLPCMBufFromFloatLPCMBuf:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v15[5];
    v15[5] = v6;

  }
  else
  {
    objc_msgSend(v4, "dataForChannel:", self->_activeChannel);
    v8 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v15[5];
    v15[5] = v8;
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__CSKeywordAnalyzerQuasar_processAudioChunk___block_invoke;
  block[3] = &unk_1E68811D8;
  v12 = v4;
  v13 = &v14;
  block[4] = self;
  v10 = v4;
  dispatch_async(queue, block);

  _Block_object_dispose(&v14, 8);
}

- (void)_recognizeWavData:(const signed __int16 *)a3 length:(int)a4
{
  -[_EARSpeechRecognitionAudioBuffer addAudioSamples:count:](self->_recognizerBuffer, "addAudioSamples:count:", a3, a4);
}

- (void)speechRecognizer:(id)a3 didRecognizePartialResult:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__CSKeywordAnalyzerQuasar_speechRecognizer_didRecognizePartialResult___block_invoke;
  v8[3] = &unk_1E6880E88;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

- (void)speechRecognizer:(id)a3 didRecognizeFinalResults:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[4];
  id v9;
  CSKeywordAnalyzerQuasar *v10;

  v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__CSKeywordAnalyzerQuasar_speechRecognizer_didRecognizeFinalResults___block_invoke;
  v8[3] = &unk_1E6880E88;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(queue, v8);

}

- (id)_phIdToCtcScoreMap
{
  NSDictionary **p_ctcKwdToPhIdMap;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  NSDictionary *ctcKwdToPhIdMap;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  float v20;
  float v21;
  double v22;
  void *v23;
  void *v24;
  __int128 v26;
  NSDictionary *obj;
  NSMutableArray *obja;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  p_ctcKwdToPhIdMap = &self->_ctcKwdToPhIdMap;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSDictionary count](self->_ctcKwdToPhIdMap, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = *p_ctcKwdToPhIdMap;
  v5 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v33, v44, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v34 != v6)
          objc_enumerationMutation(obj);
        -[NSDictionary objectForKeyedSubscript:](self->_ctcKwdToPhIdMap, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKey:", &unk_1E68A1B78, v8);

      }
      v5 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v33, v44, 16);
    }
    while (v5);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  obja = self->_previousUtteranceTokens;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v29, v43, 16);
  if (v9)
  {
    v11 = *(_QWORD *)v30;
    *(_QWORD *)&v10 = 136315650;
    v26 = v10;
    do
    {
      for (j = 0; j != v9; ++j)
      {
        if (*(_QWORD *)v30 != v11)
          objc_enumerationMutation(obja);
        v13 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
        ctcKwdToPhIdMap = self->_ctcKwdToPhIdMap;
        objc_msgSend(v13, "tokenName", v26);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary objectForKeyedSubscript:](ctcKwdToPhIdMap, "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v26;
          v38 = "-[CSKeywordAnalyzerQuasar _phIdToCtcScoreMap]";
          v39 = 2114;
          v40 = v16;
          v41 = 2114;
          v42 = v13;
          _os_log_impl(&dword_1B502E000, v17, OS_LOG_TYPE_DEFAULT, "%s MpVT: phId=%{public}@, tok=%{public}@", buf, 0x20u);
        }
        objc_msgSend(v4, "objectForKey:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (!v18 || (objc_msgSend(v18, "floatValue"), v21 = v20, objc_msgSend(v13, "confidence"), v22 > v21))
        {
          v23 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v13, "confidence");
          objc_msgSend(v23, "numberWithDouble:");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKey:", v24, v16);

        }
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v29, v43, 16);
    }
    while (v9);
  }

  return v4;
}

- (void)speechRecognizer:(id)a3 didFinishRecognitionWithError:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[4];
  id v9;
  CSKeywordAnalyzerQuasar *v10;

  v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__CSKeywordAnalyzerQuasar_speechRecognizer_didFinishRecognitionWithError___block_invoke;
  v8[3] = &unk_1E6880E88;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(queue, v8);

}

- (double)_getConfidence:(id)a3
{
  id v4;
  void *v5;
  double v6;
  _QWORD v8[6];
  uint64_t v9;
  double *v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  v5 = v4;
  v6 = 0.0;
  if (v4 && self->_triggerTokenList)
  {
    v9 = 0;
    v10 = (double *)&v9;
    v11 = 0x2020000000;
    v12 = 0x3FF0000000000000;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __42__CSKeywordAnalyzerQuasar__getConfidence___block_invoke;
    v8[3] = &unk_1E6880AB0;
    v8[4] = self;
    v8[5] = &v9;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);
    v6 = v10[3];
    _Block_object_dispose(&v9, 8);
  }

  return v6;
}

- (NSDictionary)ctcKwdToPhIdMap
{
  return self->_ctcKwdToPhIdMap;
}

- (void)setCtcKwdToPhIdMap:(id)a3
{
  objc_storeStrong((id *)&self->_ctcKwdToPhIdMap, a3);
}

- (double)triggerConfidence
{
  return self->_triggerConfidence;
}

- (unint64_t)activeChannel
{
  return self->_activeChannel;
}

- (void)setActiveChannel:(unint64_t)a3
{
  self->_activeChannel = a3;
}

- (CSKeywordAnalyzerQuasarScoreDelegate)delegate
{
  return (CSKeywordAnalyzerQuasarScoreDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_ctcKwdToPhIdMap, 0);
  objc_storeStrong((id *)&self->_recognizerBuffer, 0);
  objc_storeStrong((id *)&self->_recognizer, 0);
  objc_storeStrong((id *)&self->_triggerTokenList, 0);
  objc_storeStrong((id *)&self->_previousUtteranceTokens, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __42__CSKeywordAnalyzerQuasar__getConfidence___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  const char *v14;
  __int16 v15;
  unint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count") > a3)
  {
    objc_msgSend(v5, "tokenName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectAtIndex:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "caseInsensitiveCompare:", v7);

    if (v8)
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                              + 24)
                                                                  * 0.0;
  }
  v9 = (id)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "tokenName");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = objc_msgSend(v10, "UTF8String");
    objc_msgSend(v5, "confidence");
    v13 = 136315906;
    v14 = "-[CSKeywordAnalyzerQuasar _getConfidence:]_block_invoke";
    v15 = 2050;
    v16 = a3;
    v17 = 2080;
    v18 = v11;
    v19 = 2050;
    v20 = v12;
    _os_log_impl(&dword_1B502E000, v9, OS_LOG_TYPE_DEFAULT, "%s EAR Token[%{public}lu]: %s (%{public}f)", (uint8_t *)&v13, 0x2Au);

  }
}

void __74__CSKeywordAnalyzerQuasar_speechRecognizer_didFinishRecognitionWithError___block_invoke(uint64_t a1)
{
  NSObject *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  id WeakRetained;
  id v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v23 = a1;
  if (*(_QWORD *)(a1 + 32))
  {
    v1 = (id)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(v23 + 32), "description");
      v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315394;
      v29 = "-[CSKeywordAnalyzerQuasar speechRecognizer:didFinishRecognitionWithError:]_block_invoke";
      v30 = 2082;
      v31 = objc_msgSend(v22, "UTF8String");
      _os_log_error_impl(&dword_1B502E000, v1, OS_LOG_TYPE_ERROR, "%s ERROR: %{public}s\n", buf, 0x16u);

    }
    a1 = v23;
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 40) + 16);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v25 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v7 = (id)CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v6, "tokenName");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "confidence");
          *(_DWORD *)buf = 136315906;
          v29 = "-[CSKeywordAnalyzerQuasar speechRecognizer:didFinishRecognitionWithError:]_block_invoke";
          v30 = 2112;
          v31 = (uint64_t)v8;
          v32 = 2048;
          v33 = v9;
          v34 = 2112;
          v35 = v6;
          _os_log_impl(&dword_1B502E000, v7, OS_LOG_TYPE_DEFAULT, "%s CTC: Final-tok: %@(%f):%@", buf, 0x2Au);

        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
    }
    while (v3);
  }

  v10 = v23;
  v11 = *(_QWORD *)(v23 + 40);
  if (*(_BYTE *)(v11 + 48))
  {
    if (*(_QWORD *)(v23 + 32))
    {
      *(_QWORD *)(v11 + 64) = 0xC08F400000000000;
      goto LABEL_22;
    }
    objc_msgSend(*(id *)(v11 + 16), "lastObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "confidence");
    *(_QWORD *)(*(_QWORD *)(v23 + 40) + 64) = v15;

    goto LABEL_21;
  }
  if (*(_QWORD *)(v11 + 24))
  {
    v12 = objc_msgSend(*(id *)(v11 + 16), "count");
    v10 = v23;
    if (v12 >= objc_msgSend(*(id *)(*(_QWORD *)(v23 + 40) + 24), "count"))
    {
      objc_msgSend(*(id *)(v23 + 40), "_getConfidence:", *(_QWORD *)(*(_QWORD *)(v23 + 40) + 16));
      *(_QWORD *)(*(_QWORD *)(v23 + 40) + 64) = v13;
LABEL_21:
      v10 = v23;
    }
  }
LABEL_22:
  v16 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v17 = *(_QWORD *)(*(_QWORD *)(v10 + 40) + 64);
    *(_DWORD *)buf = 136315394;
    v29 = "-[CSKeywordAnalyzerQuasar speechRecognizer:didFinishRecognitionWithError:]_block_invoke";
    v30 = 2050;
    v31 = v17;
    _os_log_impl(&dword_1B502E000, v16, OS_LOG_TYPE_DEFAULT, "%s Final result confidence: %{public}f", buf, 0x16u);
  }
  +[CSFPreferences sharedPreferences](CSFPreferences, "sharedPreferences");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isMphVTEnabled");

  if (v19)
  {
    objc_msgSend(*(id *)(v23 + 40), "_phIdToCtcScoreMap");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(v23 + 40) + 80));
  objc_msgSend(WeakRetained, "keywordAnalyzerQuasar:hasResultAvailable:forChannel:", *(_QWORD *)(v23 + 40), v20, *(_QWORD *)(*(_QWORD *)(v23 + 40) + 72));

}

void __69__CSKeywordAnalyzerQuasar_speechRecognizer_didRecognizeFinalResults___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "firstObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "tokens");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[CSFPreferences sharedPreferences](CSFPreferences, "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isMphVTEnabled");

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = v16;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v9 = *(_QWORD *)(a1 + 40);
        if (!v3)
          goto LABEL_11;
        v10 = *(void **)(v9 + 24);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "tokenName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v10) = objc_msgSend(v10, "containsObject:", v11);

        v12 = (id)CSLogContextFacilityCoreSpeech;
        v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
        if ((_DWORD)v10)
        {
          if (v13)
          {
            objc_msgSend(v8, "tokenName");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315394;
            v23 = "-[CSKeywordAnalyzerQuasar speechRecognizer:didRecognizeFinalResults:]_block_invoke";
            v24 = 2114;
            v25 = v14;
            _os_log_impl(&dword_1B502E000, v12, OS_LOG_TYPE_DEFAULT, "%s CTC: Adding tok=%{public}@", buf, 0x16u);

          }
          v9 = *(_QWORD *)(a1 + 40);
LABEL_11:
          objc_msgSend(*(id *)(v9 + 16), "addObject:", v8);
          continue;
        }
        if (v13)
        {
          objc_msgSend(v8, "tokenName");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v23 = "-[CSKeywordAnalyzerQuasar speechRecognizer:didRecognizeFinalResults:]_block_invoke";
          v24 = 2114;
          v25 = v15;
          _os_log_impl(&dword_1B502E000, v12, OS_LOG_TYPE_DEFAULT, "%s CTC: Ignoring tok=%{public}@", buf, 0x16u);

        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v5);
  }

}

void __70__CSKeywordAnalyzerQuasar_speechRecognizer_didRecognizePartialResult___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  unint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  id WeakRetained;
  int v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24))
  {
    objc_msgSend(*(id *)(a1 + 40), "tokens");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "count");
    v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count");

    if (v3 >= v4)
    {
      v5 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "tokens");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_getConfidence:", v6);
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = v7;

      v8 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
        v11 = 136315394;
        v12 = "-[CSKeywordAnalyzerQuasar speechRecognizer:didRecognizePartialResult:]_block_invoke";
        v13 = 2050;
        v14 = v9;
        _os_log_impl(&dword_1B502E000, v8, OS_LOG_TYPE_DEFAULT, "%s Partial result confidence: %{public}f", (uint8_t *)&v11, 0x16u);
      }
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 80));
      objc_msgSend(WeakRetained, "keywordAnalyzerQuasar:hasResultAvailable:forChannel:", *(_QWORD *)(a1 + 32), 0, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));

    }
  }
}

uint64_t __45__CSKeywordAnalyzerQuasar_processAudioChunk___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_recognizeWavData:length:", objc_msgSend(objc_retainAutorelease(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)), "bytes"), objc_msgSend(*(id *)(a1 + 40), "numSamples"));
}

uint64_t __35__CSKeywordAnalyzerQuasar_endAudio__block_invoke(uint64_t a1)
{
  kdebug_trace();
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "endAudio");
}

void __41__CSKeywordAnalyzerQuasar_runRecognition__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "runRecognitionWithResultStream:");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __32__CSKeywordAnalyzerQuasar_reset__block_invoke(uint64_t a1)
{
  uint64_t v1;
  double v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = -1000.0;
  if (!*(_BYTE *)(v1 + 48))
    v2 = 0.0;
  *(double *)(v1 + 64) = v2;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAllObjects");
}

void __79__CSKeywordAnalyzerQuasar_initWithConfigPath_triggerTokens_useKeywordSpotting___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  NSObject *v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  NSObject *v13;
  int v14;
  const char *v15;
  __int16 v16;
  double v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "systemUptime");
  v4 = v3;

  v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(double *)(a1 + 32);
    v14 = 136315394;
    v15 = "-[CSKeywordAnalyzerQuasar initWithConfigPath:triggerTokens:useKeywordSpotting:]_block_invoke";
    v16 = 2114;
    v17 = v6;
    _os_log_impl(&dword_1B502E000, v5, OS_LOG_TYPE_DEFAULT, "%s Initializing Quasar with config: %{public}@", (uint8_t *)&v14, 0x16u);
  }
  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1F178]), "initWithConfiguration:", *(_QWORD *)(a1 + 32));
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(void **)(v8 + 32);
  *(_QWORD *)(v8 + 32) = v7;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "systemUptime");
  v12 = v11;

  v13 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136315394;
    v15 = "-[CSKeywordAnalyzerQuasar initWithConfigPath:triggerTokens:useKeywordSpotting:]_block_invoke";
    v16 = 2050;
    v17 = (v12 - v4) * 1000.0;
    _os_log_impl(&dword_1B502E000, v13, OS_LOG_TYPE_DEFAULT, "%s Speech model loading took %{public}.3fms", (uint8_t *)&v14, 0x16u);
  }
}

@end
