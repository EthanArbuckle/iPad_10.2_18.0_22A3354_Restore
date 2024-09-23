@implementation BKUIPearlEnrollAudioManager

- (void)cleanupHapticsAndSound
{
  -[BKUIPearlEnrollAudioManager cleanupSound](self, "cleanupSound");
  -[BKUIPearlEnrollAudioManager cleanupHaptics](self, "cleanupHaptics");
}

- (void)setupSound
{
  BKUIPearlAudioSession *v3;
  BKUIPearlAudioSession *audioSession;
  BKUIPearlAudioSession *v5;
  BKUIPearlAudioSession *v6;
  BKUIPearlAudioSession *v7;
  void *v8;
  int v9;
  NSObject *v10;
  uint8_t v11[16];

  -[BKUIPearlEnrollControllerPreloadedState acquireCachedAudioSession](self->_preloadedState, "acquireCachedAudioSession");
  v3 = (BKUIPearlAudioSession *)objc_claimAutoreleasedReturnValue();
  audioSession = self->_audioSession;
  self->_audioSession = v3;

  v5 = self->_audioSession;
  if (!v5)
  {
    v6 = objc_alloc_init(BKUIPearlAudioSession);
    v7 = self->_audioSession;
    self->_audioSession = v6;

    v5 = self->_audioSession;
  }
  -[BKUIPearlAudioSession audioEngine](v5, "audioEngine");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isRunning");

  if (v9)
  {
    -[BKUIPearlAudioSession play](self->_audioSession, "play");
  }
  else
  {
    _BKUILoggingFacility();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1DB281000, v10, OS_LOG_TYPE_DEFAULT, "Unable to play sound, audio engine is not running!", v11, 2u);
    }

  }
}

- (void)cleanupSound
{
  NSObject *v3;
  _QWORD v4[5];
  uint8_t buf[16];

  _BKUILoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB281000, v3, OS_LOG_TYPE_DEFAULT, "Cleaning up sound.", buf, 2u);
  }

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__BKUIPearlEnrollAudioManager_cleanupSound__block_invoke;
  v4[3] = &unk_1EA27FB98;
  v4[4] = self;
  -[BKUIPearlEnrollAudioManager fadeCurrentSound:completion:](self, "fadeCurrentSound:completion:", v4, 10.0);
}

void __43__BKUIPearlEnrollAudioManager_cleanupSound__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "stop");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "audioEngine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stop");

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = 0;

  _BKUILoggingFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1DB281000, v5, OS_LOG_TYPE_DEFAULT, "Sound stopped!", v6, 2u);
  }

}

- (void)setUpHaptics
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    -[BKUIPearlEnrollAudioManager hapticsEngine](self, "hapticsEngine");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      -[BKUIPearlEnrollAudioManager createEngine](self, "createEngine");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      -[BKUIPearlEnrollAudioManager setHapticsEngine:](self, "setHapticsEngine:", v6);

    }
  }
}

- (void)cleanupHaptics
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  _BKUILoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1DB281000, v3, OS_LOG_TYPE_DEFAULT, "Cleaning up Haptics.", v5, 2u);
  }

  -[BKUIPearlEnrollAudioManager hapticsEngine](self, "hapticsEngine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopWithCompletionHandler:", &__block_literal_global_11);

}

void __45__BKUIPearlEnrollAudioManager_cleanupHaptics__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _BKUILoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      objc_msgSend(v2, "localizedDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_1DB281000, v3, OS_LOG_TYPE_DEFAULT, "Unable to clean up Haptics %@.", (uint8_t *)&v6, 0xCu);

    }
  }
  else if (v4)
  {
    LOWORD(v6) = 0;
    _os_log_impl(&dword_1DB281000, v3, OS_LOG_TYPE_DEFAULT, "Haptics stopped!", (uint8_t *)&v6, 2u);
  }

}

- (void)triggerSoundHapticForTransitionToState:(int)a3 fromState:(int)a4
{
  double v5;
  void *v6;
  void *v7;
  double v8;
  BKUIPearlAudioSession *audioSession;
  void *v10;
  double v11;
  double v12;
  _QWORD *v13;
  dispatch_time_t v14;
  BOOL v15;
  void *v16;
  void *v17;
  double v18;
  BKUIPearlAudioSession *v19;
  id v20;
  _QWORD v21[5];
  _QWORD block[5];
  _QWORD v23[5];
  _QWORD v24[5];

  if (a3 == 2)
  {
    v5 = 0.0;
LABEL_3:
    -[BKUIPearlEnrollAudioManager fadeCurrentSound:completion:](self, "fadeCurrentSound:completion:", 0, *(_QWORD *)&a4, v5);
    return;
  }
  if ((a3 | 2) == 7 && (a4 - 3) <= 1)
  {
    -[BKUIPearlAudioSession audioEngine](self->_audioSession, "audioEngine");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mainMixerNode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = 1.0;
    objc_msgSend(v7, "setOutputVolume:", v8);

    audioSession = self->_audioSession;
    -[BKUIPearlAudioSession lockSoundBuffer](audioSession, "lockSoundBuffer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __80__BKUIPearlEnrollAudioManager_triggerSoundHapticForTransitionToState_fromState___block_invoke;
    v24[3] = &unk_1EA27FB98;
    v24[4] = self;
    -[BKUIPearlAudioSession scheduleBuffer:completionHandler:](audioSession, "scheduleBuffer:completionHandler:", v10, v24);

    v11 = 413.0;
LABEL_14:
    -[BKUIPearlEnrollAudioManager playHaptic:withDelay:](self, "playHaptic:withDelay:", 20310, v11);
    return;
  }
  if (a3 == 6 && a4 == 5)
  {
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __80__BKUIPearlEnrollAudioManager_triggerSoundHapticForTransitionToState_fromState___block_invoke_2;
    v23[3] = &unk_1EA27FB98;
    v23[4] = self;
    v12 = 10.0;
    v13 = v23;
LABEL_10:
    -[BKUIPearlEnrollAudioManager fadeCurrentSound:completion:](self, "fadeCurrentSound:completion:", v13, v12);
    return;
  }
  if (a3 == 7 && a4 == 6)
  {
    v14 = dispatch_time(0, 483000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __80__BKUIPearlEnrollAudioManager_triggerSoundHapticForTransitionToState_fromState___block_invoke_3;
    block[3] = &unk_1EA27FB98;
    block[4] = self;
    dispatch_after(v14, MEMORY[0x1E0C80D38], block);
    v11 = 483.0;
    goto LABEL_14;
  }
  if (a3 == 8 && a4 == 7)
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __80__BKUIPearlEnrollAudioManager_triggerSoundHapticForTransitionToState_fromState___block_invoke_4;
    v21[3] = &unk_1EA27FB98;
    v21[4] = self;
    v12 = 10.0;
    v13 = v21;
    goto LABEL_10;
  }
  if (a3 == 9)
    goto LABEL_20;
  v15 = a3 == 5 || a3 == 7;
  if (v15 && a4 == 9)
  {
    -[BKUIPearlAudioSession audioEngine](self->_audioSession, "audioEngine");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "mainMixerNode");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v18) = 1.0;
    objc_msgSend(v17, "setOutputVolume:", v18);

    v19 = self->_audioSession;
    -[BKUIPearlAudioSession scanSoundBuffer](v19, "scanSoundBuffer");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    -[BKUIPearlAudioSession scheduleBuffer:atTime:options:completionHandler:](v19, "scheduleBuffer:atTime:options:completionHandler:", v20, 0, 3, 0);

    return;
  }
  if (a3 == 3 && (a4 | 2) == 7)
  {
LABEL_20:
    v5 = 10.0;
    goto LABEL_3;
  }
}

uint64_t __80__BKUIPearlEnrollAudioManager_triggerSoundHapticForTransitionToState_fromState___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(v2, "scanSoundBuffer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scheduleBuffer:atTime:options:completionHandler:", v3, 0, 3, 0);

  return objc_msgSend(*(id *)(a1 + 32), "playHaptic:withDelay:", 20310, 0.0);
}

uint64_t __80__BKUIPearlEnrollAudioManager_triggerSoundHapticForTransitionToState_fromState___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "audioEngine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mainMixerNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = 1.0;
  objc_msgSend(v3, "setOutputVolume:", v4);

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(v5, "endSoundBuffer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scheduleBuffer:atTime:options:completionHandler:", v6, 0, 2, 0);

  return objc_msgSend(*(id *)(a1 + 32), "playHaptic:withDelay:", 20310, 135.0);
}

void __80__BKUIPearlEnrollAudioManager_triggerSoundHapticForTransitionToState_fromState___block_invoke_3(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "stateDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "state");

  if (v3 == 7)
  {
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    objc_msgSend(v4, "scanSoundBuffer");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scheduleBuffer:atTime:options:completionHandler:", v5, 0, 3, 0);

  }
}

uint64_t __80__BKUIPearlEnrollAudioManager_triggerSoundHapticForTransitionToState_fromState___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "audioEngine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mainMixerNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = 1.0;
  objc_msgSend(v3, "setOutputVolume:", v4);

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(v5, "completeSoundBuffer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scheduleBuffer:atTime:options:completionHandler:", v6, 0, 2, 0);

  return objc_msgSend(*(id *)(a1 + 32), "playHaptic:withDelay:", 20310, 131.0);
}

- (void)triggerSoundHapticForTransitionToSubstate:(int)a3 fromSubstate:(int)a4
{
  void *v5;
  void *v6;
  int v7;
  BKUIPearlAudioSession *audioSession;
  void *v9;
  _QWORD v10[5];

  if (a4)
  {
    if (a3 == 11 || !a3)
    {
      -[BKUIPearlEnrollAudioManager stateDelegate](self, "stateDelegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "state") == 5)
      {

      }
      else
      {
        -[BKUIPearlEnrollAudioManager stateDelegate](self, "stateDelegate");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "state");

        if (v7 != 7)
          return;
      }
      audioSession = self->_audioSession;
      -[BKUIPearlAudioSession scanSoundBuffer](audioSession, "scanSoundBuffer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKUIPearlAudioSession scheduleBuffer:atTime:options:completionHandler:](audioSession, "scheduleBuffer:atTime:options:completionHandler:", v9, 0, 3, 0);

      -[BKUIPearlEnrollAudioManager playHaptic:withDelay:](self, "playHaptic:withDelay:", 20310, 0.0);
    }
  }
  else if (a3 <= 9 && ((1 << a3) & 0x396) != 0)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __86__BKUIPearlEnrollAudioManager_triggerSoundHapticForTransitionToSubstate_fromSubstate___block_invoke;
    v10[3] = &unk_1EA27FB98;
    v10[4] = self;
    -[BKUIPearlEnrollAudioManager fadeCurrentSound:completion:](self, "fadeCurrentSound:completion:", v10, 10.0);
  }
}

void __86__BKUIPearlEnrollAudioManager_triggerSoundHapticForTransitionToSubstate_fromSubstate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "audioEngine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mainMixerNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = 1.0;
  objc_msgSend(v3, "setOutputVolume:", v4);

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(v5, "failSoundBuffer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scheduleBuffer:atTime:options:completionHandler:", v6, 0, 2, 0);

  v7 = *(void **)(a1 + 32);
  objc_msgSend(v7, "hapticEventWithEventType:withDelay:", 26454, 12.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "hapticEventWithEventType:withDelay:", 20310, 134.0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v9;
  objc_msgSend(*(id *)(a1 + 32), "hapticEventWithEventType:withDelay:", 20311, 239.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "playHapticWithEvents:", v11);

}

- (void)playHaptic:(unint64_t)a3 withDelay:(double)a4
{
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  -[BKUIPearlEnrollAudioManager hapticEventWithEventType:withDelay:](self, "hapticEventWithEventType:withDelay:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlEnrollAudioManager playHapticWithEvents:](self, "playHapticWithEvents:", v6);

}

- (id)hapticEventWithEventType:(unint64_t)a3 withDelay:(double)a4
{
  void *v7;
  void *v8;
  double v9;
  double v10;
  NSObject *v11;
  id v12;
  double v13;
  void *v14;
  id v15;
  double v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  _QWORD v23[2];
  uint8_t buf[4];
  double v25;
  __int16 v26;
  double v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[BKUIPearlEnrollAudioManager hapticsEngine](self, "hapticsEngine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[BKUIPearlEnrollAudioManager createEngine](self, "createEngine");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPearlEnrollAudioManager setHapticsEngine:](self, "setHapticsEngine:", v8);

  }
  v9 = 0.598999977;
  if ((uint64_t)a3 > 20310)
  {
    switch(a3)
    {
      case 0x4F57uLL:
        goto LABEL_12;
      case 0x6756uLL:
        v9 = 1.0;
        break;
      case 0x6757uLL:
        break;
      default:
        goto LABEL_11;
    }
    v10 = 0.779999971;
  }
  else
  {
    switch(a3)
    {
      case 0x2B57uLL:
        v10 = 0.0500000007;
        break;
      case 0x4357uLL:
        v10 = 0.319999993;
        break;
      case 0x4F56uLL:
        v9 = 1.0;
LABEL_12:
        v10 = 0.409999996;
        break;
      default:
LABEL_11:
        -[BKUIPearlEnrollAudioManager hapticEventWithEventType:withDelay:].cold.1();
    }
  }
  _BKUILoggingFacility();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v25 = v9;
    v26 = 2048;
    v27 = v10;
    _os_log_impl(&dword_1DB281000, v11, OS_LOG_TYPE_DEFAULT, "Created Haptic event with intensity %f sharpness %f", buf, 0x16u);
  }

  v12 = objc_alloc(MEMORY[0x1E0C9DCE8]);
  *(float *)&v13 = v9;
  v14 = (void *)objc_msgSend(v12, "initWithParameterID:value:", *MEMORY[0x1E0C9DC58], v13);
  v15 = objc_alloc(MEMORY[0x1E0C9DCE8]);
  *(float *)&v16 = v10;
  v17 = (void *)objc_msgSend(v15, "initWithParameterID:value:", *MEMORY[0x1E0C9DC60], v16);
  v18 = objc_alloc(MEMORY[0x1E0C9DCE0]);
  v19 = *MEMORY[0x1E0C9DC78];
  v23[0] = v14;
  v23[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v18, "initWithEventType:parameters:relativeTime:", v19, v20, a4 / 1000.0);

  return v21;
}

- (void)playHapticWithEvents:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  NSObject *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0C9DD08];
  v5 = a3;
  v6 = [v4 alloc];
  v20 = 0;
  v7 = (void *)objc_msgSend(v6, "initWithEvents:parameters:error:", v5, MEMORY[0x1E0C9AA60], &v20);

  v8 = v20;
  if (!v8)
  {
    -[BKUIPearlEnrollAudioManager hapticsEngine](self, "hapticsEngine");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    objc_msgSend(v10, "startAndReturnError:", &v19);
    v9 = v19;

    if (v9)
    {
      _BKUILoggingFacility();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v9;
        _os_log_impl(&dword_1DB281000, v11, OS_LOG_TYPE_DEFAULT, "Unable to start Haptic Engine %@", buf, 0xCu);
      }
      goto LABEL_15;
    }
    -[BKUIPearlEnrollAudioManager hapticsEngine](self, "hapticsEngine");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(v12, "createPlayerWithPattern:error:", v7, &v18);
    v11 = objc_claimAutoreleasedReturnValue();
    v13 = v18;

    if (v13)
    {
      _BKUILoggingFacility();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v13;
        v15 = "Unable to create CHHapticPatternPlayer error: %@";
LABEL_13:
        _os_log_impl(&dword_1DB281000, v14, OS_LOG_TYPE_DEFAULT, v15, buf, 0xCu);
      }
    }
    else
    {
      v17 = 0;
      -[NSObject startAtTime:error:](v11, "startAtTime:error:", &v17, 0.0);
      v16 = v17;
      if (!v16)
      {
LABEL_15:

        goto LABEL_16;
      }
      v13 = v16;
      _BKUILoggingFacility();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v13;
        v15 = "Unable to create start HapticsPlayer error: %@";
        goto LABEL_13;
      }
    }

    goto LABEL_15;
  }
  _BKUILoggingFacility();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v8;
    _os_log_impl(&dword_1DB281000, v9, OS_LOG_TYPE_DEFAULT, "Unable to create CHHapticPattern error: %@", buf, 0xCu);
  }
LABEL_16:

}

- (id)createEngine
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  id v9;
  uint8_t buf[4];
  NSObject *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C9DCC8], "capabilitiesForHardware");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "supportsHaptics") & 1) != 0 || (objc_msgSend(v2, "supportsAudio") & 1) != 0)
  {
    v9 = 0;
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C9DCC8]), "initAndReturnError:", &v9);
    v4 = v9;
    -[NSObject setMuteHapticsWhileRecordingAudio:](v3, "setMuteHapticsWhileRecordingAudio:", 0);
    -[NSObject setAutoShutdownEnabled:](v3, "setAutoShutdownEnabled:", 1);
    _BKUILoggingFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (!v3 || v4)
    {
      if (v6)
      {
        *(_DWORD *)buf = 138412290;
        v11 = v4;
        _os_log_impl(&dword_1DB281000, v5, OS_LOG_TYPE_DEFAULT, "Could not create CHHapticEngine: %@", buf, 0xCu);
      }

      v7 = 0;
    }
    else
    {
      if (v6)
      {
        *(_DWORD *)buf = 138412290;
        v11 = v3;
        _os_log_impl(&dword_1DB281000, v5, OS_LOG_TYPE_DEFAULT, "Created CHHapticEngine %@", buf, 0xCu);
      }

      v7 = v3;
    }

  }
  else
  {
    _BKUILoggingFacility();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB281000, v4, OS_LOG_TYPE_DEFAULT, "Haptics and audio not supported", buf, 2u);
    }
    v7 = 0;
  }

  return v7;
}

- (void)fadeCurrentSound:(double)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  CFTimeInterval v9;
  id v10;
  NSObject *v11;
  _QWORD v12[4];
  NSObject *v13;
  id v14;
  id v15[3];
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  dispatch_get_global_queue(2, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v7);

  dispatch_source_set_timer(v8, 0, 0xF4240uLL, 0);
  v9 = CACurrentMediaTime();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__BKUIPearlEnrollAudioManager_fadeCurrentSound_completion___block_invoke;
  v12[3] = &unk_1EA280E68;
  *(double *)&v15[1] = v9 * 1000.0;
  objc_copyWeak(v15, &location);
  v15[2] = *(id *)&a3;
  v13 = v8;
  v14 = v6;
  v10 = v6;
  v11 = v8;
  dispatch_source_set_event_handler(v11, v12);
  dispatch_resume(v11);

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
}

void __59__BKUIPearlEnrollAudioManager_fadeCurrentSound_completion___block_invoke(uint64_t a1)
{
  double v2;
  id *WeakRetained;
  double v4;
  void *v5;
  void *v6;
  double v7;
  uint64_t v8;
  id *v9;

  v2 = -(*(double *)(a1 + 56) - CACurrentMediaTime() * 1000.0);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v4 = fmax(fmin(v2 / *(double *)(a1 + 64), 1.0), 0.0);
  v9 = WeakRetained;
  objc_msgSend(WeakRetained[1], "audioEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mainMixerNode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v2 = 1.0 - v4;
  LODWORD(v7) = LODWORD(v2);
  objc_msgSend(v6, "setOutputVolume:", v7);

  if (v4 >= 1.0)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
    v8 = *(_QWORD *)(a1 + 40);
    if (v8)
      (*(void (**)(void))(v8 + 16))();
  }

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[BKUIPearlEnrollAudioManager cleanupHaptics](self, "cleanupHaptics");
  -[BKUIPearlAudioSession stop](self->_audioSession, "stop");
  -[BKUIPearlAudioSession audioEngine](self->_audioSession, "audioEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stop");

  -[BKUIPearlAudioSession audioEngine](self->_audioSession, "audioEngine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reset");

  v5.receiver = self;
  v5.super_class = (Class)BKUIPearlEnrollAudioManager;
  -[BKUIPearlEnrollAudioManager dealloc](&v5, sel_dealloc);
}

- (BKUIPearlEnrollControllerPreloadedState)preloadedState
{
  return self->_preloadedState;
}

- (void)setPreloadedState:(id)a3
{
  objc_storeStrong((id *)&self->_preloadedState, a3);
}

- (BKUIPearlAudioStateDelegate)stateDelegate
{
  return (BKUIPearlAudioStateDelegate *)objc_loadWeakRetained((id *)&self->_stateDelegate);
}

- (void)setStateDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_stateDelegate, a3);
}

- (CHHapticEngine)hapticsEngine
{
  return self->_hapticsEngine;
}

- (void)setHapticsEngine:(id)a3
{
  objc_storeStrong((id *)&self->_hapticsEngine, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hapticsEngine, 0);
  objc_destroyWeak((id *)&self->_stateDelegate);
  objc_storeStrong((id *)&self->_preloadedState, 0);
  objc_storeStrong((id *)&self->_audioSession, 0);
}

- (void)hapticEventWithEventType:withDelay:.cold.1()
{
  __assert_rtn("-[BKUIPearlEnrollAudioManager hapticEventWithEventType:withDelay:]", "BKUIPearlEnrollAudioManager.m", 260, "0");
}

@end
