@implementation PatternPlayer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channel, 0);
}

- (void)dealloc
{
  NSObject *v3;
  id v4;
  id WeakRetained;
  id v6;
  objc_super v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  PatternPlayer *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
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
    v9 = "CHHapticPatternPlayer.mm";
    v10 = 1024;
    v11 = 168;
    v12 = 2080;
    v13 = "-[PatternPlayer dealloc]";
    v14 = 2048;
    v15 = self;
    _os_log_impl(&dword_1B573F000, v3, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: destroying player %p", buf, 0x26u);
  }

LABEL_8:
  WeakRetained = objc_loadWeakRetained((id *)&self->super._engine);
  -[PatternPlayer clearExternalResources:](self, "clearExternalResources:", WeakRetained);

  if (self->_channel)
  {
    v6 = objc_loadWeakRetained((id *)&self->super._engine);
    objc_msgSend(v6, "releaseChannel:", self->_channel);

  }
  v7.receiver = self;
  v7.super_class = (Class)PatternPlayer;
  -[PatternPlayer dealloc](&v7, sel_dealloc);
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
          v13 = "CHHapticPatternPlayer.mm";
          v14 = 1024;
          v15 = 185;
          v16 = 2080;
          v17 = "-[PatternPlayer clearExternalResources:]";
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

- (PatternPlayer)initWithPlayable:(id)a3 engine:(id)a4 privileged:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  PatternPlayer *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSArray *events;
  uint64_t v23;
  NSString *patternID;
  double v25;
  id WeakRetained;
  void *v27;
  void *v28;
  BOOL v29;
  id v30;
  void *v31;
  uint64_t v32;
  AVHapticPlayerChannel *channel;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  id v40;
  NSObject *v41;
  unint64_t v43;
  unint64_t v44;
  os_signpost_id_t spid;
  objc_super v46;
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  int v50;
  __int16 v51;
  const char *v52;
  __int16 v53;
  PatternPlayer *v54;
  uint64_t v55;

  v7 = a5;
  v55 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v46.receiver = self;
  v46.super_class = (Class)PatternPlayer;
  v12 = -[PatternPlayer init](&v46, sel_init);
  if (v12)
  {
    CALog::Scope::oslog((id *)kHAPIScope);
    v13 = objc_claimAutoreleasedReturnValue();
    spid = os_signpost_id_make_with_pointer(v13, v12);

    CALog::Scope::oslog((id *)kHAPIScope);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v43 = spid - 1;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B573F000, v15, OS_SIGNPOST_INTERVAL_BEGIN, spid, "PatternPlayer_initWithPlayable", " enableTelemetry=YES ", buf, 2u);
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
      v48 = "CHHapticPatternPlayer.mm";
      v49 = 1024;
      v50 = 88;
      v51 = 2080;
      v52 = "-[PatternPlayer initWithPlayable:engine:privileged:error:]";
      v53 = 2048;
      v54 = v12;
      _os_log_impl(&dword_1B573F000, v16, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: creating player %p", buf, 0x26u);
    }

LABEL_12:
    objc_storeWeak((id *)&v12->super._engine, v11);
    v12->super._muteState = 0;
    v12->super._previousAction = 0;
    objc_msgSend(v10, "resolveExternalResources:error:", v11, a6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {

      CALog::Scope::oslog((id *)kHAPIScope);
      v37 = objc_claimAutoreleasedReturnValue();
      v38 = v37;
      if (v43 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v37))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B573F000, v38, OS_SIGNPOST_INTERVAL_END, spid, "PatternPlayer_initWithPlayable", (const char *)&unk_1B57A456E, buf, 2u);
      }
      goto LABEL_38;
    }
    objc_msgSend(v10, "parameters");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "parameterCurves");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[CHHapticPattern eventListFromEvents:parameters:parameterCurves:engine:privileged:](CHHapticPattern, "eventListFromEvents:parameters:parameterCurves:engine:privileged:", v18, v19, v20, v11, v7);
    v21 = objc_claimAutoreleasedReturnValue();
    events = v12->super._events;
    v12->super._events = (NSArray *)v21;

    if (-[NSArray count](v12->super._events, "count"))
    {
      objc_msgSend(v10, "patternID");
      v23 = objc_claimAutoreleasedReturnValue();
      patternID = v12->super._patternID;
      v12->super._patternID = (NSString *)v23;

      objc_msgSend(v10, "duration");
      v12->super._patternDuration = v25;
      WeakRetained = objc_loadWeakRetained((id *)&v12->super._engine);
      objc_msgSend(WeakRetained, "metrics");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleInitForPlayer:events:isAdvanced:patternID:", v12, v12->super._events, 0, v12->super._patternID);

      objc_msgSend(v10, "parameterCurves");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "count") == 0;

      if (!v29)
      {
        v30 = objc_loadWeakRetained((id *)&v12->super._engine);
        objc_msgSend(v30, "metrics");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "handleParamCurveEncountered");

      }
      objc_msgSend(v11, "getAvailableChannel:", a6, v43);
      v32 = objc_claimAutoreleasedReturnValue();
      channel = v12->_channel;
      v12->_channel = (AVHapticPlayerChannel *)v32;

      if (!v12->_channel)
      {
        -[PatternPlayerBase engine](v12, "engine");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[PatternPlayer releaseExternalResources:events:](v12, "releaseExternalResources:events:", v34, v18);

        v12 = 0;
      }
      CALog::Scope::oslog((id *)kHAPIScope);
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = v35;
      if (v44 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B573F000, v36, OS_SIGNPOST_INTERVAL_END, spid, "PatternPlayer_initWithPlayable", (const char *)&unk_1B57A456E, buf, 2u);
      }

      goto LABEL_39;
    }
    if (kHAPIScope)
    {
      v39 = *(id *)kHAPIScope;
      if (!v39)
      {
LABEL_33:
        if (a6)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), -4821, 0);
          *a6 = (id)objc_claimAutoreleasedReturnValue();
        }

        CALog::Scope::oslog((id *)kHAPIScope);
        v41 = objc_claimAutoreleasedReturnValue();
        v38 = v41;
        if (v43 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v41))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1B573F000, v38, OS_SIGNPOST_INTERVAL_END, spid, "PatternPlayer_initWithPlayable", (const char *)&unk_1B57A456E, buf, 2u);
        }
LABEL_38:

        v12 = 0;
LABEL_39:

        goto LABEL_40;
      }
    }
    else
    {
      v39 = MEMORY[0x1E0C81028];
      v40 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v48 = "CHHapticPatternPlayer.mm";
      v49 = 1024;
      v50 = 125;
      v51 = 2080;
      v52 = "-[PatternPlayer initWithPlayable:engine:privileged:error:]";
      _os_log_impl(&dword_1B573F000, v39, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: pattern contains no playable events", buf, 0x1Cu);
    }

    goto LABEL_33;
  }
LABEL_40:

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
  unint64_t v13;
  id WeakRetained;
  char v15;
  int muteState;
  _BOOL4 v17;
  id v18;
  char v19;
  id v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  int v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  PatternPlayer *v35;
  __int16 v36;
  double v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
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
    v28 = 136316162;
    v29 = "CHHapticPatternPlayer.mm";
    v30 = 1024;
    v31 = 199;
    v32 = 2080;
    v33 = "-[PatternPlayer startAtTime:error:]";
    v34 = 2048;
    v35 = self;
    v36 = 2048;
    v37 = a3;
    _os_log_impl(&dword_1B573F000, v7, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Starting simple player %p at time %.3f", (uint8_t *)&v28, 0x30u);
  }

LABEL_8:
  if (a3 < 0.0)
  {
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/CHHapticPatternPlayer.mm", 200, "-[PatternPlayer startAtTime:error:]", "time >= 0.0", -4840, a4);
    return 0;
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
    LOWORD(v28) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B573F000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PatternPlayer_startAtTime", " enableTelemetry=YES ", (uint8_t *)&v28, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->super._engine);
  v15 = objc_msgSend(WeakRetained, "checkEngineStateOnStart:", a4);

  if ((v15 & 1) == 0)
  {
    CALog::Scope::oslog((id *)kHAPIScope);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v13 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      LOWORD(v28) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B573F000, v24, OS_SIGNPOST_INTERVAL_END, v10, "PatternPlayer_startAtTime", (const char *)&unk_1B57A456E, (uint8_t *)&v28, 2u);
    }

    return 0;
  }
  muteState = self->super._muteState;
  if ((muteState - 1) <= 1)
  {
    v17 = muteState == 2;
    -[PatternPlayer doSetMute:](self, "doSetMute:", muteState == 2);
    self->super._muteState = newStateFromOld(self->super._muteState, v17, 1);
  }
  if ((!-[PatternPlayerBase needsResetForAction:](self, "needsResetForAction:", 2)
     || -[AVHapticPlayerChannel resetAtTime:error:](self->_channel, "resetAtTime:error:", a4, a3))
    && -[AVHapticPlayerChannel sendEvents:atTime:error:](self->_channel, "sendEvents:atTime:error:", self->super._events, a4, a3))
  {
    v18 = objc_loadWeakRetained((id *)&self->super._engine);
    v19 = objc_msgSend(v18, "notifyPlayerStarted:atTime:", self, a3);

    v20 = objc_loadWeakRetained((id *)&self->super._engine);
    objc_msgSend(v20, "metrics");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PatternPlayerBase patternID](self, "patternID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleStartForPlayer:time:isAdvanced:patternID:", self, 0, v22, a3);

  }
  else
  {
    v19 = 0;
  }
  CALog::Scope::oslog((id *)kHAPIScope);
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v13 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    LOWORD(v28) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B573F000, v26, OS_SIGNPOST_INTERVAL_END, v10, "PatternPlayer_startAtTime", (const char *)&unk_1B57A456E, (uint8_t *)&v28, 2u);
  }

  return v19;
}

- (PatternPlayer)init
{

  return 0;
}

- (void)releaseExternalResources:(id)a3 events:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  unint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (kHAPIScope)
  {
    if ((*(_BYTE *)(kHAPIScope + 8) & 1) != 0)
    {
      v7 = *(id *)kHAPIScope;
      if (v7)
      {
        v8 = v7;
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          v16 = "CHHapticPatternPlayer.mm";
          v17 = 1024;
          v18 = 37;
          v19 = 2080;
          v20 = "-[PatternPlayer releaseExternalResources:events:]";
          _os_log_impl(&dword_1B573F000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Clearing any externally-registered audio resources", buf, 0x1Cu);
        }

      }
    }
  }
  for (i = 0; i < objc_msgSend(v6, "count"); ++i)
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", i);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[CHHapticEngine resourceIsRegistered:](CHHapticEngine, "resourceIsRegistered:", objc_msgSend(v10, "audioResID")))
    {
      v11 = objc_msgSend(v10, "audioResID");
      objc_msgSend(v5, "player");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 0;
      +[CHHapticEngine doUnregisterAudioResource:fromPattern:player:error:](CHHapticEngine, "doUnregisterAudioResource:fromPattern:player:error:", v11, 1, v12, &v14);
      v13 = v14;

    }
  }

}

- (id)processImmediateParameters:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __44__PatternPlayer_processImmediateParameters___block_invoke;
    v7[3] = &unk_1E695FE60;
    v5 = v4;
    v8 = v5;
    objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v7);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __44__PatternPlayer_processImmediateParameters___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const CALog::Scope *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  int v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "isEqualToString:", CHHapticEventParameterIDAudioVolume))
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1000);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v6, v8);
LABEL_13:

    goto LABEL_14;
  }
  if (objc_msgSend(v5, "isEqualToString:", CHHapticEventParameterIDAudioPitch))
  {
    v9 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1001);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v6, v8);
    goto LABEL_13;
  }
  if (objc_msgSend(v5, "isEqualToString:", CHHapticEventParameterIDAudioBrightness))
  {
    v10 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1013);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v6, v8);
    goto LABEL_13;
  }
  if (objc_msgSend(v5, "isEqualToString:", CHHapticEventParameterIDAudioPan))
  {
    v11 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1015);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v6, v8);
    goto LABEL_13;
  }
  if (objc_msgSend(v5, "isEqualToString:", CHHapticEventParameterIDHapticIntensity))
  {
    v12 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 2000);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v6, v8);
    goto LABEL_13;
  }
  if (objc_msgSend(v5, "isEqualToString:", CHHapticEventParameterIDHapticSharpness))
  {
    v14 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 2001);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v6, v8);
    goto LABEL_13;
  }
  CALog::LogObjIfEnabled((CALog *)3, kHAPIScope, v13);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15 && os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 136315906;
    v18 = "CHHapticPatternPlayer.mm";
    v19 = 1024;
    v20 = 74;
    v21 = 2080;
    v22 = "-[PatternPlayer processImmediateParameters:]_block_invoke";
    v23 = 2112;
    v24 = v5;
    _os_log_impl(&dword_1B573F000, v16, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: EventParameter %@ does not support ImmediateParameter modulation. Ignore", (uint8_t *)&v17, 0x26u);
  }

LABEL_14:
}

- (void)doSetMute:(BOOL)a3
{
  double v3;
  _BOOL4 v4;
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  float v9;
  double v10;
  _BYTE v11[38];
  uint64_t v12;

  v4 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  if (kHAPIScope)
  {
    if ((*(_BYTE *)(kHAPIScope + 8) & 1) != 0)
    {
      v6 = *(id *)kHAPIScope;
      if (v6)
      {
        v7 = v6;
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          v8 = "un";
          *(_DWORD *)v11 = 136315906;
          *(_QWORD *)&v11[4] = "CHHapticPatternPlayer.mm";
          *(_WORD *)&v11[12] = 1024;
          *(_DWORD *)&v11[14] = 177;
          *(_QWORD *)&v11[20] = "-[PatternPlayer doSetMute:]";
          *(_WORD *)&v11[18] = 2080;
          if (v4)
            v8 = "";
          *(_WORD *)&v11[28] = 2080;
          *(_QWORD *)&v11[30] = v8;
          _os_log_impl(&dword_1B573F000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Sending %smute params", v11, 0x26u);
        }

      }
    }
  }
  if (v4)
    v9 = 1.0;
  else
    v9 = 0.0;
  *(float *)&v3 = v9;
  -[AVHapticPlayerChannel setParameter:value:atTime:error:](self->_channel, "setParameter:value:atTime:error:", 1014, 0, v3, 0.0, *(_OWORD *)v11, *(_OWORD *)&v11[16]);
  *(float *)&v10 = v9;
  -[AVHapticPlayerChannel setParameter:value:atTime:error:](self->_channel, "setParameter:value:atTime:error:", 2014, 0, v10, 0.0);
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
  id WeakRetained;
  char v15;
  _BOOL4 v16;
  id v17;
  id v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  int v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  PatternPlayer *v32;
  __int16 v33;
  double v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
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
    v25 = 136316162;
    v26 = "CHHapticPatternPlayer.mm";
    v27 = 1024;
    v28 = 230;
    v29 = 2080;
    v30 = "-[PatternPlayer stopAtTime:error:]";
    v31 = 2048;
    v32 = self;
    v33 = 2048;
    v34 = a3;
    _os_log_impl(&dword_1B573F000, v7, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Stopping simple player %p at time %.3f", (uint8_t *)&v25, 0x30u);
  }

LABEL_8:
  if (a3 < 0.0)
  {
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/CHHapticPatternPlayer.mm", 231, "-[PatternPlayer stopAtTime:error:]", "time >= 0.0", -4840, a4);
LABEL_24:
    LOBYTE(v16) = 0;
    return v16;
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
    LOWORD(v25) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B573F000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PatternPlayer_stopAtTime", " enableTelemetry=YES ", (uint8_t *)&v25, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->super._engine);
  v15 = objc_msgSend(WeakRetained, "checkEngineRunning:", a4);

  if ((v15 & 1) == 0)
  {
    CALog::Scope::oslog((id *)kHAPIScope);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v13 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      LOWORD(v25) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B573F000, v23, OS_SIGNPOST_INTERVAL_END, v10, "PatternPlayer_stopAtTime", (const char *)&unk_1B57A456E, (uint8_t *)&v25, 2u);
    }

    goto LABEL_24;
  }
  v16 = -[AVHapticPlayerChannel clearEvents:error:](self->_channel, "clearEvents:error:", a4, a3);
  if (v16)
  {
    v17 = objc_loadWeakRetained((id *)&self->super._engine);
    objc_msgSend(v17, "notifyPlayerStopped:atTime:", self, a3);

    v18 = objc_loadWeakRetained((id *)&self->super._engine);
    objc_msgSend(v18, "metrics");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleActionForPlayer:action:time:isAdvanced:", self, 3, 0, a3);

  }
  CALog::Scope::oslog((id *)kHAPIScope);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v13 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    LOWORD(v25) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B573F000, v21, OS_SIGNPOST_INTERVAL_END, v10, "PatternPlayer_stopAtTime", (const char *)&unk_1B57A456E, (uint8_t *)&v25, 2u);
  }

  return v16;
}

- (BOOL)sendParameters:(id)a3 atTime:(double)a4 error:(id *)a5
{
  id v8;
  NSObject *v9;
  NSObject *v10;
  BOOL v11;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  id WeakRetained;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  int v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  PatternPlayer *v28;
  __int16 v29;
  double v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (kHAPIScope)
  {
    if ((*(_BYTE *)(kHAPIScope + 8) & 1) != 0)
    {
      v9 = *(id *)kHAPIScope;
      if (v9)
      {
        v10 = v9;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          v21 = 136316162;
          v22 = "CHHapticPatternPlayer.mm";
          v23 = 1024;
          v24 = 248;
          v25 = 2080;
          v26 = "-[PatternPlayer sendParameters:atTime:error:]";
          v27 = 2048;
          v28 = self;
          v29 = 2048;
          v30 = a4;
          _os_log_impl(&dword_1B573F000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Sending simple player %p parameters at time %.3f", (uint8_t *)&v21, 0x30u);
        }

      }
    }
  }
  if (a4 >= 0.0)
  {
    CALog::Scope::oslog((id *)kHAPIScope);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_signpost_id_make_with_pointer(v12, self);

    CALog::Scope::oslog((id *)kHAPIScope);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      LOWORD(v21) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B573F000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "PatternPlayer_sendParameters", " enableTelemetry=YES ", (uint8_t *)&v21, 2u);
    }

    if (-[PatternPlayerBase needsResetForAction:](self, "needsResetForAction:", 1)
      && !-[AVHapticPlayerChannel resetAtTime:error:](self->_channel, "resetAtTime:error:", a5, a4))
    {
      v11 = 0;
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->super._engine);
      +[CHHapticPattern eventListFromEvents:parameters:parameterCurves:engine:privileged:](CHHapticPattern, "eventListFromEvents:parameters:parameterCurves:engine:privileged:", 0, v8, 0, WeakRetained, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = -[AVHapticPlayerChannel sendEvents:atTime:error:](self->_channel, "sendEvents:atTime:error:", v17, a5, a4);
    }
    CALog::Scope::oslog((id *)kHAPIScope);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      LOWORD(v21) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B573F000, v19, OS_SIGNPOST_INTERVAL_END, v13, "PatternPlayer_sendParameters", (const char *)&unk_1B57A456E, (uint8_t *)&v21, 2u);
    }

  }
  else
  {
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/CHHapticPatternPlayer.mm", 249, "-[PatternPlayer sendParameters:atTime:error:]", "time >= 0.0", -4840, a5);
    v11 = 0;
  }

  return v11;
}

- (BOOL)cancelAndReturnError:(id *)a3
{
  NSObject *v5;
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  unint64_t v11;
  id WeakRetained;
  char v13;
  _BOOL4 v14;
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  int v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  PatternPlayer *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (kHAPIScope)
  {
    v5 = *(id *)kHAPIScope;
    if (!v5)
      goto LABEL_8;
  }
  else
  {
    v5 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v22 = 136315906;
    v23 = "CHHapticPatternPlayer.mm";
    v24 = 1024;
    v25 = 271;
    v26 = 2080;
    v27 = "-[PatternPlayer cancelAndReturnError:]";
    v28 = 2048;
    v29 = self;
    _os_log_impl(&dword_1B573F000, v5, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Cancelling events on simple player %p immediately", (uint8_t *)&v22, 0x26u);
  }

LABEL_8:
  CALog::Scope::oslog((id *)kHAPIScope);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_make_with_pointer(v7, self);

  CALog::Scope::oslog((id *)kHAPIScope);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    LOWORD(v22) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B573F000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PatternPlayer_cancelAndReturnError", " enableTelemetry=YES ", (uint8_t *)&v22, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->super._engine);
  v13 = objc_msgSend(WeakRetained, "checkEngineRunning:", a3);

  if ((v13 & 1) != 0)
  {
    v14 = -[AVHapticPlayerChannel clearEvents:error:](self->_channel, "clearEvents:error:", a3, 0.0);
    if (v14)
    {
      v15 = objc_loadWeakRetained((id *)&self->super._engine);
      objc_msgSend(v15, "notifyPlayerStopped:atTime:", self, 0.0);

      v16 = objc_loadWeakRetained((id *)&self->super._engine);
      objc_msgSend(v16, "metrics");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleActionForPlayer:action:time:isAdvanced:", self, 3, 0, 0.0);

    }
    CALog::Scope::oslog((id *)kHAPIScope);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      LOWORD(v22) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B573F000, v19, OS_SIGNPOST_INTERVAL_END, v8, "PatternPlayer_cancelAndReturnError", (const char *)&unk_1B57A456E, (uint8_t *)&v22, 2u);
    }
  }
  else
  {
    CALog::Scope::oslog((id *)kHAPIScope);
    v20 = objc_claimAutoreleasedReturnValue();
    v19 = v20;
    if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      LOWORD(v22) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B573F000, v19, OS_SIGNPOST_INTERVAL_END, v8, "PatternPlayer_cancelAndReturnError", (const char *)&unk_1B57A456E, (uint8_t *)&v22, 2u);
    }
    LOBYTE(v14) = 0;
  }

  return v14;
}

- (BOOL)scheduleParameterCurve:(id)a3 atTime:(double)a4 error:(id *)a5
{
  id v8;
  NSObject *v9;
  NSObject *v10;
  BOOL v11;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  unint64_t v16;
  id WeakRetained;
  char v18;
  double v19;
  double v20;
  void *v21;
  id v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  id v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  PatternPlayer *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (kHAPIScope)
  {
    if ((*(_BYTE *)(kHAPIScope + 8) & 1) != 0)
    {
      v9 = *(id *)kHAPIScope;
      if (v9)
      {
        v10 = v9;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315906;
          v30 = "CHHapticPatternPlayer.mm";
          v31 = 1024;
          v32 = 288;
          v33 = 2080;
          v34 = "-[PatternPlayer scheduleParameterCurve:atTime:error:]";
          v35 = 2048;
          v36 = self;
          _os_log_impl(&dword_1B573F000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Sending player %p a parameter curve", buf, 0x26u);
        }

      }
    }
  }
  if (a4 >= 0.0)
  {
    CALog::Scope::oslog((id *)kHAPIScope);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_signpost_id_make_with_pointer(v12, self);

    CALog::Scope::oslog((id *)kHAPIScope);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v16 = v13 - 1;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B573F000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "PatternPlayer_scheduleParameterCurve", " enableTelemetry=YES ", buf, 2u);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->super._engine);
    v18 = objc_msgSend(WeakRetained, "checkEngineRunning:", a5);

    if ((v18 & 1) != 0)
    {
      if (-[PatternPlayerBase needsResetForAction:](self, "needsResetForAction:", 1)
        && !-[AVHapticPlayerChannel resetAtTime:error:](self->_channel, "resetAtTime:error:", a5, a4))
      {
        v11 = 0;
      }
      else
      {
        objc_msgSend(v8, "relativeTime");
        v20 = v19;
        objc_msgSend(v8, "setRelativeTime:", 0.0);
        v28 = v8;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_loadWeakRetained((id *)&self->super._engine);
        +[CHHapticPattern eventListFromEvents:parameters:parameterCurves:engine:privileged:](CHHapticPattern, "eventListFromEvents:parameters:parameterCurves:engine:privileged:", 0, 0, v21, v22, 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        v11 = -[AVHapticPlayerChannel sendEvents:atTime:error:](self->_channel, "sendEvents:atTime:error:", v23, a5, a4);
        objc_msgSend(v8, "setRelativeTime:", v20);

      }
      CALog::Scope::oslog((id *)kHAPIScope);
      v26 = objc_claimAutoreleasedReturnValue();
      v25 = v26;
      if (v16 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B573F000, v25, OS_SIGNPOST_INTERVAL_END, v13, "PatternPlayer_scheduleParameterCurve", (const char *)&unk_1B57A456E, buf, 2u);
      }
    }
    else
    {
      CALog::Scope::oslog((id *)kHAPIScope);
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (v16 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B573F000, v25, OS_SIGNPOST_INTERVAL_END, v13, "PatternPlayer_scheduleParameterCurve", (const char *)&unk_1B57A456E, buf, 2u);
      }
      v11 = 0;
    }

  }
  else
  {
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/CHHapticPatternPlayer.mm", 289, "-[PatternPlayer scheduleParameterCurve:atTime:error:]", "time >= 0.0", -4840, a5);
    v11 = 0;
  }

  return v11;
}

- (BOOL)startAtTime:(double)a3 withImmediateParameters:(id)a4 error:(id *)a5
{
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  unint64_t v15;
  id WeakRetained;
  char v17;
  int muteState;
  AVHapticPlayerChannel *channel;
  NSArray *events;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  int v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  PatternPlayer *v37;
  __int16 v38;
  double v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  if (kHAPIScope)
  {
    v9 = *(id *)kHAPIScope;
    if (!v9)
      goto LABEL_8;
  }
  else
  {
    v9 = MEMORY[0x1E0C81028];
    v10 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v30 = 136316162;
    v31 = "CHHapticPatternPlayer.mm";
    v32 = 1024;
    v33 = 317;
    v34 = 2080;
    v35 = "-[PatternPlayer startAtTime:withImmediateParameters:error:]";
    v36 = 2048;
    v37 = self;
    v38 = 2048;
    v39 = a3;
    _os_log_impl(&dword_1B573F000, v9, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Starting simple player extended %p at time %.3f", (uint8_t *)&v30, 0x30u);
  }

LABEL_8:
  if (a3 >= 0.0)
  {
    CALog::Scope::oslog((id *)kHAPIScope);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_signpost_id_make_with_pointer(v11, self);

    CALog::Scope::oslog((id *)kHAPIScope);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = v12 - 1;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      LOWORD(v30) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B573F000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PatternPlayer_startAtTime_withImmediateParameters", " enableTelemetry=YES ", (uint8_t *)&v30, 2u);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->super._engine);
    v17 = objc_msgSend(WeakRetained, "checkEngineStateOnStart:", a5);

    if ((v17 & 1) != 0)
    {
      muteState = self->super._muteState;
      if ((muteState - 1) <= 1)
      {
        -[PatternPlayer doSetMute:](self, "doSetMute:", muteState == 2);
        self->super._muteState = newStateFromOld(self->super._muteState, muteState == 2, 1);
      }
      if (-[PatternPlayerBase needsResetForAction:](self, "needsResetForAction:", 2)
        && !-[AVHapticPlayerChannel resetAtTime:error:](self->_channel, "resetAtTime:error:", a5, a3))
      {
        LOBYTE(a5) = 0;
      }
      else
      {
        channel = self->_channel;
        events = self->super._events;
        -[PatternPlayer processImmediateParameters:](self, "processImmediateParameters:", v8);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(a5) = -[AVHapticPlayerChannel sendEvents:withImmediateParameters:atTime:error:](channel, "sendEvents:withImmediateParameters:atTime:error:", events, v21, a5, a3);

        if ((_DWORD)a5)
        {
          v22 = objc_loadWeakRetained((id *)&self->super._engine);
          LOBYTE(a5) = objc_msgSend(v22, "notifyPlayerStarted:atTime:", self, a3);

          v23 = objc_loadWeakRetained((id *)&self->super._engine);
          objc_msgSend(v23, "metrics");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[PatternPlayerBase patternID](self, "patternID");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "handleStartForPlayer:time:isAdvanced:patternID:", self, 0, v25, a3);

        }
      }
      CALog::Scope::oslog((id *)kHAPIScope);
      v28 = objc_claimAutoreleasedReturnValue();
      v27 = v28;
      if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
      {
        LOWORD(v30) = 0;
        _os_signpost_emit_with_name_impl(&dword_1B573F000, v27, OS_SIGNPOST_INTERVAL_END, v12, "PatternPlayer_startAtTime_withImmediateParameters", (const char *)&unk_1B57A456E, (uint8_t *)&v30, 2u);
      }
    }
    else
    {
      CALog::Scope::oslog((id *)kHAPIScope);
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
      {
        LOWORD(v30) = 0;
        _os_signpost_emit_with_name_impl(&dword_1B573F000, v27, OS_SIGNPOST_INTERVAL_END, v12, "PatternPlayer_startAtTime_withImmediateParameters", (const char *)&unk_1B57A456E, (uint8_t *)&v30, 2u);
      }
      LOBYTE(a5) = 0;
    }

  }
  else
  {
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/CHHapticPatternPlayer.mm", 318, "-[PatternPlayer startAtTime:withImmediateParameters:error:]", "time >= 0.0", -4840, a5);
    LOBYTE(a5) = 0;
  }

  return (char)a5;
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
    -[PatternPlayer doSetMute:](self, "doSetMute:", v3);
}

@end
