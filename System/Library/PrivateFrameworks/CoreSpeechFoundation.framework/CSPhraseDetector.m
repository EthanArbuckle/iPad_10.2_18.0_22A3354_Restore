@implementation CSPhraseDetector

- (CSPhraseDetector)init
{
  char *v2;
  float v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CSPhraseDetector;
  v2 = -[CSPhraseDetector init](&v10, sel_init);
  if (v2)
  {
    +[CSConfig inputRecordingSampleRate](CSConfig, "inputRecordingSampleRate");
    *((_QWORD *)v2 + 5) = (unint64_t)(float)(v3 * 0.5);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)*((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 4) = v4;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)*((_QWORD *)v2 + 7);
    *((_QWORD *)v2 + 7) = v6;

    v8 = (void *)*((_QWORD *)v2 + 8);
    *((_QWORD *)v2 + 8) = 0;

    *(_OWORD *)(v2 + 72) = xmmword_1B50D76E0;
  }
  return (CSPhraseDetector *)v2;
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
    v6 = "-[CSPhraseDetector dealloc]";
    _os_log_impl(&dword_1B502E000, v3, OS_LOG_TYPE_DEFAULT, "%s CSPhraseDetector Deallocated", buf, 0xCu);
  }
  v4.receiver = self;
  v4.super_class = (Class)CSPhraseDetector;
  -[CSPhraseDetector dealloc](&v4, sel_dealloc);
}

- (void)setActiveChannel:(unint64_t)a3
{
  -[CSKeywordAnalyzerNDAPI setActiveChannel:](self->_syncKeywordAnalyzerNDAPI, "setActiveChannel:");
  -[CSSyncKeywordAnalyzerQuasar setActiveChannel:](self->_syncKeywordAnalyzerQuasar, "setActiveChannel:", a3);
}

- (void)setRunAsSecondChance:(BOOL)a3
{
  _BOOL4 v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  float v12;
  float v13;
  double v14;
  NSObject *v15;
  NSObject *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  double v25;
  _BYTE v26[128];
  uint64_t v27;

  v3 = a3;
  v27 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = self->_phraseDetectorInfos;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v9, "phraseConfig");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10)
        {
          objc_msgSend(v10, "secondChanceThreshold");
          v13 = v12;
          objc_msgSend(v11, "threshold");
          if (v3)
          {
            *(float *)&v14 = v13;
            objc_msgSend(v9, "setEffectiveKeywordThreshold:", v14);
            v15 = CSLogContextFacilityCoreSpeech;
            if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              v23 = "-[CSPhraseDetector setRunAsSecondChance:]";
              v24 = 2050;
              v25 = v13;
              _os_log_impl(&dword_1B502E000, v15, OS_LOG_TYPE_DEFAULT, "%s Using second chance threshold for voice trigger second pass: %{public}f", buf, 0x16u);
            }
          }
          else
          {
            objc_msgSend(v9, "setEffectiveKeywordThreshold:");
          }
        }
        else
        {
          v16 = CSLogContextFacilityCoreSpeech;
          if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            v23 = "-[CSPhraseDetector setRunAsSecondChance:]";
            _os_log_error_impl(&dword_1B502E000, v16, OS_LOG_TYPE_ERROR, "%s Failed to fetch config", buf, 0xCu);
          }
        }

      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v6);
  }

  self->_isSecondChance = v3;
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
  NSArray *quasarCheckerResultAtCutOff;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315138;
    v12 = "-[CSPhraseDetector reset]";
    _os_log_impl(&dword_1B502E000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v11, 0xCu);
  }
  -[CSKeywordAnalyzerNDAPI reset](self->_syncKeywordAnalyzerNDAPI, "reset");
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
  quasarCheckerResultAtCutOff = self->_quasarCheckerResultAtCutOff;
  self->_quasarCheckerResultAtCutOff = 0;

  self->_processedSampleCount = 0;
}

- (void)setConfig:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  double v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  CSPhraseDetectorInfo *v15;
  CSKeywordAnalyzerNDAPI *v16;
  void *v17;
  void *v18;
  CSKeywordAnalyzerNDAPI *v19;
  CSKeywordAnalyzerNDAPI *syncKeywordAnalyzerNDAPI;
  void *v21;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  int v31;
  void *v32;
  NSObject *v33;
  const __CFString *v34;
  CSSyncKeywordAnalyzerQuasar *v35;
  void *v36;
  CSSyncKeywordAnalyzerQuasar *v37;
  CSSyncKeywordAnalyzerQuasar *syncKeywordAnalyzerQuasar;
  NSMutableArray *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t k;
  void *v44;
  void *v45;
  float v46;
  float v47;
  float v48;
  float v49;
  float v50;
  float v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  int v59;
  NSObject *v60;
  float v61;
  float v62;
  int v63;
  int v64;
  int v65;
  float v66;
  float v67;
  int v68;
  NSObject *v69;
  void *v70;
  double v71;
  NSObject *v72;
  uint64_t v73;
  void *v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  uint8_t buf[4];
  const char *v88;
  __int16 v89;
  double v90;
  __int16 v91;
  double v92;
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "phraseConfigs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    -[NSMutableArray removeAllObjects](self->_phraseDetectorInfos, "removeAllObjects");
    objc_msgSend(v4, "quasarCheckerResultCutOffCount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    self->_quasarCheckerCutOffSamplesCount = objc_msgSend(v7, "unsignedIntegerValue");

    v8 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(double *)&self->_quasarCheckerCutOffSamplesCount;
      *(_DWORD *)buf = 136315394;
      v88 = "-[CSPhraseDetector setConfig:]";
      v89 = 2048;
      v90 = v9;
      _os_log_impl(&dword_1B502E000, v8, OS_LOG_TYPE_DEFAULT, "%s setting quasar checker model processed sample count cut off: %lu", buf, 0x16u);
    }
    v85 = 0u;
    v86 = 0u;
    v83 = 0u;
    v84 = 0u;
    objc_msgSend(v4, "phraseConfigs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v83, v95, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v84;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v84 != v13)
            objc_enumerationMutation(v10);
          v15 = -[CSPhraseDetectorInfo initWithPhraseConfig:]([CSPhraseDetectorInfo alloc], "initWithPhraseConfig:", *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * i));
          if (v15)
            -[NSMutableArray addObject:](self->_phraseDetectorInfos, "addObject:", v15);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v83, v95, 16);
      }
      while (v12);
    }

    v16 = [CSKeywordAnalyzerNDAPI alloc];
    objc_msgSend(v4, "configPathNDAPI");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resourcePath");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[CSKeywordAnalyzerNDAPI initWithConfigPath:resourcePath:](v16, "initWithConfigPath:resourcePath:", v17, v18);
    syncKeywordAnalyzerNDAPI = self->_syncKeywordAnalyzerNDAPI;
    self->_syncKeywordAnalyzerNDAPI = v19;

    v74 = v4;
    if (self->_syncKeywordAnalyzerNDAPI
      && +[CSUtils supportPremiumModel](CSUtils, "supportPremiumModel")
      && objc_msgSend(v4, "useRecognizerCombination"))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = 0u;
      v80 = 0u;
      v81 = 0u;
      v82 = 0u;
      v22 = self->_phraseDetectorInfos;
      v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v79, v94, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v80;
        do
        {
          for (j = 0; j != v24; ++j)
          {
            if (*(_QWORD *)v80 != v25)
              objc_enumerationMutation(v22);
            objc_msgSend(*(id *)(*((_QWORD *)&v79 + 1) + 8 * j), "phraseConfig");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "recognizerToken");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "addObject:", v28);

          }
          v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v79, v94, 16);
        }
        while (v24);
      }

      v29 = +[CSUtils horsemanDeviceType](CSUtils, "horsemanDeviceType") == 3;
      +[CSFPreferences sharedPreferences](CSFPreferences, "sharedPreferences");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "shouldOverwriteVoiceTriggerMLock");

      if (v31)
      {
        +[CSFPreferences sharedPreferences](CSFPreferences, "sharedPreferences");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v32, "overwritingVoiceTriggerMLock");

      }
      v33 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(double *)&v34 = COERCE_DOUBLE(CFSTR("disabled"));
        if ((_DWORD)v29)
          *(double *)&v34 = COERCE_DOUBLE(CFSTR("enabled"));
        *(_DWORD *)buf = 136315394;
        v88 = "-[CSPhraseDetector setConfig:]";
        v89 = 2112;
        v90 = *(double *)&v34;
        _os_log_impl(&dword_1B502E000, v33, OS_LOG_TYPE_DEFAULT, "%s VoiceTrigger memory lock %@", buf, 0x16u);
      }
      v35 = [CSSyncKeywordAnalyzerQuasar alloc];
      objc_msgSend(v74, "configPathRecognizer");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (CSIsHorseman_onceToken != -1)
        dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
      v37 = -[CSSyncKeywordAnalyzerQuasar initWithConfigPath:triggerTokensArray:preventDuplicatedReset:memoryLock:](v35, "initWithConfigPath:triggerTokensArray:preventDuplicatedReset:memoryLock:", v36, v21, CSIsHorseman_isHorseman, v29);
      syncKeywordAnalyzerQuasar = self->_syncKeywordAnalyzerQuasar;
      self->_syncKeywordAnalyzerQuasar = v37;

    }
    else
    {
      v21 = self->_syncKeywordAnalyzerQuasar;
      self->_syncKeywordAnalyzerQuasar = 0;
    }

    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    v39 = self->_phraseDetectorInfos;
    v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v75, v93, 16);
    if (v40)
    {
      v41 = v40;
      v42 = *(_QWORD *)v76;
      v73 = 136315650;
      do
      {
        for (k = 0; k != v41; ++k)
        {
          if (*(_QWORD *)v76 != v42)
            objc_enumerationMutation(v39);
          v44 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * k);
          objc_msgSend(v44, "phraseConfig", v73);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "threshold");
          v47 = v46;
          objc_msgSend(v45, "secondChanceThreshold");
          v49 = v48;
          objc_msgSend(v45, "loggingThreshold");
          v51 = v50;
          objc_msgSend(v45, "ndapiScaleFactor");
          v59 = LODWORD(v52);
          if (!self->_syncKeywordAnalyzerNDAPI)
          {
            v60 = CSLogContextFacilityCoreSpeech;
            if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              v88 = "-[CSPhraseDetector setConfig:]";
              _os_log_impl(&dword_1B502E000, v60, OS_LOG_TYPE_DEFAULT, "%s Reset all thresholds to HUGE_VALF since NDAPI is nil", buf, 0xCu);
            }
            v47 = INFINITY;
            v49 = INFINITY;
            v51 = INFINITY;
          }
          if (self->_syncKeywordAnalyzerQuasar)
          {
            objc_msgSend(v45, "recognizerScoreOffset");
            v62 = v61;
            v47 = v47 + v61;
            v49 = v49 + v61;
            objc_msgSend(v45, "recognizerScoreScaleFactor");
            v64 = v63;
            objc_msgSend(v45, "keywordRejectLoggingThreshold");
            v65 = LODWORD(v52);
          }
          else
          {
            v62 = 0.0;
            v65 = 2139095040;
            v64 = 0;
          }
          if (self->_syncKeywordAnalyzerNDAPI)
          {
            if (!self->_syncKeywordAnalyzerQuasar)
            {
              if (objc_msgSend(v74, "useRecognizerCombination"))
              {
                -[CSKeywordAnalyzerNDAPI getThreshold](self->_syncKeywordAnalyzerNDAPI, "getThreshold");
                v47 = v66;
                -[CSKeywordAnalyzerNDAPI getLoggingThreshold](self->_syncKeywordAnalyzerNDAPI, "getLoggingThreshold");
                v51 = v67;
                -[CSKeywordAnalyzerNDAPI getRejectLoggingThreshold](self->_syncKeywordAnalyzerNDAPI, "getRejectLoggingThreshold");
                v65 = v68;
                v69 = CSLogContextFacilityCoreSpeech;
                if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = v73;
                  v88 = "-[CSPhraseDetector setConfig:]";
                  v89 = 2050;
                  v90 = v47;
                  v91 = 2050;
                  v92 = v51;
                  _os_log_impl(&dword_1B502E000, v69, OS_LOG_TYPE_DEFAULT, "%s Using threshold from NDAPI since we are not able to use Quasar, threshold = %{public}f, logging threshold = %{public}f", buf, 0x20u);
                }
              }
            }
          }
          *(float *)&v52 = v47;
          *(float *)&v53 = v49;
          *(float *)&v54 = v51;
          LODWORD(v55) = v59;
          *(float *)&v56 = v62;
          LODWORD(v57) = v64;
          LODWORD(v58) = v65;
          v70 = (void *)objc_msgSend(v45, "copyWithThreshold:secondChanceThreshold:loggingThreshold:ndapiScaleFactor:recognizerScoreOffset:recognizerScoreScaleFactor:keywordRejectLoggingThreshold:", v52, v53, v54, v55, v56, v57, v58);
          objc_msgSend(v44, "setPhraseConfig:", v70);
          *(float *)&v71 = v47;
          objc_msgSend(v44, "setEffectiveKeywordThreshold:", v71);

        }
        v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v75, v93, 16);
      }
      while (v41);
    }

    -[CSPhraseDetector reset](self, "reset");
    v4 = v74;
  }
  else
  {
    v72 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v88 = "-[CSPhraseDetector setConfig:]";
      _os_log_error_impl(&dword_1B502E000, v72, OS_LOG_TYPE_ERROR, "%s Invalid assets config!", buf, 0xCu);
    }
  }

}

- (id)getAnalyzedResultFromAudioChunk:(id)a3
{
  id v4;
  void *v5;
  NSArray *quasarCheckerResultAtCutOff;
  NSArray *v7;
  void *v8;
  CSSyncKeywordAnalyzerQuasar *syncKeywordAnalyzerQuasar;
  void *v10;

  v4 = a3;
  if (v4)
  {
    -[CSKeywordAnalyzerNDAPI getAnalyzedResultsFromAudioChunk:](self->_syncKeywordAnalyzerNDAPI, "getAnalyzedResultsFromAudioChunk:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    quasarCheckerResultAtCutOff = self->_quasarCheckerResultAtCutOff;
    if (quasarCheckerResultAtCutOff)
    {
      v7 = quasarCheckerResultAtCutOff;
    }
    else
    {
      syncKeywordAnalyzerQuasar = self->_syncKeywordAnalyzerQuasar;
      if (self->_processedSampleCount >= self->_quasarCheckerCutOffSamplesCount)
      {
        -[CSSyncKeywordAnalyzerQuasar getResultsFromFlushedAudio](syncKeywordAnalyzerQuasar, "getResultsFromFlushedAudio");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong((id *)&self->_quasarCheckerResultAtCutOff, v10);
        goto LABEL_9;
      }
      -[CSSyncKeywordAnalyzerQuasar getAnalyzedResultsFromAudioChunk:](syncKeywordAnalyzerQuasar, "getAnalyzedResultsFromAudioChunk:", v4);
      v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    v10 = v7;
LABEL_9:
    self->_processedSampleCount += objc_msgSend(v4, "numSamples");
    -[CSPhraseDetector _phraseDetectorResultFromNDAPIResults:quasarResult:forceMaximized:](self, "_phraseDetectorResultFromNDAPIResults:quasarResult:forceMaximized:", v5, v10, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  v8 = 0;
LABEL_10:

  return v8;
}

- (id)getAnalyzedResultFromFlushedAudio
{
  void *v3;
  NSArray *quasarCheckerResultAtCutOff;
  NSArray *v5;
  NSArray *v6;
  void *v7;

  -[CSKeywordAnalyzerNDAPI getAnalyzedResults](self->_syncKeywordAnalyzerNDAPI, "getAnalyzedResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  quasarCheckerResultAtCutOff = self->_quasarCheckerResultAtCutOff;
  if (quasarCheckerResultAtCutOff)
  {
    v5 = quasarCheckerResultAtCutOff;
  }
  else
  {
    -[CSSyncKeywordAnalyzerQuasar getResultsFromFlushedAudio](self->_syncKeywordAnalyzerQuasar, "getResultsFromFlushedAudio");
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  -[CSPhraseDetector _phraseDetectorResultFromNDAPIResults:quasarResult:forceMaximized:](self, "_phraseDetectorResultFromNDAPIResults:quasarResult:forceMaximized:", v3, v5, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
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

- (id)_phraseDetectorResultFromNDAPIResults:(id)a3 quasarResult:(id)a4 forceMaximized:(BOOL)a5
{
  id v7;
  id v8;
  unint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSMutableArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  float v29;
  uint64_t j;
  void *v31;
  float v32;
  float v33;
  NSMutableArray *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSMutableArray *v39;
  NSObject *v40;
  NSObject *v42;
  __int128 v43;
  NSMutableArray *obj;
  _BOOL4 v45;
  CSPhraseDetector *v46;
  void *v47;
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
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  uint8_t v61[128];
  uint8_t buf[4];
  const char *v63;
  __int16 v64;
  uint64_t v65;
  _BYTE v66[128];
  uint64_t v67;

  v45 = a5;
  v67 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v47 = v7;
  v9 = objc_msgSend(v7, "count");
  if (v9 >= -[NSMutableArray count](self->_phraseDetectorInfos, "count"))
  {
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v46 = self;
    obj = self->_phraseDetectorInfos;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
    if (v12)
    {
      v14 = v12;
      v15 = 0;
      v16 = *(_QWORD *)v57;
      *(_QWORD *)&v13 = 136315394;
      v43 = v13;
      v17 = v8;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v57 != v16)
            objc_enumerationMutation(obj);
          v19 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i);
          if (objc_msgSend(v8, "count", v43) <= (unint64_t)(v15 + i))
          {
            v20 = 0;
          }
          else
          {
            objc_msgSend(v8, "objectAtIndex:", v15 + i);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v47, "objectAtIndex:", v15 + i);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[CSPhraseDetector _getResultWithPhId:phraseDetectorInfo:ndapiResult:quasarResult:forceMaximized:](v46, "_getResultWithPhId:phraseDetectorInfo:ndapiResult:quasarResult:forceMaximized:", v15 + i, v19, v21, v20, v45);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22 && -[NSMutableArray count](v46->_phraseResult, "count") > (unint64_t)(v15 + i))
          {
            -[NSMutableArray setObject:atIndexedSubscript:](v46->_phraseResult, "setObject:atIndexedSubscript:", v22, v15 + i);
          }
          else
          {
            v23 = CSLogContextFacilityCoreSpeech;
            if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v43;
              v63 = "-[CSPhraseDetector _phraseDetectorResultFromNDAPIResults:quasarResult:forceMaximized:]";
              v64 = 2048;
              v65 = v15 + i;
              _os_log_error_impl(&dword_1B502E000, v23, OS_LOG_TYPE_ERROR, "%s Received invalid result with %tu", buf, 0x16u);
            }
          }

          v8 = v17;
        }
        v15 += i;
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
      }
      while (v14);
    }

    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v24 = v46->_phraseResult;
    v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
    if (v25)
    {
      v26 = v25;
      v27 = 0;
      v28 = *(_QWORD *)v53;
      v29 = -INFINITY;
      do
      {
        for (j = 0; j != v26; ++j)
        {
          if (*(_QWORD *)v53 != v28)
            objc_enumerationMutation(v24);
          v31 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * j);
          objc_msgSend(v31, "ndapiScore");
          if (v32 > v29)
          {
            objc_msgSend(v31, "ndapiScore");
            v29 = v33;
            v27 = objc_msgSend(v31, "phId");
          }
        }
        v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
      }
      while (v26);
    }
    else
    {
      v27 = 0;
    }

    -[CSPhraseDetector _resultCopyWithKeywordDetectorDecision:bestPhId:phraseResult:](v46, "_resultCopyWithKeywordDetectorDecision:bestPhId:phraseResult:", 1, v27, v46->_phraseResult);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v34 = v46->_phraseResult;
      v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
      if (v35)
      {
        v36 = v35;
        v37 = *(_QWORD *)v49;
LABEL_34:
        v38 = 0;
        while (1)
        {
          if (*(_QWORD *)v49 != v37)
            objc_enumerationMutation(v34);
          v39 = *(NSMutableArray **)(*((_QWORD *)&v48 + 1) + 8 * v38);
          if (!-[NSMutableArray decision](v39, "decision"))
            break;
          if (v36 == ++v38)
          {
            v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
            if (v36)
              goto LABEL_34;
            goto LABEL_40;
          }
        }
      }
      else
      {
LABEL_40:

        -[CSPhraseDetector _resultCopyWithKeywordDetectorDecision:bestPhId:phraseResult:](v46, "_resultCopyWithKeywordDetectorDecision:bestPhId:phraseResult:", 2, v27, v46->_phraseResult);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          goto LABEL_46;
        -[CSPhraseDetector _resultCopyWithKeywordDetectorDecision:bestPhId:phraseResult:](v46, "_resultCopyWithKeywordDetectorDecision:bestPhId:phraseResult:", 3, v27, v46->_phraseResult);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          goto LABEL_46;
        v40 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315138;
          v63 = "-[CSPhraseDetector _phraseDetectorResultFromNDAPIResults:quasarResult:forceMaximized:]";
          _os_log_fault_impl(&dword_1B502E000, v40, OS_LOG_TYPE_FAULT, "%s Phrase detector results fall-into unexpected use case", buf, 0xCu);
        }
        -[NSMutableArray objectAtIndexedSubscript:](v46->_phraseResult, "objectAtIndexedSubscript:", v27);
        v39 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
        v34 = v39;
      }
      v11 = (void *)-[NSMutableArray copy](v39, "copy");

    }
  }
  else
  {
    v10 = (void *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v42 = v10;
      *(_DWORD *)buf = 136315394;
      v63 = "-[CSPhraseDetector _phraseDetectorResultFromNDAPIResults:quasarResult:forceMaximized:]";
      v64 = 1024;
      LODWORD(v65) = objc_msgSend(v7, "count");
      _os_log_error_impl(&dword_1B502E000, v42, OS_LOG_TYPE_ERROR, "%s Unable to process due to number of result mismatch, ndapiResults number = %d", buf, 0x12u);

    }
    v11 = 0;
  }
LABEL_46:

  return v11;
}

- (id)getLosingPhraseResultsWithDetectedPhId:(unint64_t)a3
{
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = self->_phraseResult;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v11, "phId", (_QWORD)v13) != a3)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_getResultWithPhId:(unint64_t)a3 phraseDetectorInfo:(id)a4 ndapiResult:(id)a5 quasarResult:(id)a6 forceMaximized:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  float v17;
  float v18;
  CSSinglePhraseResult *v19;
  uint64_t v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  double v29;
  double v30;
  float v31;
  float v32;
  void *v33;
  unint64_t v34;
  uint64_t v35;
  double v36;
  _BOOL4 v37;
  uint64_t v38;
  float v39;
  uint64_t v40;
  uint64_t v41;
  double v42;
  NSObject *v43;
  void *v44;
  NSObject *v45;
  uint64_t v46;
  unint64_t nearMissDelayTimeout;
  unint64_t nearMissCandidateDetectedSamples;
  double v49;
  NSObject *v50;
  NSObject *v51;
  double v52;
  unint64_t v53;
  void *v54;
  int v55;
  double v56;
  double v57;
  double v58;
  _BOOL8 v59;
  CSSinglePhraseResult *v60;
  double v61;
  double v62;
  double v63;
  NSObject *v65;
  NSObject *log;
  _BOOL4 v67;
  unint64_t v68;
  void *v69;
  uint8_t buf[4];
  const char *v71;
  __int16 v72;
  unint64_t v73;
  __int16 v74;
  double v75;
  __int16 v76;
  double v77;
  __int16 v78;
  double v79;
  __int16 v80;
  double v81;
  __int16 v82;
  double v83;
  uint64_t v84;

  v7 = a7;
  v84 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (-[NSMutableArray count](self->_phraseResult, "count") > a3)
  {
    v67 = v7;
    -[NSMutableArray objectAtIndex:](self->_phraseResult, "objectAtIndex:", a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "phraseConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v15, "ndapiScore");
      v18 = v17;
    }
    else
    {
      v18 = -INFINITY;
    }
    v20 = objc_msgSend(v12, "hasPendingNearMiss");
    objc_msgSend(v12, "effectiveKeywordThreshold");
    v22 = v21;
    objc_msgSend(v16, "loggingThreshold");
    v24 = v23;
    objc_msgSend(v16, "ndapiScaleFactor");
    v26 = v25;
    objc_msgSend(v16, "recognizerScoreScaleFactor");
    v28 = v27;
    if (v14)
    {
      objc_msgSend(v14, "triggerConfidence");
      v30 = v29;
    }
    else
    {
      v30 = -1000.0;
    }
    v69 = v15;
    objc_msgSend(v13, "bestScore");
    v32 = v31;
    v33 = v13;
    v34 = objc_msgSend(v13, "samplesFed");
    v35 = _getResultWithPhId_phraseDetectorInfo_ndapiResult_quasarResult_forceMaximized__heartbeat;
    if (0xCCCCCCCCCCCCCCCDLL * _getResultWithPhId_phraseDetectorInfo_ndapiResult_quasarResult_forceMaximized__heartbeat <= 0x3333333333333333)
    {
      log = CSLogContextFacilityCoreSpeech;
      v36 = *(double *)&v34;
      v37 = os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO);
      v34 = *(_QWORD *)&v36;
      if (v37)
      {
        *(_DWORD *)buf = 136316674;
        v71 = "-[CSPhraseDetector _getResultWithPhId:phraseDetectorInfo:ndapiResult:quasarResult:forceMaximized:]";
        v72 = 2048;
        v73 = a3;
        v74 = 2050;
        v75 = v32;
        v76 = 2050;
        v77 = v36;
        v78 = 2050;
        v79 = v30;
        v80 = 2050;
        v81 = v26;
        v82 = 2050;
        v83 = v28;
        _os_log_impl(&dword_1B502E000, log, OS_LOG_TYPE_INFO, "%s [(%lu)] : NDAPI second pass best score = %{public}f with analyzed samples:                   %{public}tu with quasar score = %{public}f, ndapi scale factor = %{public}f, quasar scale factor = %{public}f", buf, 0x48u);
        v34 = *(_QWORD *)&v36;
        v35 = _getResultWithPhId_phraseDetectorInfo_ndapiResult_quasarResult_forceMaximized__heartbeat;
      }
    }
    v38 = v35 + 1;
    _getResultWithPhId_phraseDetectorInfo_ndapiResult_quasarResult_forceMaximized__heartbeat = v35 + 1;
    v39 = v32;
    if (self->_syncKeywordAnalyzerQuasar)
      v39 = (float)(v26 * v32) + v30 * v28;
    v40 = v20;
    v13 = v33;
    if (v18 < v32 && !v67)
      goto LABEL_16;
    if (v39 >= v22)
    {
      v44 = (void *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        v45 = v44;
        *(double *)&v46 = COERCE_DOUBLE(objc_msgSend(v33, "samplesFed"));
        *(_DWORD *)buf = 136316162;
        v71 = "-[CSPhraseDetector _getResultWithPhId:phraseDetectorInfo:ndapiResult:quasarResult:forceMaximized:]";
        v72 = 2048;
        v73 = a3;
        v74 = 2050;
        v75 = *(double *)&v46;
        v76 = 2050;
        v77 = v39;
        v78 = 2050;
        v79 = v22;
        _os_log_impl(&dword_1B502E000, v45, OS_LOG_TYPE_DEFAULT, "%s [(%tu)] : Trigger detected with %{public}tu analyzed samples in NDAPI,                   combined score = %{public}lf, effective threshold = %{public}f", buf, 0x34u);

      }
      v41 = 1;
      goto LABEL_36;
    }
    if (v39 < v24)
    {
      if (v67)
      {
        v42 = *(double *)&v34;
        v43 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          v71 = "-[CSPhraseDetector _getResultWithPhId:phraseDetectorInfo:ndapiResult:quasarResult:forceMaximized:]";
          v72 = 2048;
          v73 = a3;
          v74 = 2050;
          v75 = v42;
          v76 = 2050;
          v77 = v39;
          _os_log_impl(&dword_1B502E000, v43, OS_LOG_TYPE_DEFAULT, "%s [(%tu)] : Notify second pass reject at: %{public}tu                   with best score up to: %{public}.3f", buf, 0x2Au);
        }
        v41 = 3;
        goto LABEL_36;
      }
      goto LABEL_16;
    }
    if (!v67)
    {
      if ((_DWORD)v20)
      {
        nearMissDelayTimeout = self->_nearMissDelayTimeout;
        nearMissCandidateDetectedSamples = self->_nearMissCandidateDetectedSamples;
        if (nearMissDelayTimeout + nearMissCandidateDetectedSamples < v34)
          goto LABEL_29;
        if (__ROR8__(0xCCCCCCCCCCCCCCCDLL * v38, 1) <= 0x1999999999999999uLL)
        {
          v68 = v34;
          v65 = CSLogContextFacilityCoreSpeech;
          v40 = 1;
          if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315650;
            v71 = "-[CSPhraseDetector _getResultWithPhId:phraseDetectorInfo:ndapiResult:quasarResult:forceMaximized:]";
            v72 = 2048;
            v73 = a3;
            v74 = 2050;
            *(_QWORD *)&v75 = v68 - nearMissCandidateDetectedSamples + nearMissDelayTimeout;
            _os_log_impl(&dword_1B502E000, v65, OS_LOG_TYPE_INFO, "%s [(%tu)] : Waiting for logging near miss                               until timeout %{public}lu samples", buf, 0x20u);
          }
LABEL_16:
          v41 = 0;
LABEL_36:
          objc_msgSend(v12, "setHasPendingNearMiss:", v40);
          objc_msgSend(v12, "phraseConfig");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "secondChanceThreshold");
          LODWORD(v56) = v55;
          *(float *)&v57 = v39;
          *(float *)&v58 = v22;
          v59 = -[CSPhraseDetector _isSecondChanceCandidateWithScore:effectiveThreshold:secondChanceThreshold:](self, "_isSecondChanceCandidateWithScore:effectiveThreshold:secondChanceThreshold:", v57, v58, v56);

          v60 = [CSSinglePhraseResult alloc];
          *(float *)&v61 = v30;
          *(float *)&v62 = v39;
          *(float *)&v63 = v32;
          v19 = -[CSSinglePhraseResult initWithPhId:keywordDetectorDecision:combinedScore:ndapiScore:ndapiResult:recognizerScore:isSecondChance:isSecondChanceCandidate:isRunningQuasar:](v60, "initWithPhId:keywordDetectorDecision:combinedScore:ndapiScore:ndapiResult:recognizerScore:isSecondChance:isSecondChanceCandidate:isRunningQuasar:", a3, v41, v13, self->_isSecondChance, v59, self->_syncKeywordAnalyzerQuasar != 0, v62, v63, v61);

          goto LABEL_37;
        }
      }
      else
      {
        self->_nearMissCandidateDetectedSamples = v34;
        v51 = CSLogContextFacilityCoreSpeech;
        v52 = *(double *)&v34;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          v53 = self->_nearMissDelayTimeout;
          *(_DWORD *)buf = 136315906;
          v71 = "-[CSPhraseDetector _getResultWithPhId:phraseDetectorInfo:ndapiResult:quasarResult:forceMaximized:]";
          v72 = 2048;
          v73 = a3;
          v74 = 2050;
          v75 = v52;
          v76 = 2050;
          v77 = *(double *)&v53;
          _os_log_impl(&dword_1B502E000, v51, OS_LOG_TYPE_DEFAULT, "%s [(%tu)] : Detected near miss candidate at %{public}tu,                       let's wait %{public}tu samples to log", buf, 0x2Au);
        }
      }
      v41 = 0;
      v40 = 1;
      goto LABEL_36;
    }
LABEL_29:
    v49 = *(double *)&v34;
    v50 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v71 = "-[CSPhraseDetector _getResultWithPhId:phraseDetectorInfo:ndapiResult:quasarResult:forceMaximized:]";
      v72 = 2048;
      v73 = a3;
      v74 = 2050;
      v75 = v49;
      v76 = 2050;
      v77 = v39;
      _os_log_impl(&dword_1B502E000, v50, OS_LOG_TYPE_DEFAULT, "%s [(%tu)] : Detected near miss at %{public}lu samples                       with best score up to: %{public}.3f", buf, 0x2Au);
    }
    v41 = 2;
    goto LABEL_36;
  }
  v19 = 0;
LABEL_37:

  return v19;
}

- (BOOL)_isSecondChanceCandidateWithScore:(float)a3 effectiveThreshold:(float)a4 secondChanceThreshold:(float)a5
{
  BOOL v5;

  v5 = a3 < a4;
  if (a3 < a5)
    v5 = 0;
  return !self->_isSecondChance && v5;
}

- (id)_resultCopyWithKeywordDetectorDecision:(unint64_t)a3 bestPhId:(unint64_t)a4 phraseResult:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  unint64_t v30;
  __int16 v31;
  unint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  objc_msgSend(v7, "objectAtIndexedSubscript:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "decision");

  if (v9 == a3)
  {
    v10 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v28 = "-[CSPhraseDetector _resultCopyWithKeywordDetectorDecision:bestPhId:phraseResult:]";
      v29 = 2048;
      v30 = a3;
      v31 = 2048;
      v32 = a4;
      _os_log_impl(&dword_1B502E000, v10, OS_LOG_TYPE_DEFAULT, "%s Reporting decision (%tu) from (%tu)", buf, 0x20u);
    }
    objc_msgSend(v7, "objectAtIndexedSubscript:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
LABEL_16:
    v17 = (void *)objc_msgSend(v11, "copy");
  }
  else
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v12 = v7;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v23;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v23 != v15)
            objc_enumerationMutation(v12);
          v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          if (objc_msgSend(v11, "decision", (_QWORD)v22) == a3)
          {
            v18 = (void *)CSLogContextFacilityCoreSpeech;
            if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
            {
              v19 = v18;
              v20 = objc_msgSend(v11, "phId");
              *(_DWORD *)buf = 136315650;
              v28 = "-[CSPhraseDetector _resultCopyWithKeywordDetectorDecision:bestPhId:phraseResult:]";
              v29 = 2048;
              v30 = a3;
              v31 = 2048;
              v32 = v20;
              _os_log_impl(&dword_1B502E000, v19, OS_LOG_TYPE_DEFAULT, "%s Reporting decision (%tu) from (%tu)", buf, 0x20u);

            }
            goto LABEL_16;
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v14)
          continue;
        break;
      }
    }
    v17 = 0;
  }

  return v17;
}

- (CSKeywordAnalyzerNDAPI)syncKeywordAnalyzerNDAPI
{
  return self->_syncKeywordAnalyzerNDAPI;
}

- (void)setSyncKeywordAnalyzerNDAPI:(id)a3
{
  objc_storeStrong((id *)&self->_syncKeywordAnalyzerNDAPI, a3);
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

- (unint64_t)nearMissDelayTimeout
{
  return self->_nearMissDelayTimeout;
}

- (void)setNearMissDelayTimeout:(unint64_t)a3
{
  self->_nearMissDelayTimeout = a3;
}

- (unint64_t)nearMissCandidateDetectedSamples
{
  return self->_nearMissCandidateDetectedSamples;
}

- (void)setNearMissCandidateDetectedSamples:(unint64_t)a3
{
  self->_nearMissCandidateDetectedSamples = a3;
}

- (BOOL)isSecondChance
{
  return self->_isSecondChance;
}

- (void)setIsSecondChance:(BOOL)a3
{
  self->_isSecondChance = a3;
}

- (NSMutableArray)phraseResult
{
  return self->_phraseResult;
}

- (void)setPhraseResult:(id)a3
{
  objc_storeStrong((id *)&self->_phraseResult, a3);
}

- (NSArray)quasarCheckerResultAtCutOff
{
  return self->_quasarCheckerResultAtCutOff;
}

- (void)setQuasarCheckerResultAtCutOff:(id)a3
{
  objc_storeStrong((id *)&self->_quasarCheckerResultAtCutOff, a3);
}

- (unint64_t)quasarCheckerCutOffSamplesCount
{
  return self->_quasarCheckerCutOffSamplesCount;
}

- (void)setQuasarCheckerCutOffSamplesCount:(unint64_t)a3
{
  self->_quasarCheckerCutOffSamplesCount = a3;
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
  objc_storeStrong((id *)&self->_quasarCheckerResultAtCutOff, 0);
  objc_storeStrong((id *)&self->_phraseResult, 0);
  objc_storeStrong((id *)&self->_phraseDetectorInfos, 0);
  objc_storeStrong((id *)&self->_syncKeywordAnalyzerQuasar, 0);
  objc_storeStrong((id *)&self->_syncKeywordAnalyzerNDAPI, 0);
}

@end
