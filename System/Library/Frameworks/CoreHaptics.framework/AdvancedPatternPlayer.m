@implementation AdvancedPatternPlayer

- (void)resetState
{
  self->_state = 0;
}

- (void)setRunning
{
  self->_state = 2;
}

- (void)setPaused
{
  self->_state = 1;
}

- (void)finishInit
{
  unint64_t v3;
  id WeakRetained;
  int v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id location;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = -[AVHapticSequence eventBehavior](self->_sequence, "eventBehavior");
  WeakRetained = objc_loadWeakRetained((id *)&self->super._engine);
  v5 = objc_msgSend(WeakRetained, "muteHapticsWhileRecordingAudio");

  v6 = 4;
  if (v5)
    v6 = 0;
  -[AVHapticSequence setEventBehavior:](self->_sequence, "setEventBehavior:", v6 | v3 & 0xFFFFFFFFFFFFFFFBLL);
  objc_initWeak(&location, self);
  if (kHAPIScope)
  {
    v7 = *(id *)kHAPIScope;
    if (!v7)
      goto LABEL_10;
  }
  else
  {
    v7 = MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v13 = "CHHapticAdvancedPatternPlayer.mm";
    v14 = 1024;
    v15 = 62;
    v16 = 2080;
    v17 = "-[AdvancedPatternPlayer finishInit]";
    _os_log_impl(&dword_1B573F000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Setting default completion handler on underlying AVHapticSequence", buf, 0x1Cu);
  }

LABEL_10:
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __35__AdvancedPatternPlayer_finishInit__block_invoke;
  v9[3] = &unk_1E695FEB0;
  objc_copyWeak(&v10, &location);
  -[AVHapticSequence setCompletionHandler:](self->_sequence, "setCompletionHandler:", v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __35__AdvancedPatternPlayer_finishInit__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  id v3;
  id v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (kHAPIScope)
  {
    v2 = *(id *)kHAPIScope;
    if (!v2)
      goto LABEL_8;
  }
  else
  {
    v2 = MEMORY[0x1E0C81028];
    v3 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v5 = 136315906;
    v6 = "CHHapticAdvancedPatternPlayer.mm";
    v7 = 1024;
    v8 = 65;
    v9 = 2080;
    v10 = "-[AdvancedPatternPlayer finishInit]_block_invoke";
    v11 = 2048;
    v12 = WeakRetained;
    _os_log_impl(&dword_1B573F000, v2, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Player %p default completion handler called", (uint8_t *)&v5, 0x26u);
  }

LABEL_8:
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_sync_enter(v4);
    objc_msgSend(v4, "setSeekOffset:", 0.0);
    objc_msgSend(v4, "resetState");
    objc_sync_exit(v4);

  }
}

- (AdvancedPatternPlayer)init
{

  return 0;
}

- (AdvancedPatternPlayer)initWithPattern:(id)a3 engine:(id)a4 privileged:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  AdvancedPatternPlayer *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSArray *events;
  AVHapticSequence *v22;
  NSArray *v23;
  void *v24;
  uint64_t v25;
  AVHapticSequence *sequence;
  uint64_t v27;
  NSString *patternID;
  double v29;
  id WeakRetained;
  void *v31;
  void *v32;
  BOOL v33;
  id v34;
  void *v35;
  NSObject *v36;
  NSObject *v37;
  os_signpost_id_t spid;
  void *v40;
  objc_super v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  int v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  AdvancedPatternPlayer *v49;
  uint64_t v50;

  v7 = a5;
  v50 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v41.receiver = self;
  v41.super_class = (Class)AdvancedPatternPlayer;
  v12 = -[AdvancedPatternPlayer init](&v41, sel_init);
  if (!v12)
    goto LABEL_28;
  CALog::Scope::oslog((id *)kHAPIScope);
  v13 = objc_claimAutoreleasedReturnValue();
  spid = os_signpost_id_make_with_pointer(v13, v12);

  CALog::Scope::oslog((id *)kHAPIScope);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B573F000, v15, OS_SIGNPOST_INTERVAL_BEGIN, spid, "AdvancedPatternPlayer_initWithPattern", " enableTelemetry=YES ", buf, 2u);
  }

  if (kHAPIScope)
  {
    v16 = *(id *)kHAPIScope;
    if (!v16)
      goto LABEL_12;
  }
  else
  {
    v16 = MEMORY[0x1E0C81028];
    v17 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    v43 = "CHHapticAdvancedPatternPlayer.mm";
    v44 = 1024;
    v45 = 87;
    v46 = 2080;
    v47 = "-[AdvancedPatternPlayer initWithPattern:engine:privileged:error:]";
    v48 = 2048;
    v49 = v12;
    _os_log_impl(&dword_1B573F000, v16, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Creating advanced player %p", buf, 0x26u);
  }

LABEL_12:
  objc_storeWeak((id *)&v12->super._engine, v11);
  v12->super._muteState = 0;
  v12->_state = 0;
  v12->_seekOffset = 0.0;
  v12->super._previousAction = 0;
  objc_msgSend(v10, "resolveExternalResources:error:", v11, a6);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v40)
  {

    if (a6)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), -4824, 0);
      v12 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
    goto LABEL_20;
  }
  objc_msgSend(v10, "parameters");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "parameterCurves");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[CHHapticPattern eventListFromEvents:parameters:parameterCurves:engine:privileged:](CHHapticPattern, "eventListFromEvents:parameters:parameterCurves:engine:privileged:", v40, v18, v19, v11, v7);
  v20 = objc_claimAutoreleasedReturnValue();
  events = v12->super._events;
  v12->super._events = (NSArray *)v20;

  if (!-[NSArray count](v12->super._events, "count"))
  {

LABEL_20:
    v12 = 0;
    goto LABEL_24;
  }
  v22 = [AVHapticSequence alloc];
  v23 = v12->super._events;
  objc_msgSend(v11, "player");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[AVHapticSequence initWithEvents:player:error:](v22, "initWithEvents:player:error:", v23, v24, a6);
  sequence = v12->_sequence;
  v12->_sequence = (AVHapticSequence *)v25;

  if (!v12->_sequence)
  {
    v34 = v12;
    v12 = 0;
    goto LABEL_22;
  }
  objc_msgSend(v10, "patternID");
  v27 = objc_claimAutoreleasedReturnValue();
  patternID = v12->super._patternID;
  v12->super._patternID = (NSString *)v27;

  -[AVHapticSequence duration](v12->_sequence, "duration");
  v12->super._patternDuration = v29;
  WeakRetained = objc_loadWeakRetained((id *)&v12->super._engine);
  objc_msgSend(WeakRetained, "metrics");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "handleInitForPlayer:events:isAdvanced:patternID:", v12, v12->super._events, 1, v12->super._patternID);

  objc_msgSend(v10, "parameterCurves");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "count") == 0;

  if (!v33)
  {
    v34 = objc_loadWeakRetained((id *)&v12->super._engine);
    objc_msgSend(v34, "metrics");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleParamCurveEncountered");

LABEL_22:
  }
  -[AdvancedPatternPlayer patternDuration](v12, "patternDuration");
  -[AdvancedPatternPlayer setLoopEnd:](v12, "setLoopEnd:");
  -[AdvancedPatternPlayer finishInit](v12, "finishInit");
LABEL_24:
  CALog::Scope::oslog((id *)kHAPIScope);
  v36 = objc_claimAutoreleasedReturnValue();
  v37 = v36;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B573F000, v37, OS_SIGNPOST_INTERVAL_END, spid, "AdvancedPatternPlayer_initWithPattern", (const char *)&unk_1B57A456E, buf, 2u);
  }

LABEL_28:
  return v12;
}

- (void)dealloc
{
  NSObject *v3;
  id v4;
  id WeakRetained;
  objc_super v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  AdvancedPatternPlayer *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (kHAPIScope)
  {
    v3 = *(id *)kHAPIScope;
    if (!v3)
      goto LABEL_8;
  }
  else
  {
    v3 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    v8 = "CHHapticAdvancedPatternPlayer.mm";
    v9 = 1024;
    v10 = 134;
    v11 = 2080;
    v12 = "-[AdvancedPatternPlayer dealloc]";
    v13 = 2048;
    v14 = self;
    _os_log_impl(&dword_1B573F000, v3, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Destroying advanced player %p", buf, 0x26u);
  }

LABEL_8:
  WeakRetained = objc_loadWeakRetained((id *)&self->super._engine);
  -[AdvancedPatternPlayer clearExternalResources:](self, "clearExternalResources:", WeakRetained);

  v6.receiver = self;
  v6.super_class = (Class)AdvancedPatternPlayer;
  -[AdvancedPatternPlayer dealloc](&v6, sel_dealloc);
}

- (void)doSetMute:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  double v6;
  id v7;
  const char *v8;
  float v9;
  double v10;
  _BYTE v11[38];
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  if (kHAPIScope)
  {
    v5 = *(id *)kHAPIScope;
    if (!v5)
      goto LABEL_10;
  }
  else
  {
    v5 = MEMORY[0x1E0C81028];
    v7 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v8 = "un";
    *(_DWORD *)v11 = 136316162;
    *(_QWORD *)&v11[4] = "CHHapticAdvancedPatternPlayer.mm";
    *(_WORD *)&v11[12] = 1024;
    *(_DWORD *)&v11[14] = 140;
    *(_QWORD *)&v11[20] = "-[AdvancedPatternPlayer doSetMute:]";
    *(_WORD *)&v11[18] = 2080;
    if (v3)
      v8 = "";
    *(_WORD *)&v11[28] = 2048;
    *(_QWORD *)&v11[30] = self;
    v12 = 2080;
    v13 = v8;
    _os_log_impl(&dword_1B573F000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Advanced player %p: Sending %smute params", v11, 0x30u);
  }

LABEL_10:
  if (v3)
    v9 = 1.0;
  else
    v9 = 0.0;
  *(float *)&v6 = v9;
  -[AVHapticSequence setParameter:value:channel:atTime:error:](self->_sequence, "setParameter:value:channel:atTime:error:", 1014, 0, 0, v6, 0.0, *(_OWORD *)v11, *(_OWORD *)&v11[16]);
  *(float *)&v10 = v9;
  -[AVHapticSequence setParameter:value:channel:atTime:error:](self->_sequence, "setParameter:value:channel:atTime:error:", 2014, 0, 0, v10, 0.0);
  -[AVHapticSequence setIsMuted:](self->_sequence, "setIsMuted:", v3);
}

- (void)clearExternalResources:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  unint64_t i;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (kHAPIScope)
  {
    if ((*(_BYTE *)(kHAPIScope + 8) & 1) != 0)
    {
      v5 = *(id *)kHAPIScope;
      if (v5)
      {
        v6 = v5;
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          v13 = "CHHapticAdvancedPatternPlayer.mm";
          v14 = 1024;
          v15 = 149;
          v16 = 2080;
          v17 = "-[AdvancedPatternPlayer clearExternalResources:]";
          _os_log_impl(&dword_1B573F000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Clearing any externally-registered audio resources", buf, 0x1Cu);
        }

      }
    }
  }
  for (i = 0; i < -[NSArray count](self->super._events, "count"); ++i)
  {
    -[NSArray objectAtIndexedSubscript:](self->super._events, "objectAtIndexedSubscript:", i);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[CHHapticEngine resourceIsRegistered:](CHHapticEngine, "resourceIsRegistered:", objc_msgSend(v8, "eventType")))
    {
      v9 = objc_msgSend(v8, "eventType");
      objc_msgSend(v4, "player");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 0;
      +[CHHapticEngine doUnregisterAudioResource:fromPattern:player:error:](CHHapticEngine, "doUnregisterAudioResource:fromPattern:player:error:", v9, 1, v10, &v11);

    }
  }

}

- (BOOL)doStartFromStoppedAtTime:(double)a3 error:(id *)a4
{
  void *v7;
  char v8;
  int muteState;
  _BOOL4 v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  AVHapticSequence *sequence;
  double v15;
  void *v16;
  char v17;
  id WeakRetained;
  void *v19;
  void *v20;
  int v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  -[PatternPlayerBase engine](self, "engine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "checkEngineStateOnStart:", a4);

  if ((v8 & 1) == 0)
    return 0;
  muteState = self->super._muteState;
  if ((muteState - 1) <= 1)
  {
    v10 = muteState == 2;
    -[AdvancedPatternPlayer doSetMute:](self, "doSetMute:", muteState == 2);
    self->super._muteState = newStateFromOld(self->super._muteState, v10, 1);
  }
  if (kHAPIScope)
  {
    if ((*(_BYTE *)(kHAPIScope + 8) & 1) != 0)
    {
      v11 = *(id *)kHAPIScope;
      if (v11)
      {
        v12 = v11;
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          -[AdvancedPatternPlayer seekOffset](self, "seekOffset");
          v22 = 136315906;
          v23 = "CHHapticAdvancedPatternPlayer.mm";
          v24 = 1024;
          v25 = 172;
          v26 = 2080;
          v27 = "-[AdvancedPatternPlayer doStartFromStoppedAtTime:error:]";
          v28 = 2048;
          v29 = v13;
          _os_log_impl(&dword_1B573F000, v12, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Starting sequence with offset %.3f", (uint8_t *)&v22, 0x26u);
        }

      }
    }
  }
  sequence = self->_sequence;
  -[AdvancedPatternPlayer seekOffset](self, "seekOffset");
  if (!-[AVHapticSequence playAtTime:offset:error:](sequence, "playAtTime:offset:error:", a4, a3, v15))
    return 0;
  -[AdvancedPatternPlayer setRunning](self, "setRunning");
  self->_seekOffset = 0.0;
  -[PatternPlayerBase engine](self, "engine");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "notifyPlayerStarted:atTime:", self, a3);

  WeakRetained = objc_loadWeakRetained((id *)&self->super._engine);
  objc_msgSend(WeakRetained, "metrics");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PatternPlayerBase patternID](self, "patternID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleStartForPlayer:time:isAdvanced:patternID:", self, 1, v20, a3);

  return v17;
}

- (BOOL)doStartFromPausedAtTime:(double)a3 error:(id *)a4
{
  id v7;
  NSObject *v8;
  uint64_t v9;
  AVHapticSequence *sequence;
  double v11;
  _BOOL4 v12;
  id WeakRetained;
  void *v14;
  int v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (kHAPIScope)
  {
    if ((*(_BYTE *)(kHAPIScope + 8) & 1) != 0)
    {
      v7 = *(id *)kHAPIScope;
      if (v7)
      {
        v8 = v7;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          -[AdvancedPatternPlayer seekOffset](self, "seekOffset");
          v16 = 136315906;
          v17 = "CHHapticAdvancedPatternPlayer.mm";
          v18 = 1024;
          v19 = 185;
          v20 = 2080;
          v21 = "-[AdvancedPatternPlayer doStartFromPausedAtTime:error:]";
          v22 = 2048;
          v23 = v9;
          _os_log_impl(&dword_1B573F000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Restarting paused sequence with offset %.3f", (uint8_t *)&v16, 0x26u);
        }

      }
    }
  }
  if (!-[AdvancedPatternPlayer paused](self, "paused"))
    -[AdvancedPatternPlayer doStartFromPausedAtTime:error:].cold.1();
  sequence = self->_sequence;
  -[AdvancedPatternPlayer seekOffset](self, "seekOffset");
  v12 = -[AVHapticSequence playAtTime:offset:error:](sequence, "playAtTime:offset:error:", a4, a3, v11);
  if (v12)
  {
    -[AdvancedPatternPlayer setRunning](self, "setRunning");
    WeakRetained = objc_loadWeakRetained((id *)&self->super._engine);
    objc_msgSend(WeakRetained, "metrics");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleActionForPlayer:action:time:isAdvanced:", self, 2, 1, a3);

  }
  return v12;
}

- (BOOL)doResumeAtTime:(double)a3 error:(id *)a4
{
  double v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  AVHapticSequence *sequence;
  _BOOL4 v12;
  id WeakRetained;
  void *v14;
  int v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!-[AdvancedPatternPlayer paused](self, "paused"))
    -[AdvancedPatternPlayer doResumeAtTime:error:].cold.1();
  -[AdvancedPatternPlayer seekOffset](self, "seekOffset");
  if (v7 == 0.0)
    goto LABEL_10;
  if (kHAPIScope)
  {
    if ((*(_BYTE *)(kHAPIScope + 8) & 1) != 0)
    {
      v8 = *(id *)kHAPIScope;
      if (v8)
      {
        v9 = v8;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          -[AdvancedPatternPlayer seekOffset](self, "seekOffset");
          v16 = 136315906;
          v17 = "CHHapticAdvancedPatternPlayer.mm";
          v18 = 1024;
          v19 = 200;
          v20 = 2080;
          v21 = "-[AdvancedPatternPlayer doResumeAtTime:error:]";
          v22 = 2048;
          v23 = v10;
          _os_log_impl(&dword_1B573F000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Resuming paused sequence with offset %.3f", (uint8_t *)&v16, 0x26u);
        }

      }
    }
  }
  sequence = self->_sequence;
  -[AdvancedPatternPlayer seekOffset](self, "seekOffset");
  v12 = -[AVHapticSequence seekToTime:error:](sequence, "seekToTime:error:", a4);
  if (v12)
  {
LABEL_10:
    v12 = -[AVHapticSequence resumeAtTime:error:](self->_sequence, "resumeAtTime:error:", a4, a3);
    if (v12)
    {
      -[AdvancedPatternPlayer setRunning](self, "setRunning");
      WeakRetained = objc_loadWeakRetained((id *)&self->super._engine);
      objc_msgSend(WeakRetained, "metrics");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleActionForPlayer:action:time:isAdvanced:", self, 2, 1, a3);

      LOBYTE(v12) = 1;
    }
  }
  return v12;
}

- (BOOL)startAtTime:(double)a3 error:(id *)a4
{
  NSObject *v7;
  id v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  AdvancedPatternPlayer *v13;
  BOOL v14;
  BOOL v15;
  NSObject *v16;
  NSObject *v17;
  int v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  AdvancedPatternPlayer *v26;
  __int16 v27;
  double v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (kHAPIScope)
  {
    v7 = *(id *)kHAPIScope;
    if (!v7)
      goto LABEL_8;
  }
  else
  {
    v7 = MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v19 = 136316162;
    v20 = "CHHapticAdvancedPatternPlayer.mm";
    v21 = 1024;
    v22 = 218;
    v23 = 2080;
    v24 = "-[AdvancedPatternPlayer startAtTime:error:]";
    v25 = 2048;
    v26 = self;
    v27 = 2048;
    v28 = a3;
    _os_log_impl(&dword_1B573F000, v7, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Starting player %p at time %.3f", (uint8_t *)&v19, 0x30u);
  }

LABEL_8:
  if (a3 < 0.0)
  {
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/CHHapticAdvancedPatternPlayer.mm", 219, "-[AdvancedPatternPlayer startAtTime:error:]", "time >= 0.0", -4840, a4);
    return 0;
  }
  if (!self->_sequence)
  {
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/CHHapticAdvancedPatternPlayer.mm", 220, "-[AdvancedPatternPlayer startAtTime:error:]", "_sequence != nil", -4812, a4);
    return 0;
  }
  CALog::Scope::oslog((id *)kHAPIScope);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_make_with_pointer(v9, self);

  CALog::Scope::oslog((id *)kHAPIScope);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LOWORD(v19) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B573F000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "AdvancedPatternPlayer_startAtTime", " enableTelemetry=YES ", (uint8_t *)&v19, 2u);
  }

  v13 = self;
  objc_sync_enter(v13);
  if (-[PatternPlayerBase needsResetForAction:](v13, "needsResetForAction:", 2)
    && !-[AVHapticSequence resetAtTime:error:](self->_sequence, "resetAtTime:error:", a4, a3))
  {
    v15 = 0;
  }
  else
  {
    if (-[AdvancedPatternPlayer paused](v13, "paused"))
      v14 = -[AdvancedPatternPlayer doStartFromPausedAtTime:error:](v13, "doStartFromPausedAtTime:error:", a4, a3);
    else
      v14 = -[AdvancedPatternPlayer doStartFromStoppedAtTime:error:](v13, "doStartFromStoppedAtTime:error:", a4, a3);
    v15 = v14;
  }
  objc_sync_exit(v13);

  CALog::Scope::oslog((id *)kHAPIScope);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v10 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v16))
  {
    LOWORD(v19) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B573F000, v17, OS_SIGNPOST_INTERVAL_END, v10, "AdvancedPatternPlayer_startAtTime", (const char *)&unk_1B57A456E, (uint8_t *)&v19, 2u);
  }

  return v15;
}

- (BOOL)stopAtTime:(double)a3 error:(id *)a4
{
  NSObject *v7;
  id v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  unint64_t v13;
  AdvancedPatternPlayer *v14;
  id WeakRetained;
  char v16;
  _BOOL4 v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  int v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  AdvancedPatternPlayer *v33;
  __int16 v34;
  double v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (kHAPIScope)
  {
    v7 = *(id *)kHAPIScope;
    if (!v7)
      goto LABEL_8;
  }
  else
  {
    v7 = MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v26 = 136316162;
    v27 = "CHHapticAdvancedPatternPlayer.mm";
    v28 = 1024;
    v29 = 238;
    v30 = 2080;
    v31 = "-[AdvancedPatternPlayer stopAtTime:error:]";
    v32 = 2048;
    v33 = self;
    v34 = 2048;
    v35 = a3;
    _os_log_impl(&dword_1B573F000, v7, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Stopping player %p at time %.3f", (uint8_t *)&v26, 0x30u);
  }

LABEL_8:
  if (a3 < 0.0)
  {
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/CHHapticAdvancedPatternPlayer.mm", 239, "-[AdvancedPatternPlayer stopAtTime:error:]", "time >= 0.0", -4840, a4);
LABEL_26:
    LOBYTE(v17) = 0;
    return v17;
  }
  if (!self->_sequence)
  {
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/CHHapticAdvancedPatternPlayer.mm", 240, "-[AdvancedPatternPlayer stopAtTime:error:]", "_sequence != nil", -4812, a4);
    goto LABEL_26;
  }
  CALog::Scope::oslog((id *)kHAPIScope);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_make_with_pointer(v9, self);

  CALog::Scope::oslog((id *)kHAPIScope);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  v13 = v10 - 1;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LOWORD(v26) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B573F000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "AdvancedPatternPlayer_stopAtTime", " enableTelemetry=YES ", (uint8_t *)&v26, 2u);
  }

  v14 = self;
  objc_sync_enter(v14);
  WeakRetained = objc_loadWeakRetained((id *)&v14->super._engine);
  v16 = objc_msgSend(WeakRetained, "checkEngineRunning:", a4);

  if ((v16 & 1) == 0)
  {
    CALog::Scope::oslog((id *)kHAPIScope);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v13 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      LOWORD(v26) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B573F000, v24, OS_SIGNPOST_INTERVAL_END, v10, "AdvancedPatternPlayer_stopAtTime", (const char *)&unk_1B57A456E, (uint8_t *)&v26, 2u);
    }

    objc_sync_exit(v14);
    goto LABEL_26;
  }
  v17 = -[AVHapticSequence stopAtTime:error:](self->_sequence, "stopAtTime:error:", a4, a3);
  if (v17)
  {
    -[PatternPlayerBase engine](v14, "engine");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "notifyPlayerStopped:atTime:", v14, a3);

    -[AdvancedPatternPlayer resetState](v14, "resetState");
    v19 = objc_loadWeakRetained((id *)&v14->super._engine);
    objc_msgSend(v19, "metrics");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleActionForPlayer:action:time:isAdvanced:", v14, 3, 1, a3);

  }
  objc_sync_exit(v14);

  CALog::Scope::oslog((id *)kHAPIScope);
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v13 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v21))
  {
    LOWORD(v26) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B573F000, v22, OS_SIGNPOST_INTERVAL_END, v10, "AdvancedPatternPlayer_stopAtTime", (const char *)&unk_1B57A456E, (uint8_t *)&v26, 2u);
  }

  return v17;
}

- (BOOL)sendParameters:(id)a3 atTime:(double)a4 error:(id *)a5
{
  id v8;
  int v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  double v17;
  _BOOL4 v18;
  void *v19;
  double v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  AVHapticSequence *sequence;
  uint64_t v31;
  int v32;
  int v33;
  double v34;
  double v35;
  BOOL v36;
  NSObject *v37;
  NSObject *v38;
  id v40;
  os_signpost_id_t spid;
  unint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t v47[128];
  uint8_t buf[4];
  const char *v49;
  __int16 v50;
  int v51;
  __int16 v52;
  const char *v53;
  __int16 v54;
  AdvancedPatternPlayer *v55;
  __int16 v56;
  double v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (a4 < 0.0)
  {
    v9 = -4840;
    v10 = "time >= 0.0";
    v11 = 261;
LABEL_27:
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/CHHapticAdvancedPatternPlayer.mm", v11, "-[AdvancedPatternPlayer sendParameters:atTime:error:]", v10, v9, a5);
    v36 = 0;
    goto LABEL_37;
  }
  if (!self->_sequence)
  {
    v9 = -4812;
    v10 = "_sequence != nil";
    v11 = 262;
    goto LABEL_27;
  }
  CALog::Scope::oslog((id *)kHAPIScope);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_signpost_id_make_with_pointer(v12, self);

  CALog::Scope::oslog((id *)kHAPIScope);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  spid = v13;
  v42 = v13 - 1;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B573F000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "AdvancedPatternPlayer_sendParameters", " enableTelemetry=YES ", buf, 2u);
  }

  -[PatternPlayerBase engine](self, "engine");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "currentTime");
  v18 = v17 > a4;

  if (v18)
  {
    -[PatternPlayerBase engine](self, "engine");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "currentTime");
    a4 = v20;

  }
  if (kHAPIScope)
  {
    if ((*(_BYTE *)(kHAPIScope + 8) & 1) != 0)
    {
      v21 = *(id *)kHAPIScope;
      if (v21)
      {
        v22 = v21;
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136316162;
          v49 = "CHHapticAdvancedPatternPlayer.mm";
          v50 = 1024;
          v51 = 267;
          v52 = 2080;
          v53 = "-[AdvancedPatternPlayer sendParameters:atTime:error:]";
          v54 = 2048;
          v55 = self;
          v56 = 2048;
          v57 = a4;
          _os_log_impl(&dword_1B573F000, v22, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Sending player %p parameters at time %.3f", buf, 0x30u);
        }

      }
    }
  }
  if (-[PatternPlayerBase needsResetForAction:](self, "needsResetForAction:", 1)
    && !-[AVHapticSequence resetAtTime:error:](self->_sequence, "resetAtTime:error:", a5, a4))
  {
    v36 = 0;
  }
  else
  {
    -[PatternPlayerBase engine](self, "engine");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[CHHapticPattern eventListFromEvents:parameters:parameterCurves:engine:privileged:](CHHapticPattern, "eventListFromEvents:parameters:parameterCurves:engine:privileged:", 0, v8, 0, v23, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v25 = v24;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    if (v26)
    {
      v40 = v8;
      v27 = *(_QWORD *)v44;
      while (2)
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v44 != v27)
            objc_enumerationMutation(v25);
          v29 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          sequence = self->_sequence;
          v31 = objc_msgSend(v29, "paramType");
          objc_msgSend(v29, "value");
          v33 = v32;
          objc_msgSend(v29, "time");
          v35 = a4 + v34;
          LODWORD(v34) = v33;
          if (!-[AVHapticSequence setParameter:value:channel:atTime:error:](sequence, "setParameter:value:channel:atTime:error:", v31, 0, a5, v34, v35))
          {
            v36 = 0;
            goto LABEL_29;
          }
        }
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
        if (v26)
          continue;
        break;
      }
      v36 = 1;
LABEL_29:
      v8 = v40;
    }
    else
    {
      v36 = 1;
    }

  }
  CALog::Scope::oslog((id *)kHAPIScope);
  v37 = objc_claimAutoreleasedReturnValue();
  v38 = v37;
  if (v42 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B573F000, v38, OS_SIGNPOST_INTERVAL_END, spid, "AdvancedPatternPlayer_sendParameters", (const char *)&unk_1B57A456E, buf, 2u);
  }

LABEL_37:
  return v36;
}

- (BOOL)scheduleParameterCurve:(id)a3 atTime:(double)a4 error:(id *)a5
{
  id v7;
  NSObject *v8;
  id v9;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (kHAPIScope)
  {
    v8 = *(id *)kHAPIScope;
    if (!v8)
      goto LABEL_8;
  }
  else
  {
    v8 = MEMORY[0x1E0C81028];
    v9 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v11 = 136315650;
    v12 = "CHHapticAdvancedPatternPlayer.mm";
    v13 = 1024;
    v14 = 292;
    v15 = 2080;
    v16 = "-[AdvancedPatternPlayer scheduleParameterCurve:atTime:error:]";
    _os_log_impl(&dword_1B573F000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Parameter curves are not yet supported on CHHapticAdvancedPlayers", (uint8_t *)&v11, 0x1Cu);
  }

LABEL_8:
  if (a4 >= 0.0)
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), -4809, 0);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/CHHapticAdvancedPatternPlayer.mm", 293, "-[AdvancedPatternPlayer scheduleParameterCurve:atTime:error:]", "time >= 0.0", -4840, a5);
  }

  return 0;
}

- (BOOL)pauseAtTime:(double)a3 error:(id *)a4
{
  AdvancedPatternPlayer *v6;
  id WeakRetained;
  char v8;
  BOOL v9;
  NSObject *v10;
  id v11;
  int v12;
  const char *v13;
  uint64_t v14;
  id v15;
  void *v16;
  int v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  AdvancedPatternPlayer *v25;
  __int16 v26;
  double v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = self;
  objc_sync_enter(v6);
  WeakRetained = objc_loadWeakRetained((id *)&v6->super._engine);
  v8 = objc_msgSend(WeakRetained, "checkEngineRunning:", a4);

  if ((v8 & 1) == 0)
    goto LABEL_18;
  if (!-[AdvancedPatternPlayer paused](v6, "paused"))
  {
    if (kHAPIScope)
    {
      v10 = *(id *)kHAPIScope;
      if (!v10)
        goto LABEL_11;
    }
    else
    {
      v10 = MEMORY[0x1E0C81028];
      v11 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v18 = 136316162;
      v19 = "CHHapticAdvancedPatternPlayer.mm";
      v20 = 1024;
      v21 = 306;
      v22 = 2080;
      v23 = "-[AdvancedPatternPlayer pauseAtTime:error:]";
      v24 = 2048;
      v25 = v6;
      v26 = 2048;
      v27 = a3;
      _os_log_impl(&dword_1B573F000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Pausing player %p at time %.3f", (uint8_t *)&v18, 0x30u);
    }

LABEL_11:
    if (a3 >= 0.0)
    {
      if (v6->_sequence)
      {
        v15 = objc_loadWeakRetained((id *)&v6->super._engine);
        objc_msgSend(v15, "metrics");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "handleActionForPlayer:action:time:isAdvanced:", v6, 1, 1, a3);

        if (-[AVHapticSequence pauseAtTime:error:](v6->_sequence, "pauseAtTime:error:", a4, a3))
        {
          -[AdvancedPatternPlayer setPaused](v6, "setPaused");
          goto LABEL_3;
        }
LABEL_18:
        v9 = 0;
        goto LABEL_19;
      }
      v12 = -4812;
      v13 = "_sequence != nil";
      v14 = 308;
    }
    else
    {
      v12 = -4840;
      v13 = "time >= 0.0";
      v14 = 307;
    }
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/CHHapticAdvancedPatternPlayer.mm", v14, "-[AdvancedPatternPlayer pauseAtTime:error:]", v13, v12, a4);
    goto LABEL_18;
  }
LABEL_3:
  v9 = 1;
LABEL_19:
  objc_sync_exit(v6);

  return v9;
}

- (BOOL)resumeAtTime:(double)a3 error:(id *)a4
{
  AdvancedPatternPlayer *v6;
  id WeakRetained;
  char v8;
  NSObject *v9;
  char v10;
  id v11;
  int v12;
  const char *v13;
  uint64_t v14;
  int v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  AdvancedPatternPlayer *v23;
  __int16 v24;
  double v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = self;
  objc_sync_enter(v6);
  WeakRetained = objc_loadWeakRetained((id *)&v6->super._engine);
  v8 = objc_msgSend(WeakRetained, "checkEngineRunning:", a4);

  if ((v8 & 1) == 0)
    goto LABEL_17;
  if (!-[AdvancedPatternPlayer paused](v6, "paused"))
  {
    v10 = 1;
    goto LABEL_18;
  }
  if (!kHAPIScope)
  {
    v9 = MEMORY[0x1E0C81028];
    v11 = MEMORY[0x1E0C81028];
    goto LABEL_8;
  }
  v9 = *(id *)kHAPIScope;
  if (v9)
  {
LABEL_8:
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v16 = 136316162;
      v17 = "CHHapticAdvancedPatternPlayer.mm";
      v18 = 1024;
      v19 = 328;
      v20 = 2080;
      v21 = "-[AdvancedPatternPlayer resumeAtTime:error:]";
      v22 = 2048;
      v23 = v6;
      v24 = 2048;
      v25 = a3;
      _os_log_impl(&dword_1B573F000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Resuming player %p at time %.3f", (uint8_t *)&v16, 0x30u);
    }

  }
  if (a3 < 0.0)
  {
    v12 = -4840;
    v13 = "time >= 0.0";
    v14 = 329;
LABEL_16:
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/CHHapticAdvancedPatternPlayer.mm", v14, "-[AdvancedPatternPlayer resumeAtTime:error:]", v13, v12, a4);
LABEL_17:
    v10 = 0;
    goto LABEL_18;
  }
  if (!v6->_sequence)
  {
    v12 = -4812;
    v13 = "_sequence != nil";
    v14 = 330;
    goto LABEL_16;
  }
  v10 = -[AdvancedPatternPlayer doResumeAtTime:error:](v6, "doResumeAtTime:error:", a4, a3);
LABEL_18:
  objc_sync_exit(v6);

  return v10;
}

- (BOOL)seekToOffset:(double)a3 error:(id *)a4
{
  AdvancedPatternPlayer *v6;
  NSObject *v7;
  id v8;
  char v9;
  NSObject *v10;
  id v11;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  AdvancedPatternPlayer *v20;
  __int16 v21;
  double v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = self;
  objc_sync_enter(v6);
  if (-[AdvancedPatternPlayer running](v6, "running") && !-[AdvancedPatternPlayer paused](v6, "paused"))
  {
    if (kHAPIScope)
    {
      v10 = *(id *)kHAPIScope;
      if (!v10)
      {
LABEL_18:
        v9 = -[AVHapticSequence seekToTime:error:](v6->_sequence, "seekToTime:error:", a4, a3);
        a3 = 0.0;
        goto LABEL_19;
      }
    }
    else
    {
      v10 = MEMORY[0x1E0C81028];
      v11 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v13 = 136316162;
      v14 = "CHHapticAdvancedPatternPlayer.mm";
      v15 = 1024;
      v16 = 347;
      v17 = 2080;
      v18 = "-[AdvancedPatternPlayer seekToOffset:error:]";
      v19 = 2048;
      v20 = v6;
      v21 = 2048;
      v22 = a3;
      _os_log_impl(&dword_1B573F000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Seeking on player %p to offset %.2f", (uint8_t *)&v13, 0x30u);
    }

    goto LABEL_18;
  }
  if (!kHAPIScope)
  {
    v7 = MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
    goto LABEL_7;
  }
  v7 = *(id *)kHAPIScope;
  if (v7)
  {
LABEL_7:
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v13 = 136316162;
      v14 = "CHHapticAdvancedPatternPlayer.mm";
      v15 = 1024;
      v16 = 343;
      v17 = 2080;
      v18 = "-[AdvancedPatternPlayer seekToOffset:error:]";
      v19 = 2048;
      v20 = v6;
      v21 = 2048;
      v22 = a3;
      _os_log_impl(&dword_1B573F000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Caching player %p offset %.2f for later start/resume", (uint8_t *)&v13, 0x30u);
    }

  }
  v9 = 1;
LABEL_19:
  v6->_seekOffset = a3;
  objc_sync_exit(v6);

  return v9;
}

- (BOOL)cancelAndReturnError:(id *)a3
{
  NSObject *v5;
  id v6;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  AdvancedPatternPlayer *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (kHAPIScope)
  {
    v5 = *(id *)kHAPIScope;
    if (!v5)
      return -[AVHapticSequence cancelAndReturnError:](self->_sequence, "cancelAndReturnError:", a3);
  }
  else
  {
    v5 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v8 = 136315906;
    v9 = "CHHapticAdvancedPatternPlayer.mm";
    v10 = 1024;
    v11 = 357;
    v12 = 2080;
    v13 = "-[AdvancedPatternPlayer cancelAndReturnError:]";
    v14 = 2048;
    v15 = self;
    _os_log_impl(&dword_1B573F000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Cancelling commands for player %p immediately", (uint8_t *)&v8, 0x26u);
  }

  return -[AVHapticSequence cancelAndReturnError:](self->_sequence, "cancelAndReturnError:", a3);
}

- (double)patternDuration
{
  AdvancedPatternPlayer *v2;
  BOOL v3;
  double v4;
  double patternDuration;
  float v6;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[AdvancedPatternPlayer paused](v2, "paused");
  objc_sync_exit(v2);

  v4 = 1800.0;
  if (!v3 && !-[AVHapticSequence loopingEnabled](v2->_sequence, "loopingEnabled"))
  {
    patternDuration = v2->super._patternDuration;
    -[AVHapticSequence playbackRate](v2->_sequence, "playbackRate");
    return patternDuration / v6;
  }
  return v4;
}

- (BOOL)running
{
  return self->_state == 2;
}

- (BOOL)paused
{
  return self->_state == 1;
}

- (BOOL)loopEnabled
{
  return -[AVHapticSequence loopingEnabled](self->_sequence, "loopingEnabled");
}

- (void)setLoopEnabled:(BOOL)a3
{
  -[AVHapticSequence setLoopingEnabled:](self->_sequence, "setLoopingEnabled:", a3);
}

- (double)loopEnd
{
  return self->_loopEnd;
}

- (void)setLoopEnd:(double)a3
{
  double v3;

  if (a3 >= 0.0)
  {
    v3 = a3;
    *(float *)&a3 = a3;
    if (-[AVHapticSequence setLoopLength:error:](self->_sequence, "setLoopLength:error:", 0, a3))
      self->_loopEnd = v3;
  }
}

- (float)playbackRate
{
  float result;

  -[AVHapticSequence playbackRate](self->_sequence, "playbackRate");
  return result;
}

- (void)setPlaybackRate:(float)a3
{
  if (a3 > 0.0)
    -[AVHapticSequence setPlaybackRate:](self->_sequence, "setPlaybackRate:");
}

- (BOOL)isMuted
{
  return (self->super._muteState & 0xFFFFFFFE) == 2;
}

- (void)setIsMuted:(BOOL)a3
{
  _BOOL8 v3;
  int muteState;
  id WeakRetained;
  int v7;
  _BOOL4 v8;
  _BOOL4 v9;

  v3 = a3;
  muteState = self->super._muteState;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._engine);
  v7 = newStateFromOld(muteState, v3, objc_msgSend(WeakRetained, "running"));

  v8 = v7 == 0;
  self->super._muteState = v7;
  v9 = muteState == 3 || v7 != 3;
  if (muteState != 3)
    v8 = 0;
  if (!v9 || v8)
    -[AdvancedPatternPlayer doSetMute:](self, "doSetMute:", v3);
}

- (void)setCompletionHandler:(id)a3
{
  id v4;
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id completionHandler;
  AVHapticSequence *sequence;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (kHAPIScope)
  {
    v5 = *(id *)kHAPIScope;
    if (!v5)
      goto LABEL_8;
  }
  else
  {
    v5 = (id)MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  v7 = v5;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = (void *)MEMORY[0x1B5E4F2B4](v4);
    *(_DWORD *)buf = 136315906;
    v17 = "CHHapticAdvancedPatternPlayer.mm";
    v18 = 1024;
    v19 = 444;
    v20 = 2080;
    v21 = "-[AdvancedPatternPlayer setCompletionHandler:]";
    v22 = 2048;
    v23 = v8;
    _os_log_impl(&dword_1B573F000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Wrapping client's completion handler block %p in our block and setting on underlying AVHapticSequence", buf, 0x26u);

  }
LABEL_8:
  v9 = (void *)MEMORY[0x1B5E4F2B4](v4);
  completionHandler = self->_completionHandler;
  self->_completionHandler = v9;

  objc_initWeak((id *)buf, self);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __46__AdvancedPatternPlayer_setCompletionHandler___block_invoke;
  v13[3] = &unk_1E695FF28;
  objc_copyWeak(&v15, (id *)buf);
  v14 = v4;
  sequence = self->_sequence;
  v12 = v4;
  -[AVHapticSequence setCompletionHandler:](sequence, "setCompletionHandler:", v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

void __46__AdvancedPatternPlayer_setCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id *v9;
  id *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "engine");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __46__AdvancedPatternPlayer_setCompletionHandler___block_invoke_2;
    v14[3] = &unk_1E695FED8;
    v7 = v5;
    v15 = v7;
    v17 = *(id *)(a1 + 32);
    v16 = v3;
    objc_msgSend(v6, "dispatchOnLocal:", v14);

    v8 = v7;
    objc_sync_enter(v8);
    objc_msgSend(v8, "resetState");
    v9 = &v15;
    v10 = &v17;
    objc_sync_exit(v8);

  }
  else
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __46__AdvancedPatternPlayer_setCompletionHandler___block_invoke_13;
    v11[3] = &unk_1E695FF00;
    v13 = *(id *)(a1 + 32);
    v12 = v3;
    +[CHHapticEngine dispatchOnGlobal:](CHHapticEngine, "dispatchOnGlobal:", v11);
    v9 = &v13;
    v10 = &v12;
  }

}

void __46__AdvancedPatternPlayer_setCompletionHandler___block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (kHAPIScope)
  {
    v2 = *(id *)kHAPIScope;
    if (!v2)
      goto LABEL_8;
  }
  else
  {
    v2 = (id)MEMORY[0x1E0C81028];
    v3 = MEMORY[0x1E0C81028];
  }
  v4 = v2;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = (void *)MEMORY[0x1B5E4F2B4](*(_QWORD *)(a1 + 48));
    v9 = 136316162;
    v10 = "CHHapticAdvancedPatternPlayer.mm";
    v11 = 1024;
    v12 = 452;
    v13 = 2080;
    v14 = "-[AdvancedPatternPlayer setCompletionHandler:]_block_invoke_2";
    v15 = 2048;
    v16 = v5;
    v17 = 2048;
    v18 = v6;
    _os_log_impl(&dword_1B573F000, v4, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Player %p client-supplied completion handler called - calling captured block %p on internal queue", (uint8_t *)&v9, 0x30u);

  }
LABEL_8:
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "engine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "metrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleActionForPlayer:action:time:isAdvanced:", *(_QWORD *)(a1 + 32), 3, 1, 0.0);

}

uint64_t __46__AdvancedPatternPlayer_setCompletionHandler___block_invoke_13(uint64_t a1)
{
  id v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (kHAPIScope)
  {
    v2 = *(id *)kHAPIScope;
    if (!v2)
      return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v2 = (id)MEMORY[0x1E0C81028];
    v3 = MEMORY[0x1E0C81028];
  }
  v4 = v2;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)MEMORY[0x1B5E4F2B4](*(_QWORD *)(a1 + 40));
    v7 = 136315906;
    v8 = "CHHapticAdvancedPatternPlayer.mm";
    v9 = 1024;
    v10 = 463;
    v11 = 2080;
    v12 = "-[AdvancedPatternPlayer setCompletionHandler:]_block_invoke";
    v13 = 2048;
    v14 = v5;
    _os_log_impl(&dword_1B573F000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Client-supplied completion handler called on destroyed player - calling captured block %p on global queue", (uint8_t *)&v7, 0x26u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)completionHandler
{
  return (id)MEMORY[0x1B5E4F2B4](self->_completionHandler, a2);
}

- (AdvancedPatternPlayer)initWithRingtoneData:(id)a3 engine:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  AdvancedPatternPlayer *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  NSArray *events;
  AVHapticSequence *v16;
  void *v17;
  uint64_t v18;
  AVHapticSequence *sequence;
  AVHapticSequence *v20;
  double v21;
  NSObject *v22;
  NSObject *v23;
  uint8_t v25[16];
  objc_super v26;

  v8 = a3;
  v9 = a4;
  v26.receiver = self;
  v26.super_class = (Class)AdvancedPatternPlayer;
  v10 = -[AdvancedPatternPlayer init](&v26, sel_init);
  if (v10)
  {
    CALog::Scope::oslog((id *)kHAPIScope);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_signpost_id_make_with_pointer(v11, v10);

    CALog::Scope::oslog((id *)kHAPIScope);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)v25 = 0;
      _os_signpost_emit_with_name_impl(&dword_1B573F000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "AdvancedPatternPlayer_initWithRingtoneData", " enableTelemetry=YES ", v25, 2u);
    }

    objc_storeWeak((id *)&v10->super._engine, v9);
    events = v10->super._events;
    v10->super._events = 0;

    v16 = [AVHapticSequence alloc];
    objc_msgSend(v9, "player");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[AVHapticSequence initWithData:player:error:](v16, "initWithData:player:error:", v8, v17, a5);
    sequence = v10->_sequence;
    v10->_sequence = (AVHapticSequence *)v18;

    v20 = v10->_sequence;
    if (v20)
    {
      -[AVHapticSequence duration](v20, "duration");
      v10->super._patternDuration = v21;
      -[AdvancedPatternPlayer finishInit](v10, "finishInit");
    }
    else
    {

      v10 = 0;
    }
    CALog::Scope::oslog((id *)kHAPIScope);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      *(_WORD *)v25 = 0;
      _os_signpost_emit_with_name_impl(&dword_1B573F000, v23, OS_SIGNPOST_INTERVAL_END, v12, "AdvancedPatternPlayer_initWithRingtoneData", (const char *)&unk_1B57A456E, v25, 2u);
    }

  }
  return v10;
}

- (AdvancedPatternPlayer)initWithVibePatternDictionary:(id)a3 engine:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  AdvancedPatternPlayer *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  NSArray *events;
  AVHapticSequence *v16;
  void *v17;
  uint64_t v18;
  AVHapticSequence *sequence;
  AVHapticSequence *v20;
  double v21;
  NSObject *v22;
  NSObject *v23;
  uint8_t v25[16];
  objc_super v26;

  v8 = a3;
  v9 = a4;
  v26.receiver = self;
  v26.super_class = (Class)AdvancedPatternPlayer;
  v10 = -[AdvancedPatternPlayer init](&v26, sel_init);
  if (v10)
  {
    CALog::Scope::oslog((id *)kHAPIScope);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_signpost_id_make_with_pointer(v11, v10);

    CALog::Scope::oslog((id *)kHAPIScope);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)v25 = 0;
      _os_signpost_emit_with_name_impl(&dword_1B573F000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "AdvancedPatternPlayer_initWithVibePatternDictionary", " enableTelemetry=YES ", v25, 2u);
    }

    objc_storeWeak((id *)&v10->super._engine, v9);
    events = v10->super._events;
    v10->super._events = 0;

    v10->_state = 0;
    v10->_seekOffset = 0.0;
    v10->super._previousAction = 0;
    v16 = [AVHapticSequence alloc];
    objc_msgSend(v9, "player");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[AVHapticSequence initWithDictionary:player:error:](v16, "initWithDictionary:player:error:", v8, v17, a5);
    sequence = v10->_sequence;
    v10->_sequence = (AVHapticSequence *)v18;

    v20 = v10->_sequence;
    if (v20)
    {
      -[AVHapticSequence duration](v20, "duration");
      v10->super._patternDuration = v21;
      -[AdvancedPatternPlayer finishInit](v10, "finishInit");
    }
    else
    {

      v10 = 0;
    }
    CALog::Scope::oslog((id *)kHAPIScope);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      *(_WORD *)v25 = 0;
      _os_signpost_emit_with_name_impl(&dword_1B573F000, v23, OS_SIGNPOST_INTERVAL_END, v12, "AdvancedPatternPlayer_initWithVibePatternDictionary", (const char *)&unk_1B57A456E, v25, 2u);
    }

  }
  return v10;
}

- (BOOL)activateChannelByIndex:(unint64_t)a3 atTime:(double)a4 error:(id *)a5
{
  if (a4 >= 0.0)
    return -[AVHapticSequence activateChannelByIndex:atTime:error:](self->_sequence, "activateChannelByIndex:atTime:error:", a3, a5);
  _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/CHHapticAdvancedPatternPlayer.mm", 526, "-[AdvancedPatternPlayer activateChannelByIndex:atTime:error:]", "time >= 0.0", -4840, a5);
  return 0;
}

- (BOOL)setVolume:(float)a3 atTime:(double)a4 error:(id *)a5
{
  if (a4 >= 0.0)
    return -[AVHapticSequence setVolume:atTime:error:](self->_sequence, "setVolume:atTime:error:", a5);
  _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/CHHapticAdvancedPatternPlayer.mm", 532, "-[AdvancedPatternPlayer setVolume:atTime:error:]", "time >= 0.0", -4840, a5);
  return 0;
}

- (BOOL)earlyUnduckAudioAtTime:(double)a3 error:(id *)a4
{
  NSObject *v8;
  id v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  AdvancedPatternPlayer *v17;
  __int16 v18;
  double v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (a3 < 0.0)
  {
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/CHHapticAdvancedPatternPlayer.mm", 538, "-[AdvancedPatternPlayer earlyUnduckAudioAtTime:error:]", "time >= 0.0", -4840, a4);
    return 0;
  }
  if (!kHAPIScope)
  {
    v8 = MEMORY[0x1E0C81028];
    v9 = MEMORY[0x1E0C81028];
    goto LABEL_7;
  }
  v8 = *(id *)kHAPIScope;
  if (v8)
  {
LABEL_7:
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v10 = 136316162;
      v11 = "CHHapticAdvancedPatternPlayer.mm";
      v12 = 1024;
      v13 = 539;
      v14 = 2080;
      v15 = "-[AdvancedPatternPlayer earlyUnduckAudioAtTime:error:]";
      v16 = 2048;
      v17 = self;
      v18 = 2048;
      v19 = a3;
      _os_log_impl(&dword_1B573F000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Setting player %p to early unduck audio at time %.3f", (uint8_t *)&v10, 0x30u);
    }

  }
  return -[AVHapticSequence earlyUnduckAudioAtTime:error:](self->_sequence, "earlyUnduckAudioAtTime:error:", a4, a3);
}

- (double)seekOffset
{
  return self->_seekOffset;
}

- (void)setSeekOffset:(double)a3
{
  self->_seekOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_sequence, 0);
}

- (void)doStartFromPausedAtTime:error:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    OUTLINED_FUNCTION_0(&dword_1B573F000, MEMORY[0x1E0C81028], v0, "%25s:%-5d ASSERTION FAILURE [(self.paused) != 0 is false]: ", v1, v2, v3, v4, 2u);
  __break(1u);
}

- (void)doResumeAtTime:error:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    OUTLINED_FUNCTION_0(&dword_1B573F000, MEMORY[0x1E0C81028], v0, "%25s:%-5d ASSERTION FAILURE [(self.paused) != 0 is false]: ", v1, v2, v3, v4, 2u);
  __break(1u);
}

@end
