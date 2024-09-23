@implementation CSLanguageDetector

- (CSLanguageDetector)init
{
  CSLanguageDetector *v2;
  CSLanguageDetector *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  NSMutableArray *latestDetectedLanguages;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CSLanguageDetector;
  v2 = -[CSLanguageDetector init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_notifyToken = -1;
    v4 = dispatch_queue_create("CSLanguageDetector", 0);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v4;

    v3->_needsToUpdateModel = 1;
    -[CSLanguageDetector _startMonitorLanguageDetectorAssetDownload](v3, "_startMonitorLanguageDetectorAssetDownload");
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 10);
    latestDetectedLanguages = v3->_latestDetectedLanguages;
    v3->_latestDetectedLanguages = (NSMutableArray *)v6;

  }
  return v3;
}

- (CSLanguageDetector)initWithModelURL:(id)a3
{
  id v4;
  CSLanguageDetector *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  CSAsset *currentAsset;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;
  uint64_t v12;
  NSMutableArray *latestDetectedLanguages;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CSLanguageDetector;
  v5 = -[CSLanguageDetector init](&v15, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0D18FC0];
    objc_msgSend(v4, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "assetForAssetType:resourcePath:configVersion:", 2, v7, CFSTR("dummy-version"));
    v8 = objc_claimAutoreleasedReturnValue();
    currentAsset = v5->_currentAsset;
    v5->_currentAsset = (CSAsset *)v8;

    v10 = dispatch_queue_create("CSLanguageDetector", 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v10;

    v5->_needsToUpdateModel = 0;
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 10);
    latestDetectedLanguages = v5->_latestDetectedLanguages;
    v5->_latestDetectedLanguages = (NSMutableArray *)v12;

  }
  return v5;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CSLanguageDetector;
  -[CSLanguageDetector dealloc](&v2, sel_dealloc);
}

- (void)_startMonitorLanguageDetectorAssetDownload
{
  NSObject *v2;
  NSObject *queue;
  _QWORD handler[5];
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self->_notifyToken == -1)
  {
    queue = self->_queue;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __64__CSLanguageDetector__startMonitorLanguageDetectorAssetDownload__block_invoke;
    handler[3] = &unk_1E7C28DC0;
    handler[4] = self;
    notify_register_dispatch("com.apple.MobileAsset.LanguageDetectorAssets.ma.new-asset-installed", &self->_notifyToken, queue, handler);
  }
  else
  {
    v2 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v6 = "-[CSLanguageDetector _startMonitorLanguageDetectorAssetDownload]";
      _os_log_error_impl(&dword_1C2614000, v2, OS_LOG_TYPE_ERROR, "%s Cannot start monitoring language detector asset, since we already registered", buf, 0xCu);
    }
  }
}

- (void)_setupLanguageDetectorWithOption:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *languageDetectorAssetHash;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  _EARLanguageDetector *v12;
  _EARLanguageDetector *languageDetector;
  void *v14;
  _EARLanguageDetector *v15;
  float v16;
  unint64_t v17;
  void *v18;
  _EARLanguageDetectorAudioBuffer *v19;
  _EARLanguageDetectorAudioBuffer *audioBuffer;
  CSAsset *currentAsset;
  NSObject *v22;
  int v23;
  const char *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CSAsset hashFromResourcePath](self->_currentAsset, "hashFromResourcePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (NSString *)objc_msgSend(v5, "copy");
  languageDetectorAssetHash = self->_languageDetectorAssetHash;
  self->_languageDetectorAssetHash = v6;

  -[CSAsset languageDetectorConfigFile](self->_currentAsset, "languageDetectorConfigFile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "fileExistsAtPath:", v8);

  if (v10)
  {
    -[CSLanguageDetector _setNumLatestLangFromConfigFile:](self, "_setNumLatestLangFromConfigFile:", v8);
    v11 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v23 = 136315394;
      v24 = "-[CSLanguageDetector _setupLanguageDetectorWithOption:]";
      v25 = 2114;
      v26 = v8;
      _os_log_impl(&dword_1C2614000, v11, OS_LOG_TYPE_DEFAULT, "%s Creating LanguageDetector with config: %{public}@", (uint8_t *)&v23, 0x16u);
    }
    v12 = (_EARLanguageDetector *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F140]), "initWithConfigFile:", v8);
    languageDetector = self->_languageDetector;
    self->_languageDetector = v12;

    -[CSLanguageDetector _constructLangPriors](self, "_constructLangPriors");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDictationLanguagePriors:", v14);

    v15 = self->_languageDetector;
    objc_msgSend(v4, "samplingRate");
    v17 = (unint64_t)v16;
    objc_msgSend(v4, "languageDetectorRequestContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[_EARLanguageDetector startRequestWith:context:delegate:](v15, "startRequestWith:context:delegate:", v17, v18, self);
    v19 = (_EARLanguageDetectorAudioBuffer *)objc_claimAutoreleasedReturnValue();
    audioBuffer = self->_audioBuffer;
    self->_audioBuffer = v19;

    currentAsset = self->_currentAsset;
    objc_msgSend(v4, "samplingRate");
    -[CSLanguageDetector _initializeStartOfSpeechDetector:samplingRate:](self, "_initializeStartOfSpeechDetector:samplingRate:", currentAsset);
    -[CSLanguageDetector _resetStartOfSpeechDetector](self, "_resetStartOfSpeechDetector");
    self->_currentState = 1;
  }
  else
  {
    v22 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      v23 = 136315138;
      v24 = "-[CSLanguageDetector _setupLanguageDetectorWithOption:]";
      _os_log_error_impl(&dword_1C2614000, v22, OS_LOG_TYPE_ERROR, "%s Cannot initialize language detector since model file is not exits", (uint8_t *)&v23, 0xCu);
    }
  }

}

- (void)resetForNewRequest:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__CSLanguageDetector_resetForNewRequest___block_invoke;
  v7[3] = &unk_1E7C292A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)addSamples:(id)a3 numSamples:(unint64_t)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__CSLanguageDetector_addSamples_numSamples___block_invoke;
  block[3] = &unk_1E7C28B58;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(queue, block);

}

- (void)endAudio
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__CSLanguageDetector_endAudio__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_resetStartOfSpeechDetector
{
  -[CSStartOfSpeechDetector resetForNewRequest](self->_startOfSpeechDetector, "resetForNewRequest");
  -[CSAudioCircularBuffer reset](self->_circBuffer, "reset");
  self->_startOfSpeechDetected = 0;
}

- (void)cancelCurrentRequest
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__CSLanguageDetector_cancelCurrentRequest__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)setInteractionIDforCurrentRequest:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  CSLanguageDetector *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__CSLanguageDetector_setInteractionIDforCurrentRequest___block_invoke;
  v7[3] = &unk_1E7C292A0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_initializeStartOfSpeechDetector:(id)a3 samplingRate:(float)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  CSAudioCircularBuffer *v11;
  CSAudioCircularBuffer *circBuffer;
  CSStartOfSpeechDetector *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  CSStartOfSpeechDetector *v18;
  CSStartOfSpeechDetector *startOfSpeechDetector;
  NSObject *v20;
  int v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "startOfSpeechDetectorConfigFile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSLanguageDetector _readJsonDictionaryAt:](self, "_readJsonDictionaryAt:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    -[CSLanguageDetector _getDefaultValues](self, "_getDefaultValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (!self->_circBuffer)
  {
    v9 = objc_alloc(MEMORY[0x1E0D18FD8]);
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("HistBufferSizeinSecs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "floatValue");
    v11 = (CSAudioCircularBuffer *)objc_msgSend(v9, "initWithNumChannels:recordingDuration:samplingRate:", 1);
    circBuffer = self->_circBuffer;
    self->_circBuffer = v11;

  }
  v13 = [CSStartOfSpeechDetector alloc];
  objc_msgSend(v6, "spgConfigFile");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MinSpeechFrames"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "integerValue");
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("NumLeadingFrames"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[CSStartOfSpeechDetector initWithConfig:samplingRate:minSpeechFrames:numLeadingFrames:delegate:](v13, "initWithConfig:samplingRate:minSpeechFrames:numLeadingFrames:delegate:", v14, (unint64_t)a4, v16, objc_msgSend(v17, "integerValue"), self);
  startOfSpeechDetector = self->_startOfSpeechDetector;
  self->_startOfSpeechDetector = v18;

  if (!self->_circBuffer || !self->_startOfSpeechDetector)
  {
    v20 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v21 = 136315138;
      v22 = "-[CSLanguageDetector _initializeStartOfSpeechDetector:samplingRate:]";
      _os_log_impl(&dword_1C2614000, v20, OS_LOG_TYPE_DEFAULT, "%s Failed to initialize StartOfSpeechDetector !", (uint8_t *)&v21, 0xCu);
    }
  }

}

- (void)recordRecognitionLanguage:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__CSLanguageDetector_recordRecognitionLanguage___block_invoke;
  v7[3] = &unk_1E7C292A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_recordRecognitionLanguage:(id)a3
{
  id v4;

  v4 = a3;
  if (-[NSMutableArray count](self->_latestDetectedLanguages, "count") >= self->_numLatestLanguages)
    -[NSMutableArray removeObjectAtIndex:](self->_latestDetectedLanguages, "removeObjectAtIndex:", 0);
  -[NSMutableArray addObject:](self->_latestDetectedLanguages, "addObject:", v4);

}

- (void)setMostRecentRecognitionLanguage:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__CSLanguageDetector_setMostRecentRecognitionLanguage___block_invoke;
  v7[3] = &unk_1E7C292A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (id)_constructLangPriors
{
  NSMutableArray *v3;
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  float v13;
  float v14;
  double v15;
  NSObject *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  NSMutableArray *v25;
  __int16 v26;
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = self->_latestDetectedLanguages;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = v3;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKey:", v11, (_QWORD)v18);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v12, "floatValue");
          v14 = (float)(v13 * (float)(unint64_t)-[NSMutableArray count](self->_latestDetectedLanguages, "count"))
              + 1.0;
        }
        else
        {
          v14 = 1.0;
        }
        *(float *)&v15 = v14 / (float)(unint64_t)-[NSMutableArray count](self->_latestDetectedLanguages, "count");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v15);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "setObject:forKey:", v8, v11);
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
    }
    while (v7);

  }
  v16 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v23 = "-[CSLanguageDetector _constructLangPriors]";
    v24 = 2112;
    v25 = v5;
    v26 = 2112;
    v27 = v4;
    _os_log_impl(&dword_1C2614000, v16, OS_LOG_TYPE_DEFAULT, "%s Recoreded language array: %@ Language Prior Dictionary: %@", buf, 0x20u);
  }

  return v4;
}

- (void)_setNumLatestLangFromConfigFile:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  unint64_t numLatestLanguages;
  int v9;
  const char *v10;
  __int16 v11;
  unint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[CSLanguageDetector _readJsonDictionaryAt:](self, "_readJsonDictionaryAt:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NumLatestLanguages"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NumLatestLanguages"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    self->_numLatestLanguages = objc_msgSend(v6, "integerValue");

  }
  else
  {
    self->_numLatestLanguages = 10;
  }
  v7 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    numLatestLanguages = self->_numLatestLanguages;
    v9 = 136315394;
    v10 = "-[CSLanguageDetector _setNumLatestLangFromConfigFile:]";
    v11 = 2050;
    v12 = numLatestLanguages;
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s Setting NumLatestLanguages to %{public}lu ", (uint8_t *)&v9, 0x16u);
  }

}

- (id)_readJsonDictionaryAt:(id)a3
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  id v17;
  id v18;
  char v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v19 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "fileExistsAtPath:isDirectory:", v5, &v19);

  if (v19)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CSLanguageDetector.m"), 269, CFSTR("Unexpected!! Received dir for: %@"), v5);

    if ((v7 & 1) != 0)
    {
LABEL_3:
      v18 = 0;
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v5, 0, &v18);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v18;
      if (v9 || !v8)
      {
        v12 = *MEMORY[0x1E0D18F60];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v21 = "-[CSLanguageDetector _readJsonDictionaryAt:]";
          v22 = 2114;
          v23 = v5;
          v24 = 2114;
          v25 = v9;
          _os_log_impl(&dword_1C2614000, v12, OS_LOG_TYPE_DEFAULT, "%s Could not read Json file at: %{public}@, err: %{public}@", buf, 0x20u);
        }
        v11 = 0;
      }
      else
      {
        v17 = 0;
        objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v8, 0, &v17);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v17;
        if (v9 || !v10)
        {
          v13 = *MEMORY[0x1E0D18F60];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            v21 = "-[CSLanguageDetector _readJsonDictionaryAt:]";
            v22 = 2114;
            v23 = v5;
            v24 = 2114;
            v25 = v9;
            _os_log_impl(&dword_1C2614000, v13, OS_LOG_TYPE_DEFAULT, "%s Failed to parse json at: %{public}@, err: %{public}@", buf, 0x20u);
          }
          v11 = 0;
        }
        else
        {
          v11 = v10;
        }

      }
      goto LABEL_20;
    }
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_3;
  }
  v15 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[CSLanguageDetector _readJsonDictionaryAt:]";
    v22 = 2114;
    v23 = v5;
    _os_log_impl(&dword_1C2614000, v15, OS_LOG_TYPE_DEFAULT, "%s Json file doesnt exist at: %{public}@", buf, 0x16u);
  }
  v11 = 0;
LABEL_20:

  return v11;
}

- (id)_getDefaultValues
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v2, "setObject:forKey:", &unk_1E7C643C0, CFSTR("HistBufferSizeinSecs"));
  objc_msgSend(v2, "setObject:forKey:", &unk_1E7C63800, CFSTR("NumLeadingFrames"));
  objc_msgSend(v2, "setObject:forKey:", &unk_1E7C63818, CFSTR("MinSpeechFrames"));
  return v2;
}

- (void)_logSoSResult:(id)a3 toPath:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v11 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", a3, 3, &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;
  if (v7)
  {
    v8 = (void *)*MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      objc_msgSend(v7, "localizedDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v13 = "-[CSLanguageDetector _logSoSResult:toPath:]";
      v14 = 2114;
      v15 = v10;
      _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s Error writing out SoS info meta: %{public}@", buf, 0x16u);

    }
  }
  else
  {
    objc_msgSend(v6, "writeToFile:atomically:", v5, 0);
  }

}

- (void)_logLanguageDetectorMetricsForLoggingInfo:(id)a3
{
  id v4;
  os_log_t *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSString *languageDetectorAssetHash;
  NSString *interactionID;
  NSObject *v15;
  void *v16;
  int v17;
  const char *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (os_log_t *)MEMORY[0x1E0D18F60];
  v6 = (void *)*MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    objc_msgSend(v4, "loggingDict");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 136315394;
    v18 = "-[CSLanguageDetector _logLanguageDetectorMetricsForLoggingInfo:]";
    v19 = 2114;
    v20 = v8;
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s _EARLanguageDetectorLoggingInfo = %{public}@", (uint8_t *)&v17, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSLanguageDetector _constructLangPriors](self, "_constructLangPriors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("dictationPriors"));

  objc_msgSend(v4, "loggingDict");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v4, "loggingDict");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v12, CFSTR("earLoggingInfo"));

  }
  languageDetectorAssetHash = self->_languageDetectorAssetHash;
  if (languageDetectorAssetHash)
    objc_msgSend(v9, "setObject:forKey:", languageDetectorAssetHash, CFSTR("modelHash"));
  interactionID = self->_interactionID;
  if (interactionID)
    objc_msgSend(v9, "setObject:forKey:", interactionID, CFSTR("interactionId"));
  v15 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 136315394;
    v18 = "-[CSLanguageDetector _logLanguageDetectorMetricsForLoggingInfo:]";
    v19 = 2114;
    v20 = v9;
    _os_log_impl(&dword_1C2614000, v15, OS_LOG_TYPE_DEFAULT, "%s _EARLanguageDetectorLoggingInfo analytics context %{public}@", (uint8_t *)&v17, 0x16u);
  }
  objc_msgSend(MEMORY[0x1E0CFE7D8], "sharedAnalytics");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "logEventWithType:context:contextNoCopy:", 4703, v9, 0);

}

- (void)languageDetector:(id)a3 result:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  float v16;
  uint64_t i;
  void *v18;
  void *v19;
  float v20;
  float v21;
  void *v22;
  float v23;
  id v24;
  NSObject *queue;
  id v26;
  id v27;
  id v28;
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t v37[128];
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  int v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "confidences");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)*MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    *(_DWORD *)buf = 136315650;
    v39 = "-[CSLanguageDetector languageDetector:result:]";
    v40 = 2114;
    v41 = v8;
    v42 = 1026;
    v43 = objc_msgSend(v7, "isConfident");
    _os_log_impl(&dword_1C2614000, v10, OS_LOG_TYPE_DEFAULT, "%s %{public}@ isConfident %{public}d", buf, 0x1Cu);

  }
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = *(_QWORD *)v34;
    v16 = -1.0;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v34 != v15)
          objc_enumerationMutation(v11);
        v18 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v11, "objectForKeyedSubscript:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "floatValue");
        v21 = v20;

        if (v21 >= v16)
        {
          objc_msgSend(v11, "objectForKeyedSubscript:", v18);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "floatValue");
          v16 = v23;

          v24 = v18;
          v14 = v24;
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v13);
  }
  else
  {
    v14 = 0;
  }

  queue = self->_queue;
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __46__CSLanguageDetector_languageDetector_result___block_invoke;
  v29[3] = &unk_1E7C27E78;
  v29[4] = self;
  v30 = v14;
  v31 = v11;
  v32 = v7;
  v26 = v7;
  v27 = v11;
  v28 = v14;
  dispatch_async(queue, v29);

}

- (void)languageDetectorDidCompleteProcessing:(id)a3 loggingInfo:(id)a4
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
  v8[2] = __72__CSLanguageDetector_languageDetectorDidCompleteProcessing_loggingInfo___block_invoke;
  v8[3] = &unk_1E7C292A0;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

- (void)startOfSpeechDetector:(id)a3 foundStartSampleAt:(unint64_t)a4
{
  NSObject *queue;
  _QWORD v5[6];

  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__CSLanguageDetector_startOfSpeechDetector_foundStartSampleAt___block_invoke;
  v5[3] = &unk_1E7C29178;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(queue, v5);
}

- (CSLanguageDetectorDelegate)delegate
{
  return (CSLanguageDetectorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_EARLanguageDetector)languageDetector
{
  return self->_languageDetector;
}

- (void)setLanguageDetector:(id)a3
{
  objc_storeStrong((id *)&self->_languageDetector, a3);
}

- (_EARLanguageDetectorAudioBuffer)audioBuffer
{
  return self->_audioBuffer;
}

- (void)setAudioBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_audioBuffer, a3);
}

- (CSStartOfSpeechDetector)startOfSpeechDetector
{
  return self->_startOfSpeechDetector;
}

- (void)setStartOfSpeechDetector:(id)a3
{
  objc_storeStrong((id *)&self->_startOfSpeechDetector, a3);
}

- (CSAudioCircularBuffer)circBuffer
{
  return self->_circBuffer;
}

- (void)setCircBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_circBuffer, a3);
}

- (BOOL)startOfSpeechDetected
{
  return self->_startOfSpeechDetected;
}

- (void)setStartOfSpeechDetected:(BOOL)a3
{
  self->_startOfSpeechDetected = a3;
}

- (BOOL)needsToUpdateModel
{
  return self->_needsToUpdateModel;
}

- (void)setNeedsToUpdateModel:(BOOL)a3
{
  self->_needsToUpdateModel = a3;
}

- (int64_t)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(int64_t)a3
{
  self->_currentState = a3;
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (void)setNotifyToken:(int)a3
{
  self->_notifyToken = a3;
}

- (NSMutableArray)latestDetectedLanguages
{
  return self->_latestDetectedLanguages;
}

- (void)setLatestDetectedLanguages:(id)a3
{
  objc_storeStrong((id *)&self->_latestDetectedLanguages, a3);
}

- (unint64_t)numLatestLanguages
{
  return self->_numLatestLanguages;
}

- (void)setNumLatestLanguages:(unint64_t)a3
{
  self->_numLatestLanguages = a3;
}

- (NSString)languageDetectorAssetHash
{
  return self->_languageDetectorAssetHash;
}

- (void)setLanguageDetectorAssetHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (CSAsset)currentAsset
{
  return self->_currentAsset;
}

- (void)setCurrentAsset:(id)a3
{
  objc_storeStrong((id *)&self->_currentAsset, a3);
}

- (NSString)interactionID
{
  return self->_interactionID;
}

- (void)setInteractionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_interactionID, 0);
  objc_storeStrong((id *)&self->_currentAsset, 0);
  objc_storeStrong((id *)&self->_languageDetectorAssetHash, 0);
  objc_storeStrong((id *)&self->_latestDetectedLanguages, 0);
  objc_storeStrong((id *)&self->_circBuffer, 0);
  objc_storeStrong((id *)&self->_startOfSpeechDetector, 0);
  objc_storeStrong((id *)&self->_audioBuffer, 0);
  objc_storeStrong((id *)&self->_languageDetector, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __63__CSLanguageDetector_startOfSpeechDetector_foundStartSampleAt___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[6];
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  _QWORD v31[2];
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "sampleCount");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(NSObject **)(v3 + 104);
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __63__CSLanguageDetector_startOfSpeechDetector_foundStartSampleAt___block_invoke_2;
  v24[3] = &unk_1E7C29178;
  v24[4] = v3;
  v24[5] = v4;
  dispatch_async(v5, v24);
  v6 = v2 - *(_QWORD *)(a1 + 40);
  if (v6 > objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "bufferLength"))
    v4 = v2 - objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "bufferLength");
  v7 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "copySamplesFrom:to:", v4, v2);
  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(v7, "data");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v8, "addAudioSamples:count:", objc_msgSend(v9, "bytes"), objc_msgSend(v7, "numSamples"));

  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v10, "startOfSpeechAudioLoggingEnabled");

  if ((_DWORD)v9)
  {
    objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "getStartOfSpeechAudioLogFilePath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v31[0] = CFSTR("SpgRegportedStartSampleId");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v13;
    v31[1] = CFSTR("EffectiveStartSampleId");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = *(void **)(a1 + 32);
    objc_msgSend(v12, "stringByAppendingString:", CFSTR("-result.json"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_logSoSResult:toPath:", v15, v17);

    v18 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "copySamplesFrom:to:", v4, v2);
    if (v18)
    {
      v19 = *MEMORY[0x1E0D18F60];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v26 = "-[CSLanguageDetector startOfSpeechDetector:foundStartSampleAt:]_block_invoke";
        v27 = 2050;
        v28 = v4;
        v29 = 2050;
        v30 = v2;
        _os_log_impl(&dword_1C2614000, v19, OS_LOG_TYPE_DEFAULT, "%s Saving circular buffer from %{public}lu to %{public}lu", buf, 0x20u);
      }
      v20 = (void *)MEMORY[0x1E0D191B0];
      v21 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(v12, "stringByAppendingString:", CFSTR("-result.wav"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "URLWithString:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "saveAudioChunck:toURL:", v18, v23);

    }
  }

}

void __63__CSLanguageDetector_startOfSpeechDetector_foundStartSampleAt___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;
  char v4;
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 56) != 3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(v1 + 16));
    v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) != 0)
    {
      v5 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
      objc_msgSend(v5, "startOfSpeechDetectedAtFrame:", *(_QWORD *)(a1 + 40));

    }
  }
}

_QWORD *__72__CSLanguageDetector_languageDetectorDidCompleteProcessing_loggingInfo___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  _QWORD *result;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
    v13 = 136315394;
    v14 = "-[CSLanguageDetector languageDetectorDidCompleteProcessing:loggingInfo:]_block_invoke";
    v15 = 2048;
    v16 = v3;
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s LanguageDetector State: %ld", (uint8_t *)&v13, 0x16u);
  }
  result = *(_QWORD **)(a1 + 32);
  v5 = result[7];
  if ((unint64_t)(v5 - 1) < 2)
  {
    objc_msgSend(result, "_logLanguageDetectorMetricsForLoggingInfo:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "endAudio");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "endAudio");
    result = *(_QWORD **)(a1 + 32);
LABEL_6:
    v6 = (void *)result[6];
    result[6] = 0;

    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 32);
    *(_QWORD *)(v7 + 32) = 0;

    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 24);
    *(_QWORD *)(v9 + 24) = 0;

    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = 0;

    result = *(_QWORD **)(a1 + 32);
    goto LABEL_7;
  }
  if (v5 == 3)
    goto LABEL_6;
LABEL_7:
  result[7] = 0;
  return result;
}

void __46__CSLanguageDetector_languageDetector_result___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;
  char v4;
  uint64_t v5;
  id v6;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 56) != 3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(v1 + 16));
    v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) != 0)
    {
      v5 = *(_QWORD *)(a1 + 32);
      if (*(_BYTE *)(v5 + 8))
      {
        objc_msgSend((id)v5, "_recordRecognitionLanguage:", *(_QWORD *)(a1 + 40));
        v5 = *(_QWORD *)(a1 + 32);
      }
      v6 = objc_loadWeakRetained((id *)(v5 + 16));
      objc_msgSend(v6, "languageDetectorDidDetectLanguageWithConfidence:confidence:isConfident:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 56), "isConfident"));

    }
  }
}

uint64_t __55__CSLanguageDetector_setMostRecentRecognitionLanguage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setObject:atIndexedSubscript:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "count") - 1);
}

uint64_t __48__CSLanguageDetector_recordRecognitionLanguage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_recordRecognitionLanguage:", *(_QWORD *)(a1 + 40));
}

void __56__CSLanguageDetector_setInteractionIDforCurrentRequest___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v7 = 136315394;
    v8 = "-[CSLanguageDetector setInteractionIDforCurrentRequest:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Setting interaction ID for current request: %@", (uint8_t *)&v7, 0x16u);
  }
  v4 = objc_msgSend(*(id *)(a1 + 32), "copy");
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v4;

}

void __42__CSLanguageDetector_cancelCurrentRequest__block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = 3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "endAudio");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "endAudio");
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136315138;
    v4 = "-[CSLanguageDetector cancelCurrentRequest]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Current LanguageDetector request cancelled", (uint8_t *)&v3, 0xCu);
  }
}

uint64_t __30__CSLanguageDetector_endAudio__block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = 2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "endAudio");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "endAudio");
}

uint64_t __44__CSLanguageDetector_addSamples_numSamples___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;

  v3 = a1[4];
  v2 = (void *)a1[5];
  if (*(_BYTE *)(v3 + 8))
    return objc_msgSend(*(id *)(v3 + 32), "addAudioSamples:count:", objc_msgSend(objc_retainAutorelease(v2), "bytes"), a1[6]);
  objc_msgSend(*(id *)(v3 + 48), "addSamples:numSamples:", objc_msgSend(objc_retainAutorelease(v2), "bytes"), a1[6]);
  return objc_msgSend(*(id *)(a1[4] + 40), "addAudio:numSamples:", a1[5], a1[6]);
}

void __41__CSLanguageDetector_resetForNewRequest___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _BYTE *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 48);
  *(_QWORD *)(v2 + 48) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = 0;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = 0;

  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = 0;

  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 96);
  *(_QWORD *)(v10 + 96) = 0;

  v12 = *(_BYTE **)(a1 + 32);
  if (v12[9])
  {
    +[CSAssetControllerFactory defaultController](CSAssetControllerFactory, "defaultController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __41__CSLanguageDetector_resetForNewRequest___block_invoke_2;
    v15[3] = &unk_1E7C26A18;
    v14 = *(void **)(a1 + 40);
    v15[4] = *(_QWORD *)(a1 + 32);
    v16 = v14;
    objc_msgSend(v13, "assetOfType:language:completion:", 2, CFSTR("en-US"), v15);

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = 0;
  }
  else
  {
    objc_msgSend(v12, "_setupLanguageDetectorWithOption:", *(_QWORD *)(a1 + 40));
  }
}

void __41__CSLanguageDetector_resetForNewRequest___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v9 = *(NSObject **)(v7 + 104);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __41__CSLanguageDetector_resetForNewRequest___block_invoke_3;
  v12[3] = &unk_1E7C27E78;
  v13 = v5;
  v14 = v6;
  v15 = v7;
  v16 = v8;
  v10 = v6;
  v11 = v5;
  dispatch_async(v9, v12);

}

void __41__CSLanguageDetector_resetForNewRequest___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 48) + 88), v2);
    objc_msgSend(*(id *)(a1 + 48), "_setupLanguageDetectorWithOption:", *(_QWORD *)(a1 + 56));
  }
  else
  {
    v3 = (void *)*MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      v4 = *(void **)(a1 + 40);
      v5 = v3;
      objc_msgSend(v4, "localizedDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 136315394;
      v8 = "-[CSLanguageDetector resetForNewRequest:]_block_invoke_3";
      v9 = 2114;
      v10 = v6;
      _os_log_error_impl(&dword_1C2614000, v5, OS_LOG_TYPE_ERROR, "%s Cannot access asset : %{public}@", (uint8_t *)&v7, 0x16u);

    }
  }
}

uint64_t __64__CSLanguageDetector__startMonitorLanguageDetectorAssetDownload__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 9) = 1;
  return result;
}

@end
