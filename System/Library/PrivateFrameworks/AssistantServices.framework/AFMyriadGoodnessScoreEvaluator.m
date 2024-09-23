@implementation AFMyriadGoodnessScoreEvaluator

- (AFMyriadGoodnessScoreEvaluator)initWithDeviceInstanceContext:(id)a3 queue:(id)a4
{
  return -[AFMyriadGoodnessScoreEvaluator initWithDeviceInstanceContext:preferences:queue:instrumentation:](self, "initWithDeviceInstanceContext:preferences:queue:instrumentation:", a3, 0, a4, 0);
}

- (AFMyriadGoodnessScoreEvaluator)initWithDeviceInstanceContext:(id)a3 preferences:(id)a4 queue:(id)a5
{
  return -[AFMyriadGoodnessScoreEvaluator initWithDeviceInstanceContext:preferences:queue:instrumentation:](self, "initWithDeviceInstanceContext:preferences:queue:instrumentation:", a3, a4, a5, 0);
}

- (AFMyriadGoodnessScoreEvaluator)initWithDeviceInstanceContext:(id)a3 preferences:(id)a4 queue:(id)a5 instrumentation:(id)a6
{
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  AFMyriadGoodnessScoreEvaluator *v15;
  AFMyriadGoodnessScoreEvaluator *v16;
  AFPreferences *v17;
  AFPreferences *pref;
  NSString *endpointModelName;
  AFMyriadGoodnessScoreEvaluator *v20;
  void *v21;
  _QWORD block[4];
  AFMyriadGoodnessScoreEvaluator *v24;
  objc_super v25;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v25.receiver = self;
  v25.super_class = (Class)AFMyriadGoodnessScoreEvaluator;
  v15 = -[AFMyriadGoodnessScoreEvaluator init](&v25, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_deviceInstanceContext, a3);
    if (v12)
      v17 = (AFPreferences *)v12;
    else
      v17 = -[AFPreferences initWithInstanceContext:]([AFPreferences alloc], "initWithInstanceContext:", v16->_deviceInstanceContext);
    pref = v16->_pref;
    v16->_pref = v17;

    v16->_platformBiasAcquisitionState = 0;
    objc_storeStrong((id *)&v16->_queue, a5);
    v16->_scoreEvaluationLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v16->_myriadInstrumentation, a6);
    v16->_mediaPlaybackBoost = 7;
    v16->_isSpeakerEndpoint = 0;
    endpointModelName = v16->_endpointModelName;
    v16->_endpointModelName = 0;

    *(double *)((char *)&v16->_recentSiriSecondDegreeCoefficient + 6) = 0.0;
    *(_QWORD *)&v16->_isRecentSiriBoostTrialEnabled = 0;
    HIWORD(v16->_recentSiriIntercept) = 0;
    *(double *)((char *)&v16->_recentSiriFirstDegreeCoefficient + 6) = 0.0;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __98__AFMyriadGoodnessScoreEvaluator_initWithDeviceInstanceContext_preferences_queue_instrumentation___block_invoke;
    block[3] = &unk_1E3A36F30;
    v20 = v16;
    v24 = v20;
    dispatch_async(v13, block);
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObserver:selector:name:object:", v20, sel_myriadTrialBoostsUpdated_, CFSTR("AFMyriadTrialBoostsUpdatedNotification"), 0);

  }
  return v16;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)AFMyriadGoodnessScoreEvaluator;
  -[AFMyriadGoodnessScoreEvaluator dealloc](&v4, sel_dealloc);
}

- (void)myriadTrialBoostsUpdated:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__AFMyriadGoodnessScoreEvaluator_myriadTrialBoostsUpdated___block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(queue, block);
}

- (unsigned)_getRecentBump:(double)a3 ignoreAdjustedBoost:(BOOL)a4 recentlyWonBySmallAmount:(BOOL)a5
{
  NSObject *v5;
  int v6;
  _BOOL4 v7;
  double v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  unsigned int v20;
  NSObject *v21;
  NSObject *v22;
  double v23;
  double v24;
  AFMyriadInstrumentation *myriadInstrumentation;
  uint64_t v26;
  uint64_t v27;
  int v29;
  const char *v30;
  __int16 v31;
  double v32;
  __int16 v33;
  _BYTE v34[28];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v29 = 136315138;
      v30 = "-[AFMyriadGoodnessScoreEvaluator _getRecentBump:ignoreAdjustedBoost:recentlyWonBySmallAmount:]";
      _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s #myriad ignoring recent event bump", (uint8_t *)&v29, 0xCu);
    }
    LOBYTE(v6) = 0;
  }
  else
  {
    v7 = a5;
    if (softLinkMKBGetDeviceLockState(0) == 3
      || (v10 = 0.0, !softLinkMKBGetDeviceLockState(0)))
    {
      v11 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        v29 = 136315138;
        v30 = "-[AFMyriadGoodnessScoreEvaluator _getRecentBump:ignoreAdjustedBoost:recentlyWonBySmallAmount:]";
        _os_log_impl(&dword_19AF50000, v11, OS_LOG_TYPE_INFO, "%s #myriad device is unlocked, compute bump", (uint8_t *)&v29, 0xCu);
      }
      v10 = 4.0;
      if (AFCDAFaceDetection())
      {
        if (AFAccessibilitySupportsAttentionAwareFeatures())
        {
          v12 = AFSiriLogContextConnection;
          v10 = 0.0;
          if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
          {
            v29 = 136315138;
            v30 = "-[AFMyriadGoodnessScoreEvaluator _getRecentBump:ignoreAdjustedBoost:recentlyWonBySmallAmount:]";
            _os_log_debug_impl(&dword_19AF50000, v12, OS_LOG_TYPE_DEBUG, "%s #myriad unlock bump is ignored due to awareness being on", (uint8_t *)&v29, 0xCu);
          }
        }
      }
    }
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "systemUptime");
    v15 = v14;

    v16 = v15 - a3;
    v17 = v15 - a3 + -15.0;
    if (v17 < 0.0)
      v17 = 0.0;
    v18 = v17 * -0.0444444455 + 8.0;
    if (v18 >= 0.0)
      v19 = v18;
    else
      v19 = 0.0;
    if (self->_isRecentSiriBoostTrialEnabled && self->_isExponentialBoostDefined)
    {
      v20 = AFMyriadGoodnessComputeExponentialBoost(a3, v15, self->_recentSiriSecondDegreeCoefficient, self->_recentSiriFirstDegreeCoefficient, self->_recentSiriIntercept);
      v21 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        v29 = 136315650;
        v30 = "-[AFMyriadGoodnessScoreEvaluator _getRecentBump:ignoreAdjustedBoost:recentlyWonBySmallAmount:]";
        v31 = 2048;
        v32 = v19;
        v33 = 1024;
        *(_DWORD *)v34 = v20;
        _os_log_impl(&dword_19AF50000, v21, OS_LOG_TYPE_INFO, "%s #myriad trial exponential boost configured, replacing %f with %du", (uint8_t *)&v29, 0x1Cu);
      }
      v19 = (double)v20;
    }
    v22 = AFSiriLogContextConnection;
    if (v7 && v19 > v10)
    {
      v23 = 0.0;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        v29 = 136316162;
        v30 = "-[AFMyriadGoodnessScoreEvaluator _getRecentBump:ignoreAdjustedBoost:recentlyWonBySmallAmount:]";
        v31 = 2048;
        v32 = v16;
        v33 = 2048;
        *(double *)v34 = v10;
        *(_WORD *)&v34[8] = 2048;
        *(double *)&v34[10] = v10;
        *(_WORD *)&v34[18] = 2048;
        *(double *)&v34[20] = v19;
        _os_log_impl(&dword_19AF50000, v22, OS_LOG_TYPE_INFO, "%s #myriad previous close win: canceling recency bump from secsAgo=%f yields %f = %f(act) + %f(siri)", (uint8_t *)&v29, 0x34u);
        v22 = AFSiriLogContextConnection;
      }
    }
    else
    {
      v23 = v19;
    }
    if (v10 >= v23)
      v24 = v10;
    else
      v24 = v23;
    v6 = (int)v24;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v29 = 136316162;
      v30 = "-[AFMyriadGoodnessScoreEvaluator _getRecentBump:ignoreAdjustedBoost:recentlyWonBySmallAmount:]";
      v31 = 2048;
      v32 = v16;
      v33 = 1024;
      *(_DWORD *)v34 = v6;
      *(_WORD *)&v34[4] = 2048;
      *(double *)&v34[6] = v10;
      *(_WORD *)&v34[14] = 2048;
      *(double *)&v34[16] = v23;
      _os_log_impl(&dword_19AF50000, v22, OS_LOG_TYPE_INFO, "%s #myriad bumptoGoodness secsAgo=%f yields %d = %f(act) + %f(siri)", (uint8_t *)&v29, 0x30u);
    }
    if (+[AFFeatureFlags isMyriadSelfMetricsEnabled](AFFeatureFlags, "isMyriadSelfMetricsEnabled"))
    {
      myriadInstrumentation = self->_myriadInstrumentation;
      if (myriadInstrumentation)
      {
        if (v6)
        {
          if (v10 <= v23)
          {
            v26 = v23;
            v27 = 4;
          }
          else
          {
            v26 = v10;
            v27 = 2;
          }
          -[AFMyriadInstrumentation updateBoost:value:](myriadInstrumentation, "updateBoost:value:", v27, v26);
        }
      }
    }
  }
  return v6;
}

- (unsigned)getPlatformBias
{
  NSObject *v3;
  int myriadPlatformBias;
  AFMyriadInstrumentation *myriadInstrumentation;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    myriadPlatformBias = self->_myriadPlatformBias;
    v7 = 136315394;
    v8 = "-[AFMyriadGoodnessScoreEvaluator getPlatformBias]";
    v9 = 1024;
    v10 = myriadPlatformBias;
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s #myriad bumping goodness score (reason: platform bias, adjusted bias: %d)", (uint8_t *)&v7, 0x12u);
  }
  if (+[AFFeatureFlags isMyriadSelfMetricsEnabled](AFFeatureFlags, "isMyriadSelfMetricsEnabled"))
  {
    myriadInstrumentation = self->_myriadInstrumentation;
    if (myriadInstrumentation)
      -[AFMyriadInstrumentation updateBoost:value:](myriadInstrumentation, "updateBoost:value:", 1, self->_myriadPlatformBias);
  }
  return self->_myriadPlatformBias;
}

- (unsigned)_bumpGoodnessScore:(id)a3 lastActivationTime:(double)a4 mediaPlaybackInterruptedTime:(double)a5 ignoreAdjustedBoost:(BOOL)a6 recentlyWonBySmallAmount:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v12;
  void *v13;
  int mediaPlaybackBoost;
  unsigned __int8 v15;
  NSObject *v17;
  unsigned __int8 *p_mediaPlaybackBoost;
  uint64_t v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  AFMyriadInstrumentation *myriadInstrumentation;
  void *v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  _BYTE v29[24];
  uint64_t v30;
  uint64_t v31;

  v7 = a7;
  v8 = a6;
  v31 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = v12;
  if (!v12 || (objc_msgSend(v12, "containsObject:", &unk_1E3AA6DC0) & 1) != 0)
  {
LABEL_3:
    LOBYTE(mediaPlaybackBoost) = 0;
    goto LABEL_4;
  }
  if (objc_msgSend(v13, "containsObject:", &unk_1E3AA6DD8))
  {
    v17 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v29 = 136315138;
      *(_QWORD *)&v29[4] = "-[AFMyriadGoodnessScoreEvaluator _bumpGoodnessScore:lastActivationTime:mediaPlaybackInterrupt"
                           "edTime:ignoreAdjustedBoost:recentlyWonBySmallAmount:]";
      _os_log_impl(&dword_19AF50000, v17, OS_LOG_TYPE_INFO, "%s #myriad alarm/timer bumping is no longer allowed", v29, 0xCu);
    }
  }
  if (objc_msgSend(v13, "containsObject:", &unk_1E3AA6DF0))
  {
    if (AFIsHorseman_onceToken != -1)
      dispatch_once(&AFIsHorseman_onceToken, &__block_literal_global_139_40146);
    if (!AFIsHorseman_isHorseman)
      goto LABEL_3;
    p_mediaPlaybackBoost = &self->_mediaPlaybackBoost;
    mediaPlaybackBoost = self->_mediaPlaybackBoost;
    v19 = AFSiriLogContextConnection;
    if (!os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      goto LABEL_15;
    *(_DWORD *)v29 = 136315394;
    *(_QWORD *)&v29[4] = "-[AFMyriadGoodnessScoreEvaluator _bumpGoodnessScore:lastActivationTime:mediaPlaybackInterrupted"
                         "Time:ignoreAdjustedBoost:recentlyWonBySmallAmount:]";
    *(_WORD *)&v29[12] = 1024;
    *(_DWORD *)&v29[14] = mediaPlaybackBoost;
    v20 = "%s #myriad bumping goodness score (reason: media playback active, adjusted score: %d)";
    v21 = v19;
    v22 = 18;
    goto LABEL_14;
  }
  if (!objc_msgSend(v13, "containsObject:", &unk_1E3AA6E08))
    goto LABEL_3;
  if (AFIsHorseman_onceToken != -1)
    dispatch_once(&AFIsHorseman_onceToken, &__block_literal_global_139_40146);
  if (!AFIsHorseman_isHorseman)
    goto LABEL_3;
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "systemUptime");
  v26 = v25;

  LOBYTE(mediaPlaybackBoost) = 0;
  if (v26 > a5)
  {
    v27 = v26 - a5;
    if (v27 <= 60.0)
    {
      p_mediaPlaybackBoost = &self->_mediaPlaybackBoost;
      mediaPlaybackBoost = self->_mediaPlaybackBoost;
      v28 = AFSiriLogContextConnection;
      if (!os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
        goto LABEL_15;
      *(_DWORD *)v29 = 136315650;
      *(_QWORD *)&v29[4] = "-[AFMyriadGoodnessScoreEvaluator _bumpGoodnessScore:lastActivationTime:mediaPlaybackInterrupt"
                           "edTime:ignoreAdjustedBoost:recentlyWonBySmallAmount:]";
      *(_WORD *)&v29[12] = 2048;
      *(double *)&v29[14] = v27;
      *(_WORD *)&v29[22] = 1024;
      LODWORD(v30) = mediaPlaybackBoost;
      v20 = "%s #myriad bumping goodness score (reason: media playback interrupted, last playback time: %f seconds ago, a"
            "djusted score: %d)";
      v21 = v28;
      v22 = 28;
LABEL_14:
      _os_log_impl(&dword_19AF50000, v21, OS_LOG_TYPE_INFO, v20, v29, v22);
LABEL_15:
      if (+[AFFeatureFlags isMyriadSelfMetricsEnabled](AFFeatureFlags, "isMyriadSelfMetricsEnabled", *(_OWORD *)v29, *(_QWORD *)&v29[16], v30))
      {
        myriadInstrumentation = self->_myriadInstrumentation;
        if (myriadInstrumentation)
          -[AFMyriadInstrumentation updateBoost:value:](myriadInstrumentation, "updateBoost:value:", 6, *p_mediaPlaybackBoost);
      }
    }
  }
LABEL_4:
  v15 = -[AFMyriadGoodnessScoreEvaluator _getRecentBump:ignoreAdjustedBoost:recentlyWonBySmallAmount:](self, "_getRecentBump:ignoreAdjustedBoost:recentlyWonBySmallAmount:", v8, v7, a4);

  return v15 + mediaPlaybackBoost;
}

- (void)_updatePlatformBias:(unsigned __int8)a3
{
  int v3;
  os_unfair_lock_s *p_scoreEvaluationLock;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  p_scoreEvaluationLock = &self->_scoreEvaluationLock;
  os_unfair_lock_lock(&self->_scoreEvaluationLock);
  self->_myriadPlatformBias = v3;
  os_unfair_lock_unlock(p_scoreEvaluationLock);
  v6 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v7 = 136315394;
    v8 = "-[AFMyriadGoodnessScoreEvaluator _updatePlatformBias:]";
    v9 = 1024;
    v10 = v3;
    _os_log_impl(&dword_19AF50000, v6, OS_LOG_TYPE_INFO, "%s #myriad updated platform bias to %d", (uint8_t *)&v7, 0x12u);
  }
}

- (void)_updateMediaPlaybackBoost:(unsigned __int8)a3
{
  os_unfair_lock_s *p_scoreEvaluationLock;
  NSObject *v6;
  int mediaPlaybackBoost;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  p_scoreEvaluationLock = &self->_scoreEvaluationLock;
  os_unfair_lock_lock(&self->_scoreEvaluationLock);
  self->_mediaPlaybackBoost = a3;
  os_unfair_lock_unlock(p_scoreEvaluationLock);
  v6 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    mediaPlaybackBoost = self->_mediaPlaybackBoost;
    v8 = 136315394;
    v9 = "-[AFMyriadGoodnessScoreEvaluator _updateMediaPlaybackBoost:]";
    v10 = 1024;
    v11 = mediaPlaybackBoost;
    _os_log_impl(&dword_19AF50000, v6, OS_LOG_TYPE_INFO, "%s #myriad updated _mediaPlaybackBoost to %d", (uint8_t *)&v8, 0x12u);
  }
}

- (void)_updateRecentSiriBoostTrialEnabled:(BOOL)a3
{
  os_unfair_lock_s *p_scoreEvaluationLock;
  NSObject *v6;
  const __CFString *v7;
  int v8;
  const char *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  p_scoreEvaluationLock = &self->_scoreEvaluationLock;
  os_unfair_lock_lock(&self->_scoreEvaluationLock);
  self->_isRecentSiriBoostTrialEnabled = a3;
  os_unfair_lock_unlock(p_scoreEvaluationLock);
  v6 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v7 = CFSTR("YES");
    if (!self->_isRecentSiriBoostTrialEnabled)
      v7 = CFSTR("NO");
    v8 = 136315394;
    v9 = "-[AFMyriadGoodnessScoreEvaluator _updateRecentSiriBoostTrialEnabled:]";
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_19AF50000, v6, OS_LOG_TYPE_INFO, "%s #myriad updated _isRecentSiriBoostTrialEnabled to %@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)_updateRecentSiriExponentialBoostDefined:(BOOL)a3 withSecondDegree:(double)a4 andFirstDegree:(double)a5 andIntercept:(double)a6
{
  os_unfair_lock_s *p_scoreEvaluationLock;
  NSObject *v12;
  _BOOL4 isExponentialBoostDefined;
  double recentSiriSecondDegreeCoefficient;
  double recentSiriFirstDegreeCoefficient;
  double recentSiriIntercept;
  int v17;
  const char *v18;
  __int16 v19;
  _BOOL4 v20;
  __int16 v21;
  double v22;
  __int16 v23;
  double v24;
  __int16 v25;
  double v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  p_scoreEvaluationLock = &self->_scoreEvaluationLock;
  os_unfair_lock_lock(&self->_scoreEvaluationLock);
  self->_isExponentialBoostDefined = a3;
  self->_recentSiriSecondDegreeCoefficient = a4;
  self->_recentSiriFirstDegreeCoefficient = a5;
  self->_recentSiriIntercept = a6;
  os_unfair_lock_unlock(p_scoreEvaluationLock);
  v12 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    isExponentialBoostDefined = self->_isExponentialBoostDefined;
    recentSiriSecondDegreeCoefficient = self->_recentSiriSecondDegreeCoefficient;
    recentSiriFirstDegreeCoefficient = self->_recentSiriFirstDegreeCoefficient;
    recentSiriIntercept = self->_recentSiriIntercept;
    v17 = 136316162;
    v18 = "-[AFMyriadGoodnessScoreEvaluator _updateRecentSiriExponentialBoostDefined:withSecondDegree:andFirstDegree:andIntercept:]";
    v19 = 1024;
    v20 = isExponentialBoostDefined;
    v21 = 2048;
    v22 = recentSiriSecondDegreeCoefficient;
    v23 = 2048;
    v24 = recentSiriFirstDegreeCoefficient;
    v25 = 2048;
    v26 = recentSiriIntercept;
    _os_log_impl(&dword_19AF50000, v12, OS_LOG_TYPE_INFO, "%s #myriad updated Trial recent Siri exponential boost to %du %.12f %.12f %.12f", (uint8_t *)&v17, 0x30u);
  }
}

- (void)_updateSidekickBoosts:(id)a3
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315138;
    v5 = "-[AFMyriadGoodnessScoreEvaluator _updateSidekickBoosts:]";
    _os_log_error_impl(&dword_19AF50000, v3, OS_LOG_TYPE_ERROR, "%s #myriad Error updating sidekick boosts: unsupported platform", (uint8_t *)&v4, 0xCu);
  }
}

- (id)_createSettingsConnectionIfRequired
{
  AFSettingsConnection *settingsConnection;
  AFSettingsConnection *v4;
  AFSettingsConnection *v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  settingsConnection = self->_settingsConnection;
  if (!settingsConnection)
  {
    v4 = -[AFSettingsConnection initWithInstanceContext:]([AFSettingsConnection alloc], "initWithInstanceContext:", self->_deviceInstanceContext);
    v5 = self->_settingsConnection;
    self->_settingsConnection = v4;

    -[AFSettingsConnection setXPCConnectionManagementQueue:](self->_settingsConnection, "setXPCConnectionManagementQueue:", self->_queue);
    -[AFSettingsConnection _setDelegate:](self->_settingsConnection, "_setDelegate:", self);
    settingsConnection = self->_settingsConnection;
  }
  return settingsConnection;
}

- (void)_fetchDevicePlatformBiasIfRequired
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_platformBiasAcquisitionState != 2)
  {
    if (AFIsHorseman_onceToken != -1)
      dispatch_once(&AFIsHorseman_onceToken, &__block_literal_global_139_40146);
    if (AFIsHorseman_isHorseman)
      -[AFMyriadGoodnessScoreEvaluator _updatePlatformBias:](self, "_updatePlatformBias:", 40);
    self->_platformBiasAcquisitionState = 2;
  }
}

- (id)_readSidekickBoostsFile:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "fileExistsAtPath:", v3) & 1) == 0)
    {
      v11 = AFSiriLogContextDaemon;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v20 = "-[AFMyriadGoodnessScoreEvaluator _readSidekickBoostsFile:]";
        v21 = 2112;
        v22 = v3;
        _os_log_error_impl(&dword_19AF50000, v11, OS_LOG_TYPE_ERROR, "%s Unable to find sidekick boosts plist at path %@.", buf, 0x16u);
      }
      v10 = 0;
      goto LABEL_23;
    }
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:", v3);
    if (!v5)
    {
      v12 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v20 = "-[AFMyriadGoodnessScoreEvaluator _readSidekickBoostsFile:]";
        v21 = 2112;
        v22 = v3;
        _os_log_error_impl(&dword_19AF50000, v12, OS_LOG_TYPE_ERROR, "%s Unable to read sidekick boosts plist file at path %@.", buf, 0x16u);
      }
      v10 = 0;
      goto LABEL_22;
    }
    v18 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v5, 0, 0, &v18);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v18;
    if (v7)
    {
      v8 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v20 = "-[AFMyriadGoodnessScoreEvaluator _readSidekickBoostsFile:]";
        v21 = 2112;
        v22 = v3;
        v23 = 2112;
        v24 = v7;
        _os_log_error_impl(&dword_19AF50000, v8, OS_LOG_TYPE_ERROR, "%s Unable to initialize sidekick boosts from plist file at path %@ due to error %@", buf, 0x20u);
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = v6;
LABEL_21:

LABEL_22:
LABEL_23:

        goto LABEL_24;
      }
      v13 = (void *)AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        v15 = v13;
        v16 = (objc_class *)objc_opt_class();
        NSStringFromClass(v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v20 = "-[AFMyriadGoodnessScoreEvaluator _readSidekickBoostsFile:]";
        v21 = 2112;
        v22 = v17;
        _os_log_error_impl(&dword_19AF50000, v15, OS_LOG_TYPE_ERROR, "%s Unexpected type of initialized sidekick boosts plist %@.", buf, 0x16u);

      }
    }
    v10 = 0;
    goto LABEL_21;
  }
  v9 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[AFMyriadGoodnessScoreEvaluator _readSidekickBoostsFile:]";
    _os_log_error_impl(&dword_19AF50000, v9, OS_LOG_TYPE_ERROR, "%s _readSidekickBoostsFile: called with empty filepath", buf, 0xCu);
  }
  v10 = 0;
LABEL_24:

  return v10;
}

- (unint64_t)_findSidekickBoost:(id)a3 isSpeaker:(BOOL)a4 model:(id)a5
{
  return 0;
}

- (void)_reloadTrialConfiguredBoostValues
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  id location;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  AFSettingsConnection *v14;
  _QWORD v15[5];
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (+[AFFeatureFlags isSCDATrialEnabled](AFFeatureFlags, "isSCDATrialEnabled"))
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x3032000000;
    v12 = __Block_byref_object_copy__27003;
    v13 = __Block_byref_object_dispose__27004;
    v14 = -[AFSettingsConnection initWithInstanceContext:]([AFSettingsConnection alloc], "initWithInstanceContext:", self->_deviceInstanceContext);
    objc_msgSend((id)v10[5], "setXPCConnectionManagementQueue:", self->_queue);
    objc_initWeak(&location, self);
    v3 = (void *)v10[5];
    v16[0] = CFSTR("RECENT_SIRI_BOOST_TRIAL_ENABLE");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = CFSTR("RECENT_PLAYBACK_BOOST");
    v15[1] = CFSTR("HOMEPOD_BOOST");
    v15[2] = CFSTR("RECENT_SIRI_BOOST_SECOND_DEGREE_COEFF");
    v15[3] = CFSTR("RECENT_SIRI_BOOST_FIRST_DEGREE_COEFF");
    v15[4] = CFSTR("RECENT_SIRI_BOOST_INTERCEPT");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __67__AFMyriadGoodnessScoreEvaluator__reloadTrialConfiguredBoostValues__block_invoke;
    v6[3] = &unk_1E3A32D80;
    objc_copyWeak(&v7, &location);
    v6[4] = &v9;
    objc_msgSend(v3, "getTrialEnables:doubleFactors:withCompletion:", v4, v5, v6);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
    _Block_object_dispose(&v9, 8);

  }
}

- (void)preheat
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__AFMyriadGoodnessScoreEvaluator_preheat__block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(queue, block);
}

- (unsigned)getMyriadAdjustedBoostForGoodnessScoreContext:(id)a3
{
  id v4;
  NSObject *v5;
  os_unfair_lock_s *p_scoreEvaluationLock;
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  unsigned int v10;
  void *v11;
  double lastActivationTime;
  double v13;
  NSObject *v14;
  NSObject *v15;
  unsigned __int8 v16;
  int v18;
  const char *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v18 = 136315138;
    v19 = "-[AFMyriadGoodnessScoreEvaluator getMyriadAdjustedBoostForGoodnessScoreContext:]";
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s #myriad", (uint8_t *)&v18, 0xCu);
  }
  p_scoreEvaluationLock = &self->_scoreEvaluationLock;
  os_unfair_lock_lock(&self->_scoreEvaluationLock);
  v7 = -[AFPreferences myriadShouldIgnoreAdjustedBoost](self->_pref, "myriadShouldIgnoreAdjustedBoost");
  v8 = -[AFPreferences ignoreMyriadPlatformBias](self->_pref, "ignoreMyriadPlatformBias");
  v9 = v8;
  if (v7 && v8)
  {
    v10 = 0;
  }
  else if (v7)
  {
    v10 = -[AFMyriadGoodnessScoreEvaluator getPlatformBias](self, "getPlatformBias");
  }
  else
  {
    objc_msgSend(v4, "reasons");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    lastActivationTime = self->_lastActivationTime;
    objc_msgSend(v4, "mediaPlaybackInterruptedTime");
    v10 = -[AFMyriadGoodnessScoreEvaluator _bumpGoodnessScore:lastActivationTime:mediaPlaybackInterruptedTime:ignoreAdjustedBoost:recentlyWonBySmallAmount:](self, "_bumpGoodnessScore:lastActivationTime:mediaPlaybackInterruptedTime:ignoreAdjustedBoost:recentlyWonBySmallAmount:", v11, 0, objc_msgSend(v4, "recentlyWonBySmallAmount"), lastActivationTime, v13);

    if (!v9)
    {
      v14 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        v18 = 136315394;
        v19 = "-[AFMyriadGoodnessScoreEvaluator getMyriadAdjustedBoostForGoodnessScoreContext:]";
        v20 = 2048;
        v21 = 0;
        _os_log_impl(&dword_19AF50000, v14, OS_LOG_TYPE_INFO, "%s #myriad payload adjusted score: %ld", (uint8_t *)&v18, 0x16u);
      }
      v10 += -[AFMyriadGoodnessScoreEvaluator getPlatformBias](self, "getPlatformBias");
    }
  }
  v15 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v18 = 136315394;
    v19 = "-[AFMyriadGoodnessScoreEvaluator getMyriadAdjustedBoostForGoodnessScoreContext:]";
    v20 = 2048;
    v21 = v10;
    _os_log_impl(&dword_19AF50000, v15, OS_LOG_TYPE_INFO, "%s #myriad adjusted score: %ld", (uint8_t *)&v18, 0x16u);
  }
  if (v10 >= 0xFF)
    v16 = -1;
  else
    v16 = v10;
  os_unfair_lock_unlock(p_scoreEvaluationLock);

  return v16;
}

- (void)_settingsConnectionDidDisconnect
{
  NSObject *queue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66__AFMyriadGoodnessScoreEvaluator__settingsConnectionDidDisconnect__block_invoke;
  v4[3] = &unk_1E3A35AE0;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (BOOL)evaluateForAudioAccessory
{
  return self->_evaluateForAudioAccessory;
}

- (double)lastActivationTime
{
  return self->_lastActivationTime;
}

- (void)setLastActivationTime:(double)a3
{
  self->_lastActivationTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpointModelName, 0);
  objc_storeStrong((id *)&self->_myriadInstrumentation, 0);
  objc_storeStrong((id *)&self->_settingsConnection, 0);
  objc_storeStrong((id *)&self->_pref, 0);
  objc_storeStrong((id *)&self->_deviceInstanceContext, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __66__AFMyriadGoodnessScoreEvaluator__settingsConnectionDidDisconnect__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v3 = WeakRetained[7];
      v5 = 136315394;
      v6 = "-[AFMyriadGoodnessScoreEvaluator _settingsConnectionDidDisconnect]_block_invoke";
      v7 = 2048;
      v8 = v3;
      _os_log_impl(&dword_19AF50000, v2, OS_LOG_TYPE_INFO, "%s #myriad platform bias acquisition state: %ld", (uint8_t *)&v5, 0x16u);
    }
    if (WeakRetained[7] == 1)
    {
      WeakRetained[7] = 0;
      v4 = (void *)WeakRetained[9];
      WeakRetained[9] = 0;

    }
  }

}

uint64_t __41__AFMyriadGoodnessScoreEvaluator_preheat__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchDevicePlatformBiasIfRequired");
}

void __67__AFMyriadGoodnessScoreEvaluator__reloadTrialConfiguredBoostValues__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  uint64_t v27;
  double v28;
  double v29;
  NSObject *v30;
  void *v31;
  unsigned int v32;
  NSObject *v33;
  void *v34;
  void *v35;
  unsigned int v36;
  uint64_t v37;
  void *v38;
  NSObject *log;
  void *v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  id v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v9)
    {
      v11 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v42 = "-[AFMyriadGoodnessScoreEvaluator _reloadTrialConfiguredBoostValues]_block_invoke";
        v43 = 2112;
        v44 = v9;
        _os_log_debug_impl(&dword_19AF50000, v11, OS_LOG_TYPE_DEBUG, "%s #myriad Error loading Trial factors: %@", buf, 0x16u);
      }
    }
    else
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("RECENT_SIRI_BOOST_TRIAL_ENABLE"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "BOOLValue");
      if (v12)
      {
        objc_msgSend(WeakRetained, "_updateRecentSiriBoostTrialEnabled:", v13);
      }
      else
      {
        v14 = AFSiriLogContextConnection;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          v42 = "-[AFMyriadGoodnessScoreEvaluator _reloadTrialConfiguredBoostValues]_block_invoke";
          _os_log_debug_impl(&dword_19AF50000, v14, OS_LOG_TYPE_DEBUG, "%s #myriad Recent Siri Boost Trial Enable Not Loaded", buf, 0xCu);
        }
      }
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("RECENT_SIRI_BOOST_SECOND_DEGREE_COEFF"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("RECENT_SIRI_BOOST_FIRST_DEGREE_COEFF"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("RECENT_SIRI_BOOST_INTERCEPT"));
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v17;
      if (v15)
        v19 = v13;
      else
        v19 = 0;
      v40 = v16;
      if (v19 == 1 && v16 && v17)
      {
        objc_msgSend(v15, "doubleValue");
        v21 = v20;
        objc_msgSend(v16, "doubleValue");
        v23 = v22;
        objc_msgSend(v18, "doubleValue");
        v25 = v24;
        v26 = WeakRetained;
        v27 = 1;
        v28 = v21;
        v29 = v23;
      }
      else
      {
        v30 = AFSiriLogContextConnection;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315906;
          v42 = "-[AFMyriadGoodnessScoreEvaluator _reloadTrialConfiguredBoostValues]_block_invoke";
          v43 = 2112;
          v44 = v15;
          v45 = 2112;
          v46 = v40;
          v47 = 2112;
          v48 = v18;
          _os_log_debug_impl(&dword_19AF50000, v30, OS_LOG_TYPE_DEBUG, "%s #myriad Recent Siri exponential factors not loaded: %@ %@ %@", buf, 0x2Au);
        }
        v28 = 0.0;
        v29 = 0.0;
        v25 = 0.0;
        v26 = WeakRetained;
        v27 = 0;
      }
      objc_msgSend(v26, "_updateRecentSiriExponentialBoostDefined:withSecondDegree:andFirstDegree:andIntercept:", v27, v28, v29, v25);
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("RECENT_PLAYBACK_BOOST"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "unsignedIntValue");
      if (v31 && v32 <= 0xFF)
      {
        objc_msgSend(WeakRetained, "_updateMediaPlaybackBoost:", v32);
      }
      else
      {
        v33 = AFSiriLogContextConnection;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v42 = "-[AFMyriadGoodnessScoreEvaluator _reloadTrialConfiguredBoostValues]_block_invoke";
          v43 = 2112;
          v44 = v31;
          _os_log_debug_impl(&dword_19AF50000, v33, OS_LOG_TYPE_DEBUG, "%s #myriad Trial Playback Boost not loaded: %@", buf, 0x16u);
        }
      }
      if (AFIsHorseman_onceToken != -1)
        dispatch_once(&AFIsHorseman_onceToken, &__block_literal_global_139_40146);
      v34 = v40;
      if (AFIsHorseman_isHorseman)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("HOMEPOD_BOOST"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "unsignedIntValue");
        if (v35 && v36 <= 0xFF)
        {
          objc_msgSend(WeakRetained, "_updatePlatformBias:", v36);
        }
        else
        {
          log = AFSiriLogContextConnection;
          if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            v42 = "-[AFMyriadGoodnessScoreEvaluator _reloadTrialConfiguredBoostValues]_block_invoke";
            v43 = 2112;
            v44 = v35;
            _os_log_debug_impl(&dword_19AF50000, log, OS_LOG_TYPE_DEBUG, "%s #myriad Trial HomePod Boost not loaded: %@", buf, 0x16u);
          }
        }

        v34 = v40;
      }
      v37 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v38 = *(void **)(v37 + 40);
      *(_QWORD *)(v37 + 40) = 0;

    }
  }

}

uint64_t __59__AFMyriadGoodnessScoreEvaluator_myriadTrialBoostsUpdated___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextDaemon;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[AFMyriadGoodnessScoreEvaluator myriadTrialBoostsUpdated:]_block_invoke";
    _os_log_impl(&dword_19AF50000, v2, OS_LOG_TYPE_INFO, "%s Trial Boosts Updated Notification", (uint8_t *)&v4, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_reloadTrialConfiguredBoostValues");
}

uint64_t __98__AFMyriadGoodnessScoreEvaluator_initWithDeviceInstanceContext_preferences_queue_instrumentation___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_fetchDevicePlatformBiasIfRequired");
  return objc_msgSend(*(id *)(a1 + 32), "_reloadTrialConfiguredBoostValues");
}

@end
