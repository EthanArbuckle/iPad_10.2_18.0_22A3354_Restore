@implementation CSSingleCheckerPhraseDetector

- (CSSingleCheckerPhraseDetector)init
{
  CSSingleCheckerPhraseDetector *v2;
  uint64_t v3;
  NSMutableArray *phraseDetectorInfos;
  uint64_t v5;
  NSMutableArray *phraseResult;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CSSingleCheckerPhraseDetector;
  v2 = -[CSSingleCheckerPhraseDetector init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    phraseDetectorInfos = v2->_phraseDetectorInfos;
    v2->_phraseDetectorInfos = (NSMutableArray *)v3;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    phraseResult = v2->_phraseResult;
    v2->_phraseResult = (NSMutableArray *)v5;

    v2->_processedSampleCount = 0;
  }
  return v2;
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
    v6 = "-[CSSingleCheckerPhraseDetector dealloc]";
    _os_log_impl(&dword_1B502E000, v3, OS_LOG_TYPE_DEFAULT, "%s CSPhraseDetector Deallocated", buf, 0xCu);
  }
  v4.receiver = self;
  v4.super_class = (Class)CSSingleCheckerPhraseDetector;
  -[CSSingleCheckerPhraseDetector dealloc](&v4, sel_dealloc);
}

- (void)setActiveChannel:(unint64_t)a3
{
  -[CSSyncKeywordAnalyzerQuasar setActiveChannel:](self->_syncKeywordAnalyzerQuasar, "setActiveChannel:", a3);
}

- (void)reset
{
  NSObject *v3;
  unint64_t v4;
  CSSinglePhraseResult *v5;
  double v6;
  double v7;
  double v8;
  CSSinglePhraseResult *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315138;
    v11 = "-[CSSingleCheckerPhraseDetector reset]";
    _os_log_impl(&dword_1B502E000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v10, 0xCu);
  }
  -[CSSyncKeywordAnalyzerQuasar reset](self->_syncKeywordAnalyzerQuasar, "reset");
  -[NSMutableArray removeAllObjects](self->_phraseResult, "removeAllObjects");
  if (-[NSMutableArray count](self->_phraseDetectorInfos, "count"))
  {
    v4 = 0;
    do
    {
      v5 = [CSSinglePhraseResult alloc];
      LODWORD(v6) = -8388608;
      LODWORD(v7) = -998637568;
      LODWORD(v8) = -8388608;
      v9 = -[CSSinglePhraseResult initWithPhId:keywordDetectorDecision:combinedScore:ndapiScore:ndapiResult:recognizerScore:isSecondChance:isSecondChanceCandidate:isRunningQuasar:](v5, "initWithPhId:keywordDetectorDecision:combinedScore:ndapiScore:ndapiResult:recognizerScore:isSecondChance:isSecondChanceCandidate:isRunningQuasar:", v4, 0, 0, 0, 0, self->_syncKeywordAnalyzerQuasar != 0, v6, v8, v7);
      -[NSMutableArray addObject:](self->_phraseResult, "addObject:", v9);

      ++v4;
    }
    while (v4 < -[NSMutableArray count](self->_phraseDetectorInfos, "count"));
  }
  self->_processedSampleCount = 0;
}

- (void)setConfig:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  CSPhraseDetectorInfo *v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  CSSyncKeywordAnalyzerQuasar *v21;
  void *v22;
  CSSyncKeywordAnalyzerQuasar *v23;
  CSSyncKeywordAnalyzerQuasar *syncKeywordAnalyzerQuasar;
  NSMutableArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  float v39;
  float v40;
  float v41;
  void *v42;
  double v43;
  NSObject *v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint8_t v60[128];
  uint8_t buf[4];
  const char *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "phraseConfigs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    -[NSMutableArray removeAllObjects](self->_phraseDetectorInfos, "removeAllObjects");
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    objc_msgSend(v4, "phraseConfigs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v55;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v55 != v10)
            objc_enumerationMutation(v7);
          v12 = -[CSPhraseDetectorInfo initWithPhraseConfig:]([CSPhraseDetectorInfo alloc], "initWithPhraseConfig:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i));
          if (v12)
            -[NSMutableArray addObject:](self->_phraseDetectorInfos, "addObject:", v12);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
      }
      while (v9);
    }

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v14 = self->_phraseDetectorInfos;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v51;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v51 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * j), "phraseConfig");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "recognizerToken");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v20);

        }
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
      }
      while (v16);
    }

    v21 = [CSSyncKeywordAnalyzerQuasar alloc];
    v45 = v4;
    objc_msgSend(v4, "configPathRecognizer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[CSSyncKeywordAnalyzerQuasar initWithConfigPath:triggerTokensArray:preventDuplicatedReset:memoryLock:](v21, "initWithConfigPath:triggerTokensArray:preventDuplicatedReset:memoryLock:", v22, v13, 0, 0);
    syncKeywordAnalyzerQuasar = self->_syncKeywordAnalyzerQuasar;
    self->_syncKeywordAnalyzerQuasar = v23;

    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v25 = self->_phraseDetectorInfos;
    v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v47;
      do
      {
        for (k = 0; k != v27; ++k)
        {
          if (*(_QWORD *)v47 != v28)
            objc_enumerationMutation(v25);
          v30 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * k);
          objc_msgSend(v30, "phraseConfig");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "threshold");
          v39 = *(float *)&v32;
          if (self->_syncKeywordAnalyzerQuasar)
          {
            objc_msgSend(v31, "recognizerScoreOffset");
            v41 = v40;
            v39 = v39 + v40;
            objc_msgSend(v31, "recognizerScoreScaleFactor");
            LODWORD(v37) = LODWORD(v32);
          }
          else
          {
            v41 = 0.0;
            LODWORD(v37) = 0;
          }
          LODWORD(v33) = 2139095040;
          LODWORD(v35) = 0;
          *(float *)&v32 = v39;
          LODWORD(v34) = 2139095040;
          *(float *)&v36 = v41;
          LODWORD(v38) = 2139095040;
          v42 = (void *)objc_msgSend(v31, "copyWithThreshold:secondChanceThreshold:loggingThreshold:ndapiScaleFactor:recognizerScoreOffset:recognizerScoreScaleFactor:keywordRejectLoggingThreshold:", v32, v33, v34, v35, v36, v37, v38);
          objc_msgSend(v30, "setPhraseConfig:", v42);
          *(float *)&v43 = v39;
          objc_msgSend(v30, "setEffectiveKeywordThreshold:", v43);

        }
        v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
      }
      while (v27);
    }

    -[CSSingleCheckerPhraseDetector reset](self, "reset");
    v4 = v45;
  }
  else
  {
    v44 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v62 = "-[CSSingleCheckerPhraseDetector setConfig:]";
      _os_log_error_impl(&dword_1B502E000, v44, OS_LOG_TYPE_ERROR, "%s Invalid assets config!", buf, 0xCu);
    }
  }

}

- (id)getAnalyzedResultFromAudioChunk:(id)a3
{
  CSSyncKeywordAnalyzerQuasar *syncKeywordAnalyzerQuasar;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  if (a3)
  {
    syncKeywordAnalyzerQuasar = self->_syncKeywordAnalyzerQuasar;
    v5 = a3;
    -[CSSyncKeywordAnalyzerQuasar getAnalyzedResultsFromAudioChunk:](syncKeywordAnalyzerQuasar, "getAnalyzedResultsFromAudioChunk:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "numSamples");

    self->_processedSampleCount += v7;
    -[CSSingleCheckerPhraseDetector _phraseDetectorResultFromQuasarResult:](self, "_phraseDetectorResultFromQuasarResult:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)getAnalyzedResultFromFlushedAudio
{
  void *v3;
  void *v4;

  -[CSSyncKeywordAnalyzerQuasar getResultsFromFlushedAudio](self->_syncKeywordAnalyzerQuasar, "getResultsFromFlushedAudio");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSSingleCheckerPhraseDetector _phraseDetectorResultFromQuasarResult:](self, "_phraseDetectorResultFromQuasarResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)phraseDetectorInfoFromPhId:(unint64_t)a3
{
  void *v5;

  if (-[NSMutableArray count](self->_phraseDetectorInfos, "count") <= a3)
  {
    v5 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->_phraseDetectorInfos, "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)_phraseDetectorResultFromQuasarResult:(id)a3
{
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSMutableArray *v21;
  NSObject *v22;
  __int128 v24;
  NSMutableArray *obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  uint64_t v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = self->_phraseDetectorInfos;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
  if (v5)
  {
    v7 = v5;
    v8 = 0;
    v9 = *(_QWORD *)v31;
    *(_QWORD *)&v6 = 136315394;
    v24 = v6;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v31 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
        if (objc_msgSend(v4, "count", v24) <= (unint64_t)(v8 + i))
        {
          v12 = 0;
        }
        else
        {
          objc_msgSend(v4, "objectAtIndex:", v8 + i);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
        }
        -[CSSingleCheckerPhraseDetector _getResultWithPhId:phraseDetectorInfo:quasarResult:](self, "_getResultWithPhId:phraseDetectorInfo:quasarResult:", v8 + i, v11, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13 && -[NSMutableArray count](self->_phraseResult, "count") > (unint64_t)(v8 + i))
        {
          -[NSMutableArray setObject:atIndexedSubscript:](self->_phraseResult, "setObject:atIndexedSubscript:", v13, v8 + i);
        }
        else
        {
          v14 = CSLogContextFacilityCoreSpeech;
          if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v24;
            v36 = "-[CSSingleCheckerPhraseDetector _phraseDetectorResultFromQuasarResult:]";
            v37 = 2048;
            v38 = v8 + i;
            _os_log_error_impl(&dword_1B502E000, v14, OS_LOG_TYPE_ERROR, "%s Received invalid result with %tu", buf, 0x16u);
          }
        }

      }
      v8 += i;
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    }
    while (v7);
  }

  -[CSSingleCheckerPhraseDetector _resultCopyWithKeywordDetectorDecision:phraseResult:](self, "_resultCopyWithKeywordDetectorDecision:phraseResult:", 1, self->_phraseResult);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v16 = self->_phraseResult;
    v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v27;
LABEL_19:
      v20 = 0;
      while (1)
      {
        if (*(_QWORD *)v27 != v19)
          objc_enumerationMutation(v16);
        v21 = *(NSMutableArray **)(*((_QWORD *)&v26 + 1) + 8 * v20);
        if (!-[NSMutableArray decision](v21, "decision"))
          goto LABEL_29;
        if (v18 == ++v20)
        {
          v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          if (v18)
            goto LABEL_19;
          break;
        }
      }
    }

    -[CSSingleCheckerPhraseDetector _resultCopyWithKeywordDetectorDecision:phraseResult:](self, "_resultCopyWithKeywordDetectorDecision:phraseResult:", 3, self->_phraseResult);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      v22 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v36 = "-[CSSingleCheckerPhraseDetector _phraseDetectorResultFromQuasarResult:]";
        _os_log_fault_impl(&dword_1B502E000, v22, OS_LOG_TYPE_FAULT, "%s Phrase detector results fall-into unexpected use case, we return the first phrase result", buf, 0xCu);
      }
      -[NSMutableArray objectAtIndexedSubscript:](self->_phraseResult, "objectAtIndexedSubscript:", 0);
      v21 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      v16 = v21;
LABEL_29:
      v15 = (void *)-[NSMutableArray copy](v21, "copy");

    }
  }

  return v15;
}

- (id)_getResultWithPhId:(unint64_t)a3 phraseDetectorInfo:(id)a4 quasarResult:(id)a5
{
  id v8;
  id v9;
  void *v10;
  float v11;
  float v12;
  float v13;
  float v14;
  double v15;
  double v16;
  CSSinglePhraseResult *v17;
  uint64_t v18;
  NSObject *v19;
  double v20;
  _BOOL4 v21;
  uint64_t v22;
  CSSinglePhraseResult *v23;
  double v24;
  double v25;
  double v26;
  int v28;
  const char *v29;
  __int16 v30;
  unint64_t v31;
  __int16 v32;
  double v33;
  __int16 v34;
  double v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if (-[NSMutableArray count](self->_phraseResult, "count") <= a3)
  {
    v17 = 0;
  }
  else
  {
    objc_msgSend(v8, "phraseConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "effectiveKeywordThreshold");
    v12 = v11;
    objc_msgSend(v10, "recognizerScoreScaleFactor");
    v14 = v13;
    if (v9)
    {
      objc_msgSend(v9, "triggerConfidence");
      v16 = v15;
    }
    else
    {
      v16 = -1000.0;
    }
    v18 = _getResultWithPhId_phraseDetectorInfo_quasarResult__heartbeat;
    v19 = CSLogContextFacilityCoreSpeech;
    if (0xCCCCCCCCCCCCCCCDLL * _getResultWithPhId_phraseDetectorInfo_quasarResult__heartbeat <= 0x3333333333333333
      && os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
    {
      v28 = 136315906;
      v29 = "-[CSSingleCheckerPhraseDetector _getResultWithPhId:phraseDetectorInfo:quasarResult:]";
      v30 = 2048;
      v31 = a3;
      v32 = 2050;
      v33 = v16;
      v34 = 2050;
      v35 = v14;
      _os_log_impl(&dword_1B502E000, v19, OS_LOG_TYPE_INFO, "%s [(%lu)] : second pass best quasar score = %{public}f, quasar scale factor = %{public}f", (uint8_t *)&v28, 0x2Au);
      v18 = _getResultWithPhId_phraseDetectorInfo_quasarResult__heartbeat;
      v19 = CSLogContextFacilityCoreSpeech;
    }
    _getResultWithPhId_phraseDetectorInfo_quasarResult__heartbeat = v18 + 1;
    v20 = v12;
    v21 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    if (v16 >= v20)
    {
      if (v21)
      {
        v28 = 136315906;
        v29 = "-[CSSingleCheckerPhraseDetector _getResultWithPhId:phraseDetectorInfo:quasarResult:]";
        v30 = 2048;
        v31 = a3;
        v32 = 2050;
        v33 = v16;
        v34 = 2050;
        v35 = v20;
        _os_log_impl(&dword_1B502E000, v19, OS_LOG_TYPE_DEFAULT, "%s [(%tu)] : Trigger detected in Quasar,                   recognizerScore = %{public}lf, effective threshold = %{public}f", (uint8_t *)&v28, 0x2Au);
      }
      v22 = 1;
    }
    else
    {
      if (v21)
      {
        v28 = 136315906;
        v29 = "-[CSSingleCheckerPhraseDetector _getResultWithPhId:phraseDetectorInfo:quasarResult:]";
        v30 = 2048;
        v31 = a3;
        v32 = 2050;
        v33 = v16;
        v34 = 2050;
        v35 = v20;
        _os_log_impl(&dword_1B502E000, v19, OS_LOG_TYPE_DEFAULT, "%s [(%tu)] : Notify second pass reject               with best quasar score up to: %{public}.3f, effective threshold = %{public}f", (uint8_t *)&v28, 0x2Au);
      }
      v22 = 3;
    }
    v23 = [CSSinglePhraseResult alloc];
    *(float *)&v24 = v16;
    LODWORD(v25) = -8388608;
    *(float *)&v26 = v16;
    v17 = -[CSSinglePhraseResult initWithPhId:keywordDetectorDecision:combinedScore:ndapiScore:ndapiResult:recognizerScore:isSecondChance:isSecondChanceCandidate:isRunningQuasar:](v23, "initWithPhId:keywordDetectorDecision:combinedScore:ndapiScore:ndapiResult:recognizerScore:isSecondChance:isSecondChanceCandidate:isRunningQuasar:", a3, v22, 0, 0, 0, self->_syncKeywordAnalyzerQuasar != 0, v24, v25, v26);

  }
  return v17;
}

- (id)_resultCopyWithKeywordDetectorDecision:(unint64_t)a3 phraseResult:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  unint64_t v23;
  __int16 v24;
  uint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = a4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v10, "decision", (_QWORD)v16) == a3)
        {
          v12 = (void *)CSLogContextFacilityCoreSpeech;
          if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
          {
            v13 = v12;
            v14 = objc_msgSend(v10, "phId");
            *(_DWORD *)buf = 136315650;
            v21 = "-[CSSingleCheckerPhraseDetector _resultCopyWithKeywordDetectorDecision:phraseResult:]";
            v22 = 2048;
            v23 = a3;
            v24 = 2048;
            v25 = v14;
            _os_log_impl(&dword_1B502E000, v13, OS_LOG_TYPE_DEFAULT, "%s Reporting decision (%tu) from (%tu)", buf, 0x20u);

          }
          v11 = (void *)objc_msgSend(v10, "copy");
          goto LABEL_13;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_13:

  return v11;
}

- (CSSyncKeywordAnalyzerQuasar)syncKeywordAnalyzerQuasar
{
  return self->_syncKeywordAnalyzerQuasar;
}

- (void)setSyncKeywordAnalyzerQuasar:(id)a3
{
  objc_storeStrong((id *)&self->_syncKeywordAnalyzerQuasar, a3);
}

- (NSMutableArray)phraseDetectorInfos
{
  return self->_phraseDetectorInfos;
}

- (void)setPhraseDetectorInfos:(id)a3
{
  objc_storeStrong((id *)&self->_phraseDetectorInfos, a3);
}

- (NSMutableArray)phraseResult
{
  return self->_phraseResult;
}

- (void)setPhraseResult:(id)a3
{
  objc_storeStrong((id *)&self->_phraseResult, a3);
}

- (unint64_t)processedSampleCount
{
  return self->_processedSampleCount;
}

- (void)setProcessedSampleCount:(unint64_t)a3
{
  self->_processedSampleCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phraseResult, 0);
  objc_storeStrong((id *)&self->_phraseDetectorInfos, 0);
  objc_storeStrong((id *)&self->_syncKeywordAnalyzerQuasar, 0);
}

@end
