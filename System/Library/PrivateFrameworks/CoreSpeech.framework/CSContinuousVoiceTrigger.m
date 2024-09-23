@implementation CSContinuousVoiceTrigger

- (CSContinuousVoiceTrigger)init
{
  CSContinuousVoiceTrigger *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  NSObject *v5;
  NSObject *v6;
  double v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CSContinuousVoiceTrigger;
  v2 = -[CSContinuousVoiceTrigger init](&v9, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("CSContinuousVoiceTrigger Queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = v2->_queue;
    dispatch_get_global_queue(33, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_set_target_queue(v5, v6);

    objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingBufferDuration");
    v2->_heartbeatFactor = (unint64_t)(2.0 / v7);
    -[CSContinuousVoiceTrigger _reset](v2, "_reset");
  }
  return v2;
}

- (void)resetWithAudioRecordContext:(id)a3
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
  v7[2] = __56__CSContinuousVoiceTrigger_resetWithAudioRecordContext___block_invoke;
  v7[3] = &unk_1E7C292A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_reset
{
  unint64_t v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *lastVoiceTriggerScores;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  self->_pendingTwoShotDetection = 0;
  *(_OWORD *)&self->_mode = 0u;
  *(_OWORD *)&self->_triggerEndSampleCount = 0u;
  -[CSKeywordAnalyzerNDAPI reset](self->_keywordAnalyzer, "reset");
  v3 = objc_msgSend(MEMORY[0x1E0D19090], "channelForProcessedInput");
  self->_activeChannel = v3;
  -[CSKeywordAnalyzerNDAPI setActiveChannel:](self->_keywordAnalyzer, "setActiveChannel:", v3);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  lastVoiceTriggerScores = self->_lastVoiceTriggerScores;
  self->_lastVoiceTriggerScores = v4;

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[CSContinuousVoiceTriggerConfig voiceTriggerPhIds](self->_cvtConfig, "voiceTriggerPhIds", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[NSMutableDictionary setObject:forKey:](self->_lastVoiceTriggerScores, "setObject:forKey:", &unk_1E7C643B0, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)setAsset:(id)a3
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
  v7[2] = __37__CSContinuousVoiceTrigger_setAsset___block_invoke;
  v7[3] = &unk_1E7C292A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_setAsset:(id)a3
{
  id v5;
  CSContinuousVoiceTriggerConfig *v6;
  CSContinuousVoiceTriggerConfig *cvtConfig;
  void *v8;
  void *v9;
  CSKeywordAnalyzerNDAPI *v10;
  CSKeywordAnalyzerNDAPI *keywordAnalyzer;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  NSObject *v17;
  int v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    objc_storeStrong((id *)&self->_currentAsset, a3);
    objc_msgSend(MEMORY[0x1E0D19098], "decodeConfigFrom:", self->_currentAsset);
    v6 = (CSContinuousVoiceTriggerConfig *)objc_claimAutoreleasedReturnValue();
    cvtConfig = self->_cvtConfig;
    self->_cvtConfig = v6;

    -[CSAsset resourcePath](self->_currentAsset, "resourcePath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSContinuousVoiceTriggerConfig configPathNDAPI](self->_cvtConfig, "configPathNDAPI");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (CSKeywordAnalyzerNDAPI *)objc_msgSend(objc_alloc(MEMORY[0x1E0D19138]), "initWithConfigPath:resourcePath:", v9, v8);
    keywordAnalyzer = self->_keywordAnalyzer;
    self->_keywordAnalyzer = v10;

    -[CSKeywordAnalyzerNDAPI setActiveChannel:](self->_keywordAnalyzer, "setActiveChannel:", self->_activeChannel);
    -[CSContinuousVoiceTriggerConfig threshold](self->_cvtConfig, "threshold");
    self->_keywordThreshold = v12;
    objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
    v14 = v13;
    -[CSContinuousVoiceTriggerConfig twoShotDecisionWaitTime](self->_cvtConfig, "twoShotDecisionWaitTime");
    self->_twoShotDecisionWaitSamples = (unint64_t)(float)(v14 * v15);
    -[CSContinuousVoiceTriggerConfig twoShotThreshold](self->_cvtConfig, "twoShotThreshold");
    self->_twoShotThreshold = v16;

  }
  else
  {
    v17 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v18 = 136315138;
      v19 = "-[CSContinuousVoiceTrigger _setAsset:]";
      _os_log_impl(&dword_1C2614000, v17, OS_LOG_TYPE_DEFAULT, "%s asset is nil, stop initialization", (uint8_t *)&v18, 0xCu);
    }
  }

}

- (void)startDetectTwoShot:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[CSContinuousVoiceTrigger startDetectTwoShot:]";
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__CSContinuousVoiceTrigger_startDetectTwoShot___block_invoke;
  v8[3] = &unk_1E7C292A0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(queue, v8);

}

- (void)_startDetectTwoShot:(id)a3
{
  id v4;
  int v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  float v10;
  float v11;
  float v12;
  NSObject **v13;
  NSObject *v14;
  unint64_t triggerEndSampleCount;
  void *v16;
  NSObject *v17;
  float v18;
  double v19;
  double twoShotThreshold;
  unint64_t twoShotDecisionWaitSamples;
  float v22;
  _BOOL4 v23;
  unint64_t activeChannel;
  int v25;
  const char *v26;
  __int16 v27;
  unint64_t v28;
  __int16 v29;
  double v30;
  __int16 v31;
  double v32;
  __int16 v33;
  unint64_t v34;
  __int16 v35;
  double v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[CSAudioRecordContext isRTSTriggered](self->_audioRecordContext, "isRTSTriggered");
  if (v4 || !v5)
  {
    self->_mode = 1;
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D19730]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "unsignedIntegerValue");
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D195C8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    self->_triggerEndSampleCount = v8 - objc_msgSend(v9, "unsignedIntegerValue");

    self->_hasResetShotAnalyzerBestScore = 0;
    objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
    v11 = v10;
    -[CSContinuousVoiceTriggerConfig twoShotDecisionWaitTime](self->_cvtConfig, "twoShotDecisionWaitTime");
    self->_twoShotDecisionWaitSamples = (unint64_t)(float)(v11 * v12);
    v13 = (NSObject **)MEMORY[0x1E0D18F60];
    v14 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      triggerEndSampleCount = self->_triggerEndSampleCount;
      v16 = (void *)MEMORY[0x1E0D19090];
      v17 = v14;
      objc_msgSend(v16, "inputRecordingSampleRate");
      v19 = (float)((float)triggerEndSampleCount / v18);
      twoShotThreshold = self->_twoShotThreshold;
      twoShotDecisionWaitSamples = self->_twoShotDecisionWaitSamples;
      objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
      v25 = 136316418;
      v26 = "-[CSContinuousVoiceTrigger _startDetectTwoShot:]";
      v27 = 2050;
      v28 = triggerEndSampleCount;
      v29 = 2050;
      v30 = v19;
      v31 = 2050;
      v32 = twoShotThreshold;
      v33 = 2050;
      v34 = twoShotDecisionWaitSamples;
      v35 = 2050;
      v36 = (float)((float)twoShotDecisionWaitSamples / v22);
      _os_log_impl(&dword_1C2614000, v17, OS_LOG_TYPE_DEFAULT, "%s Setting two shot decision mode triggerEndSampleCount = %{public}tu (%{public}.3f), twoShotThreshold = %{public}.3f, twoShotDecisionWaitSamples = %{public}tu (%{public}.3f)", (uint8_t *)&v25, 0x3Eu);

      v14 = *v13;
    }
    self->_activeChannel = 0;
    v23 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    activeChannel = 0;
    if (v23)
    {
      v25 = 136315394;
      v26 = "-[CSContinuousVoiceTrigger _startDetectTwoShot:]";
      v27 = 2050;
      v28 = 0;
      _os_log_impl(&dword_1C2614000, v14, OS_LOG_TYPE_DEFAULT, "%s Setting active channel of continuous voice trigger to %{public}tu according to VTEI", (uint8_t *)&v25, 0x16u);
      activeChannel = self->_activeChannel;
    }
    -[CSKeywordAnalyzerNDAPI setActiveChannel:](self->_keywordAnalyzer, "setActiveChannel:", activeChannel);
  }
  else
  {
    v6 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v25 = 136315138;
      v26 = "-[CSContinuousVoiceTrigger _startDetectTwoShot:]";
      _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s RTS triggered with nil voicetrigger info. Falling back to CVT pending two shot detection", (uint8_t *)&v25, 0xCu);
    }
    self->_mode = 0;
    self->_pendingTwoShotDetection = 1;
  }

}

- (void)processAudioSamples:(id)a3
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
  v7[2] = __48__CSContinuousVoiceTrigger_processAudioSamples___block_invoke;
  v7[3] = &unk_1E7C292A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_shotAnalyzerNDAPI:(id)a3 hasResultAvailable:(id)a4 forChannel:(unint64_t)a5
{
  id v8;
  float v9;
  float v10;
  os_log_t *v11;
  NSObject *v12;
  unint64_t analyzedSampleCount;
  unint64_t v14;
  char v15;
  unint64_t v16;
  NSObject *v17;
  unint64_t v18;
  float twoShotThreshold;
  NSObject *v20;
  float v21;
  float v22;
  NSObject *queue;
  _QWORD block[6];
  float v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  double v29;
  __int16 v30;
  double v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(a4, "bestScore");
  v10 = v9;
  v11 = (os_log_t *)MEMORY[0x1E0D18F60];
  v12 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v27 = "-[CSContinuousVoiceTrigger _shotAnalyzerNDAPI:hasResultAvailable:forChannel:]";
    v28 = 2050;
    v29 = v10;
    v30 = 2050;
    v31 = *(double *)&a5;
    _os_log_impl(&dword_1C2614000, v12, OS_LOG_TYPE_INFO, "%s Shot: best score = %{public}f for channel = %{public}tu", buf, 0x20u);
    v12 = *v11;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    analyzedSampleCount = self->_analyzedSampleCount;
    v14 = self->_twoShotDecisionWaitSamples + self->_triggerEndSampleCount;
    *(_DWORD *)buf = 136315650;
    v27 = "-[CSContinuousVoiceTrigger _shotAnalyzerNDAPI:hasResultAvailable:forChannel:]";
    v28 = 2050;
    v29 = *(double *)&analyzedSampleCount;
    v30 = 2050;
    v31 = *(double *)&v14;
    _os_log_impl(&dword_1C2614000, v12, OS_LOG_TYPE_INFO, "%s analyzedSampleCount: %{public}tu, checkTime: %{public}lu", buf, 0x20u);
  }
  if (CSIsWatch())
    v15 = -[CSAudioRecordContext isRTSTriggered](self->_audioRecordContext, "isRTSTriggered");
  else
    v15 = 0;
  if (!self->_hasResetShotAnalyzerBestScore && (v15 & 1) == 0)
  {
    v16 = self->_analyzedSampleCount;
    if (v16 >= self->_triggerEndSampleCount)
    {
      v17 = *v11;
      if (os_log_type_enabled(*v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v27 = "-[CSContinuousVoiceTrigger _shotAnalyzerNDAPI:hasResultAvailable:forChannel:]";
        v28 = 2050;
        v29 = *(double *)&v16;
        _os_log_impl(&dword_1C2614000, v17, OS_LOG_TYPE_INFO, "%s Reset bestScore at analyzedSampleCount: %{public}tu", buf, 0x16u);
      }
      self->_hasResetShotAnalyzerBestScore = 1;
      -[CSKeywordAnalyzerNDAPI resetBest](self->_keywordAnalyzer, "resetBest");
    }
  }
  v18 = self->_analyzedSampleCount;
  if (v18 >= self->_twoShotDecisionWaitSamples + self->_triggerEndSampleCount)
  {
    twoShotThreshold = self->_twoShotThreshold;
    if (v10 >= twoShotThreshold)
    {
      objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
      v22 = v21;
      if ((v15 & 1) != 0
        || objc_msgSend(MEMORY[0x1E0D19260], "supportCSTwoShotDecision") && (CSIsOSX() & 1) == 0)
      {
        block[1] = 3221225472;
        queue = self->_queue;
        block[0] = MEMORY[0x1E0C809B0];
        block[2] = __77__CSContinuousVoiceTrigger__shotAnalyzerNDAPI_hasResultAvailable_forChannel___block_invoke;
        block[3] = &unk_1E7C27F58;
        block[4] = self;
        *(double *)&block[5] = (double)v18 / v22;
        v25 = v10;
        dispatch_async(queue, block);
      }
    }
    else
    {
      v20 = *v11;
      if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v27 = "-[CSContinuousVoiceTrigger _shotAnalyzerNDAPI:hasResultAvailable:forChannel:]";
        v28 = 2050;
        v29 = v10;
        v30 = 2050;
        v31 = twoShotThreshold;
        _os_log_impl(&dword_1C2614000, v20, OS_LOG_TYPE_DEFAULT, "%s Not entering two shot: [score: %{public}.3f < threshold: %{public}.3f]", buf, 0x20u);
      }
    }
    self->_mode = 0;
    objc_msgSend(v8, "reset");
  }

}

- (void)_keywordAnalyzerNDAPI:(id)a3 hasResultAvailable:(id)a4 forChannel:(unint64_t)a5 lastVoiceTriggerScore:(float)a6 phId:(unint64_t)a7
{
  id v12;
  id v13;
  float v14;
  float v15;
  uint64_t v16;
  NSObject *v17;
  os_log_t *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  os_log_t *v37;
  NSObject *v38;
  NSObject *v39;
  NSObject *queue;
  id v41;
  void *v42;
  _QWORD block[5];
  double v44;
  _QWORD v45[8];
  _QWORD v46[8];
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  unint64_t v50;
  __int16 v51;
  double v52;
  __int16 v53;
  unint64_t v54;
  __int16 v55;
  uint64_t v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  objc_msgSend(v13, "bestScore");
  v15 = v14;
  v16 = _keywordAnalyzerNDAPI_hasResultAvailable_forChannel_lastVoiceTriggerScore_phId__heartbeat;
  if (!(_keywordAnalyzerNDAPI_hasResultAvailable_forChannel_lastVoiceTriggerScore_phId__heartbeat
       % self->_heartbeatFactor))
  {
    v17 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v48 = "-[CSContinuousVoiceTrigger _keywordAnalyzerNDAPI:hasResultAvailable:forChannel:lastVoiceTriggerScore:phId:]";
      v49 = 2050;
      *(double *)&v50 = v15;
      v51 = 2050;
      v52 = *(double *)&a5;
      v53 = 2050;
      v54 = a7;
      v55 = 2050;
      v56 = v16;
      _os_log_impl(&dword_1C2614000, v17, OS_LOG_TYPE_DEFAULT, "%s NDAPI continuous voicetrigger best score = %{public}f for channel = %{public}tu,  phId: %{public}tu, heartbeat = %{public}lld", buf, 0x34u);
      v16 = _keywordAnalyzerNDAPI_hasResultAvailable_forChannel_lastVoiceTriggerScore_phId__heartbeat;
    }
  }
  _keywordAnalyzerNDAPI_hasResultAvailable_forChannel_lastVoiceTriggerScore_phId__heartbeat = v16 + 1;
  if (v15 <= a6 && v15 >= self->_keywordThreshold)
  {
    v18 = (os_log_t *)MEMORY[0x1E0D18F60];
    v19 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v48 = "-[CSContinuousVoiceTrigger _keywordAnalyzerNDAPI:hasResultAvailable:forChannel:lastVoiceTriggerScore:phId:]";
      v49 = 2048;
      v50 = a7;
      v51 = 2050;
      v52 = v15;
      _os_log_impl(&dword_1C2614000, v19, OS_LOG_TYPE_DEFAULT, "%s Continuous VoiceTrigger detected with %tu! (score = %{public}f)", buf, 0x20u);
    }
    v20 = objc_msgSend(v13, "bestStart");
    v21 = objc_msgSend(v13, "bestEnd");
    v22 = -[CSAudioTimeConverter hostTimeFromSampleCount:](self->_audioTimeConverter, "hostTimeFromSampleCount:", v20);
    v23 = -[CSAudioTimeConverter hostTimeFromSampleCount:](self->_audioTimeConverter, "hostTimeFromSampleCount:", v21);
    v42 = v12;
    if (!self->_audioTimeConverter)
    {
      v24 = *v18;
      if (os_log_type_enabled(*v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v48 = "-[CSContinuousVoiceTrigger _keywordAnalyzerNDAPI:hasResultAvailable:forChannel:lastVoiceTriggerScore:phId:]";
        _os_log_error_impl(&dword_1C2614000, v24, OS_LOG_TYPE_ERROR, "%s Warning: audioTimeConverter not existing, override triggerEndMachTime as NOW", buf, 0xCu);
      }
      v23 = mach_absolute_time();
    }
    v25 = v23;
    v45[0] = *MEMORY[0x1E0D19788];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v13, "bestStart"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v26;
    v45[1] = *MEMORY[0x1E0D19730];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v13, "bestEnd"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v46[1] = v27;
    v45[2] = *MEMORY[0x1E0D19778];
    *(float *)&v28 = v15;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = *MEMORY[0x1E0D19670];
    v46[2] = v29;
    v46[3] = MEMORY[0x1E0C9AAB0];
    v31 = *MEMORY[0x1E0D195A8];
    v45[3] = v30;
    v45[4] = v31;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(MEMORY[0x1E0D19090], "channelForProcessedInput"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v46[4] = v32;
    v45[5] = *MEMORY[0x1E0D19780];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v22);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v46[5] = v33;
    v45[6] = *MEMORY[0x1E0D19728];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v25);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v46[6] = v34;
    v45[7] = *MEMORY[0x1E0D19758];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", mach_absolute_time());
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v46[7] = v35;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 8);
    v36 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());

    v37 = (os_log_t *)MEMORY[0x1E0D18F60];
    v38 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v48 = "-[CSContinuousVoiceTrigger _keywordAnalyzerNDAPI:hasResultAvailable:forChannel:lastVoiceTriggerScore:phId:]";
      v49 = 2114;
      *(double *)&v50 = v36;
      _os_log_impl(&dword_1C2614000, v38, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
    }
    v12 = v42;
    if (!self->_pendingTwoShotDetection || v36 == 0.0)
    {
      objc_msgSend(v42, "reset");
    }
    else
    {
      v39 = *v37;
      if (os_log_type_enabled(*v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v48 = "-[CSContinuousVoiceTrigger _keywordAnalyzerNDAPI:hasResultAvailable:forChannel:lastVoiceTriggerScore:phId:]";
        _os_log_impl(&dword_1C2614000, v39, OS_LOG_TYPE_DEFAULT, "%s Starting pending two shot detection", buf, 0xCu);
      }
      objc_msgSend(v42, "resetBest");
      self->_pendingTwoShotDetection = 0;
      -[CSContinuousVoiceTrigger _startDetectTwoShot:](self, "_startDetectTwoShot:", *(_QWORD *)&v36);
    }
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __107__CSContinuousVoiceTrigger__keywordAnalyzerNDAPI_hasResultAvailable_forChannel_lastVoiceTriggerScore_phId___block_invoke;
    block[3] = &unk_1E7C292A0;
    block[4] = self;
    v44 = v36;
    v41 = *(id *)&v36;
    dispatch_async(queue, block);

  }
}

- (CSContinuousVoiceTriggerDelegate)delegate
{
  return (CSContinuousVoiceTriggerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CSAudioTimeConverter)audioTimeConverter
{
  return self->_audioTimeConverter;
}

- (void)setAudioTimeConverter:(id)a3
{
  objc_storeStrong((id *)&self->_audioTimeConverter, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (CSAsset)currentAsset
{
  return self->_currentAsset;
}

- (void)setCurrentAsset:(id)a3
{
  objc_storeStrong((id *)&self->_currentAsset, a3);
}

- (CSKeywordAnalyzerNDAPI)keywordAnalyzer
{
  return self->_keywordAnalyzer;
}

- (void)setKeywordAnalyzer:(id)a3
{
  objc_storeStrong((id *)&self->_keywordAnalyzer, a3);
}

- (float)keywordThreshold
{
  return self->_keywordThreshold;
}

- (void)setKeywordThreshold:(float)a3
{
  self->_keywordThreshold = a3;
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (unint64_t)analyzedSampleCount
{
  return self->_analyzedSampleCount;
}

- (void)setAnalyzedSampleCount:(unint64_t)a3
{
  self->_analyzedSampleCount = a3;
}

- (unint64_t)triggerEndSampleCount
{
  return self->_triggerEndSampleCount;
}

- (void)setTriggerEndSampleCount:(unint64_t)a3
{
  self->_triggerEndSampleCount = a3;
}

- (unint64_t)twoShotDecisionWaitSamples
{
  return self->_twoShotDecisionWaitSamples;
}

- (void)setTwoShotDecisionWaitSamples:(unint64_t)a3
{
  self->_twoShotDecisionWaitSamples = a3;
}

- (float)twoShotThreshold
{
  return self->_twoShotThreshold;
}

- (void)setTwoShotThreshold:(float)a3
{
  self->_twoShotThreshold = a3;
}

- (unint64_t)activeChannel
{
  return self->_activeChannel;
}

- (void)setActiveChannel:(unint64_t)a3
{
  self->_activeChannel = a3;
}

- (CSAudioRecordContext)audioRecordContext
{
  return self->_audioRecordContext;
}

- (void)setAudioRecordContext:(id)a3
{
  objc_storeStrong((id *)&self->_audioRecordContext, a3);
}

- (CSContinuousVoiceTriggerConfig)cvtConfig
{
  return self->_cvtConfig;
}

- (void)setCvtConfig:(id)a3
{
  objc_storeStrong((id *)&self->_cvtConfig, a3);
}

- (NSMutableDictionary)lastVoiceTriggerScores
{
  return self->_lastVoiceTriggerScores;
}

- (void)setLastVoiceTriggerScores:(id)a3
{
  objc_storeStrong((id *)&self->_lastVoiceTriggerScores, a3);
}

- (BOOL)hasResetShotAnalyzerBestScore
{
  return self->_hasResetShotAnalyzerBestScore;
}

- (void)setHasResetShotAnalyzerBestScore:(BOOL)a3
{
  self->_hasResetShotAnalyzerBestScore = a3;
}

- (BOOL)pendingTwoShotDetection
{
  return self->_pendingTwoShotDetection;
}

- (void)setPendingTwoShotDetection:(BOOL)a3
{
  self->_pendingTwoShotDetection = a3;
}

- (unint64_t)heartbeatFactor
{
  return self->_heartbeatFactor;
}

- (void)setHeartbeatFactor:(unint64_t)a3
{
  self->_heartbeatFactor = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastVoiceTriggerScores, 0);
  objc_storeStrong((id *)&self->_cvtConfig, 0);
  objc_storeStrong((id *)&self->_audioRecordContext, 0);
  objc_storeStrong((id *)&self->_keywordAnalyzer, 0);
  objc_storeStrong((id *)&self->_currentAsset, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_audioTimeConverter, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __107__CSContinuousVoiceTrigger__keywordAnalyzerNDAPI_hasResultAvailable_forChannel_lastVoiceTriggerScore_phId___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  id v4;

  kdebug_trace();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
    objc_msgSend(v4, "continuousVoiceTrigger:detectedVoiceTriggerResult:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

double __77__CSContinuousVoiceTrigger__shotAnalyzerNDAPI_hasResultAvailable_forChannel___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  double result;
  id v5;
  NSObject *v6;
  double v7;
  uint64_t v8;
  double v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  double v15;
  __int16 v16;
  double v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    kdebug_trace();
    v5 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
    objc_msgSend(v5, "continuousVoiceTrigger:detectedSilenceAfterVoiceTriggerAt:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 40));

    v6 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(float *)(a1 + 48);
      v8 = *(_QWORD *)(a1 + 40);
      v9 = *(float *)(*(_QWORD *)(a1 + 32) + 16);
      v10 = 136315906;
      v11 = "-[CSContinuousVoiceTrigger _shotAnalyzerNDAPI:hasResultAvailable:forChannel:]_block_invoke";
      v12 = 2050;
      v13 = v8;
      v14 = 2050;
      v15 = v7;
      v16 = 2050;
      v17 = v9;
      _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s Entering two shot at %{public}.2f with [score: %{public}.3f > threshold: %{public}.3f]", (uint8_t *)&v10, 0x2Au);
    }
  }
  return result;
}

void __48__CSContinuousVoiceTrigger_processAudioSamples___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  _QWORD *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *context;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t v48[128];
  uint8_t buf[4];
  const char *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48))
  {
    v2 = objc_msgSend(*(id *)(a1 + 40), "numSamples");
    if (v2 >= 1)
    {
      v3 = v2;
      v4 = 0;
      do
      {
        context = (void *)MEMORY[0x1C3BC4590]();
        v39 = v4;
        v40 = v3;
        if (v3 >= 640)
          v5 = 640;
        else
          v5 = v3;
        objc_msgSend(*(id *)(a1 + 40), "subChunkFrom:numSamples:", v4, v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v6, "numSamples");
        v35 = objc_msgSend(v6, "numSamples");
        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) += objc_msgSend(v6, "numSamples");
        v37 = v6;
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "getAnalyzedResultsFromAudioChunk:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v8 = 0x1E0CB3000uLL;
        v43 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
        if (v43)
        {
          v9 = 0;
          v42 = *(_QWORD *)v45;
          do
          {
            v10 = 0;
            v41 = v9;
            do
            {
              if (*(_QWORD *)v45 != v42)
                objc_enumerationMutation(v7);
              v11 = v9 + v10;
              v12 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v10);
              v13 = *(_QWORD *)(a1 + 32);
              v14 = *(void **)(v13 + 112);
              if (*(_QWORD *)(v13 + 64) == 1)
              {
                objc_msgSend(v14, "silencePhIds");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(v8 + 2024), "numberWithUnsignedInteger:", v9 + v10);
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                v17 = objc_msgSend(v15, "containsObject:", v16);

                if (v17)
                  objc_msgSend(*(id *)(a1 + 32), "_shotAnalyzerNDAPI:hasResultAvailable:forChannel:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56), v12, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "activeChannel"));
              }
              else
              {
                objc_msgSend(v14, "voiceTriggerPhIds");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(v8 + 2024), "numberWithUnsignedInteger:", v9 + v10);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = objc_msgSend(v18, "containsObject:", v19);

                if (v20)
                {
                  v21 = *(_QWORD **)(a1 + 32);
                  v22 = (void *)v21[7];
                  v23 = objc_msgSend(v22, "activeChannel");
                  v24 = v7;
                  v25 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
                  objc_msgSend(*(id *)(v8 + 2024), "numberWithUnsignedInteger:", v11);
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v25, "objectForKeyedSubscript:", v26);
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v27, "floatValue");
                  objc_msgSend(v21, "_keywordAnalyzerNDAPI:hasResultAvailable:forChannel:lastVoiceTriggerScore:phId:", v22, v12, v23, v11);

                  v28 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
                  v29 = (void *)MEMORY[0x1E0CB37E8];
                  objc_msgSend(v12, "bestScore");
                  objc_msgSend(v29, "numberWithFloat:");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  v32 = v28;
                  v8 = 0x1E0CB3000;
                  objc_msgSend(v32, "setObject:forKey:", v30, v31);

                  v7 = v24;
                  v9 = v41;
                }
              }
              ++v10;
            }
            while (v43 != v10);
            v9 += v10;
            v43 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
          }
          while (v43);
        }
        v3 = v40 - v36;
        v33 = v7;
        v4 = v35 + v39;

        objc_autoreleasePoolPop(context);
      }
      while (v40 - v36 > 0);
    }
  }
  else
  {
    v34 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v50 = "-[CSContinuousVoiceTrigger processAudioSamples:]_block_invoke";
      _os_log_error_impl(&dword_1C2614000, v34, OS_LOG_TYPE_ERROR, "%s Could not find Assets. Cannot process Audio", buf, 0xCu);
    }
  }
}

uint64_t __47__CSContinuousVoiceTrigger_startDetectTwoShot___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startDetectTwoShot:", *(_QWORD *)(a1 + 40));
}

uint64_t __37__CSContinuousVoiceTrigger_setAsset___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setAsset:", *(_QWORD *)(a1 + 40));
}

uint64_t __56__CSContinuousVoiceTrigger_resetWithAudioRecordContext___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAudioRecordContext:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_reset");
}

@end
