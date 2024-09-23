@implementation ToneGenerator

- (double)maxPulseFrequency
{
  return 5.0;
}

- (double)minPulseFrequency
{
  return 1.0;
}

- (float)minPitchFactor
{
  return 1.0;
}

- (float)maxPitchFactor
{
  return 1.34;
}

- (BOOL)useSoundFeedback
{
  return self->_useSoundFeedback;
}

- (void)setUseSoundFeedback:(BOOL)a3
{
  AVAudioEngine *v4;
  id v5;
  AVAudioEngine *audioEngine;
  NSObject *v7;
  id v8;

  if (self->_useSoundFeedback != a3)
  {
    if (a3)
    {
      v8 = 0;
      -[ToneGenerator configureAudioEngineWithError:](self, "configureAudioEngineWithError:", &v8);
      v4 = (AVAudioEngine *)objc_claimAutoreleasedReturnValue();
      v5 = v8;
      audioEngine = self->_audioEngine;
      self->_audioEngine = v4;

      if (v5)
      {
        MAGLogCommon();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          -[ToneGenerator setUseSoundFeedback:].cold.1();

      }
      else
      {
        self->_useSoundFeedback = 1;
      }

    }
    else
    {
      -[AVAudioEngine stop](self->_audioEngine, "stop");
      self->_useSoundFeedback = 0;
    }
  }
}

- (BOOL)useHapticFeedback
{
  return self->_useHapticFeedback;
}

- (void)setUseHapticFeedback:(BOOL)a3
{
  void *v4;
  int v5;
  NSObject *hapticQueue;
  CHHapticEngine *hapticEngine;
  _QWORD v8[4];
  id v9;
  id location;
  _QWORD block[5];

  if (self->_useHapticFeedback != a3)
  {
    if (a3)
    {
      if (!self->_hapticEngineStarted)
      {
        objc_msgSend(MEMORY[0x24BDBF5C0], "capabilitiesForHardware");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v4, "supportsHaptics");

        if (v5)
        {
          hapticQueue = self->_hapticQueue;
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __38__ToneGenerator_setUseHapticFeedback___block_invoke;
          block[3] = &unk_24EF97C30;
          block[4] = self;
          dispatch_async(hapticQueue, block);
        }
      }
    }
    else if (self->_hapticEngineStarted)
    {
      objc_initWeak(&location, self);
      hapticEngine = self->_hapticEngine;
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __38__ToneGenerator_setUseHapticFeedback___block_invoke_6;
      v8[3] = &unk_24EF97C58;
      objc_copyWeak(&v9, &location);
      -[CHHapticEngine stopWithCompletionHandler:](hapticEngine, "stopWithCompletionHandler:", v8);
      self->_useHapticFeedback = 0;
      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
    }
  }
}

void __38__ToneGenerator_setUseHapticFeedback___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id location;
  id v19;
  id v20;

  v2 = objc_alloc(MEMORY[0x24BDBF5C0]);
  objc_msgSend(MEMORY[0x24BDB1858], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v4 = objc_msgSend(v2, "initWithAudioSession:error:", v3, &v20);
  v5 = v20;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 112);
  *(_QWORD *)(v6 + 112) = v4;

  if (v5)
  {
    MAGLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __38__ToneGenerator_setUseHapticFeedback___block_invoke_cold_2();
LABEL_7:

    return;
  }
  v9 = *(void **)(*(_QWORD *)(a1 + 32) + 112);
  v19 = 0;
  objc_msgSend(v9, "startAndReturnError:", &v19);
  v10 = v19;
  if (v10)
  {
    v5 = v10;
    MAGLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __38__ToneGenerator_setUseHapticFeedback___block_invoke_cold_1();
    goto LABEL_7;
  }
  objc_initWeak(&location, *(id *)(a1 + 32));
  v11 = *(void **)(*(_QWORD *)(a1 + 32) + 112);
  v12 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __38__ToneGenerator_setUseHapticFeedback___block_invoke_2;
  v16[3] = &unk_24EF97BE0;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v11, "setResetHandler:", v16);
  v13 = *(void **)(*(_QWORD *)(a1 + 32) + 112);
  v14[0] = v12;
  v14[1] = 3221225472;
  v14[2] = __38__ToneGenerator_setUseHapticFeedback___block_invoke_4;
  v14[3] = &unk_24EF97C08;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v13, "setStoppedHandler:", v14);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = 1;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 1;
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __38__ToneGenerator_setUseHapticFeedback___block_invoke_2(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "hapticEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v3, "startAndReturnError:", &v9);
  v4 = v9;

  if (v4)
  {
    MAGLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __38__ToneGenerator_setUseHapticFeedback___block_invoke_2_cold_1();

    v6 = objc_loadWeakRetained(v1);
    objc_msgSend(v6, "setUseHapticFeedback:", 0);

    v7 = objc_loadWeakRetained(v1);
    objc_msgSend(v7, "setHapticEngineStarted:", 0);
  }
  else
  {
    v8 = objc_loadWeakRetained(v1);
    objc_msgSend(v8, "setHapticEngineStarted:", 1);

    v7 = objc_loadWeakRetained(v1);
    objc_msgSend(v7, "setUseHapticFeedback:", 1);
  }

}

void __38__ToneGenerator_setUseHapticFeedback___block_invoke_4(uint64_t a1, uint64_t a2)
{
  id *v3;
  id WeakRetained;
  id v5;
  NSObject *v6;

  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setHapticEngineStarted:", 0);

  v5 = objc_loadWeakRetained(v3);
  objc_msgSend(v5, "setUseHapticFeedback:", 0);

  switch(a2)
  {
    case -1:
      MAGLogCommon();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __38__ToneGenerator_setUseHapticFeedback___block_invoke_4_cold_5();
      break;
    case 1:
      MAGLogCommon();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __38__ToneGenerator_setUseHapticFeedback___block_invoke_4_cold_2();
      break;
    case 2:
      MAGLogCommon();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __38__ToneGenerator_setUseHapticFeedback___block_invoke_4_cold_3();
      break;
    case 3:
      MAGLogCommon();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __38__ToneGenerator_setUseHapticFeedback___block_invoke_4_cold_4();
      break;
    default:
      MAGLogCommon();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __38__ToneGenerator_setUseHapticFeedback___block_invoke_4_cold_1();
      break;
  }

}

void __38__ToneGenerator_setUseHapticFeedback___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  void *v6;
  int v7;
  id v8;
  NSObject *v9;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v4);
  v6 = WeakRetained;
  if (v3)
  {
    v7 = objc_msgSend(WeakRetained, "hapticEngineStarted");

    if (v7)
    {
      v8 = objc_loadWeakRetained(v4);
      objc_msgSend(v8, "setUseHapticFeedback:", 1);

    }
    MAGLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __38__ToneGenerator_setUseHapticFeedback___block_invoke_6_cold_1();

  }
  else
  {
    objc_msgSend(WeakRetained, "setHapticEngineStarted:", 0);

  }
}

- (ToneGenerator)init
{
  char *v2;
  ToneGenerator *v3;
  void *v9;
  uint64_t v10;
  NSURL *audioFileURL;
  AVAudioEngine *audioEngine;
  CHHapticEngine *hapticEngine;
  NSTimer *timer;
  dispatch_queue_t v15;
  OS_dispatch_queue *hapticQueue;
  ToneGenerator *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)ToneGenerator;
  v2 = -[ToneGenerator init](&v19, sel_init);
  v3 = (ToneGenerator *)v2;
  if (v2)
  {
    v2[8] = 0;
    __asm { FMOV            V0.4S, #1.0 }
    *(_OWORD *)(v2 + 28) = _Q0;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URLForResource:withExtension:", CFSTR("ax_distance_midHigh"), CFSTR("aiff"));
    v10 = objc_claimAutoreleasedReturnValue();
    audioFileURL = v3->_audioFileURL;
    v3->_audioFileURL = (NSURL *)v10;

    audioEngine = v3->_audioEngine;
    v3->_audioEngine = 0;

    v3->_useHapticFeedback = 0;
    hapticEngine = v3->_hapticEngine;
    v3->_hapticEngine = 0;

    v3->_hapticEngineStarted = 0;
    v3->_detectionType = 0;
    timer = v3->_timer;
    v3->_timer = 0;

    v15 = dispatch_queue_create("Haptic Queue", 0);
    hapticQueue = v3->_hapticQueue;
    v3->_hapticQueue = (OS_dispatch_queue *)v15;

    v17 = v3;
  }

  return v3;
}

- (void)startPulse
{
  id v3;
  void *v4;
  NSTimer *v5;
  NSTimer *timer;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  _QWORD *v12;
  _QWORD *v13;
  id v14;
  _QWORD v15[4];
  _QWORD v16[5];
  id v17;
  id location;

  if (!self->_timer)
  {
    objc_initWeak(&location, self);
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x3032000000;
    v16[3] = __Block_byref_object_copy__0;
    v16[4] = __Block_byref_object_dispose__0;
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x2020000000;
    v15[3] = 0x3FC3333333333333;
    v3 = objc_alloc(MEMORY[0x24BDBCF40]);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x24BDAC760];
    v9 = 3221225472;
    v10 = __27__ToneGenerator_startPulse__block_invoke;
    v11 = &unk_24EF97C80;
    objc_copyWeak(&v14, &location);
    v12 = v16;
    v13 = v15;
    v5 = (NSTimer *)objc_msgSend(v3, "initWithFireDate:interval:repeats:block:", v4, 1, &v8, 0.001);
    timer = self->_timer;
    self->_timer = v5;

    objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop", v8, v9, v10, v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addTimer:forMode:", self->_timer, *MEMORY[0x24BDBCA90]);

    objc_destroyWeak(&v14);
    _Block_object_dispose(v15, 8);
    _Block_object_dispose(v16, 8);

    objc_destroyWeak(&location);
  }
}

void __27__ToneGenerator_startPulse__block_invoke(uint64_t a1)
{
  id WeakRetained;
  float v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  double v17;
  id v18;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v18 = WeakRetained;
    objc_msgSend(WeakRetained, "volume");
    if (v3 <= 0.0)
    {
      objc_msgSend(v18, "pause");
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v16 = *(void **)(v15 + 40);
      *(_QWORD *)(v15 + 40) = v14;

      objc_msgSend(v18, "maxPulseFrequency");
      v9 = a1 + 40;
      v13 = 1.0 / v17;
LABEL_10:
      *(double *)(*(_QWORD *)(*(_QWORD *)v9 + 8) + 24) = v13;
      WeakRetained = v18;
      goto LABEL_11;
    }
    objc_msgSend(v18, "minPulseFrequency");
    v5 = v4;
    objc_msgSend(v18, "pulseFrequency");
    v7 = v6;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "timeIntervalSinceNow");
    v9 = a1 + 40;
    WeakRetained = v18;
    if (*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) <= -v8)
    {
      if (v5 < v7)
        v5 = v7;
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

      objc_msgSend(v18, "playOnePulse");
      v13 = 0.0769230769;
      if (v5 <= 13.0)
        v13 = 1.0 / v5;
      goto LABEL_10;
    }
  }
LABEL_11:

}

- (void)stopPulse
{
  NSTimer *timer;
  NSTimer *v4;

  timer = self->_timer;
  if (timer)
  {
    -[NSTimer invalidate](timer, "invalidate");
    v4 = self->_timer;
    self->_timer = 0;

    -[ToneGenerator pause](self, "pause");
  }
}

- (id)configureAudioEngineWithError:(id *)a3
{
  id v5;
  AVAudioPlayerNode *v6;
  AVAudioPlayerNode *player;
  AVAudioMixerNode *v8;
  AVAudioMixerNode *mixer;
  AVAudioMixerNode *v10;
  AVAudioPlayerNode *v11;
  void *v12;
  int v13;
  id v14;

  v5 = objc_alloc_init(MEMORY[0x24BDB1800]);
  v6 = (AVAudioPlayerNode *)objc_alloc_init(MEMORY[0x24BDB1850]);
  player = self->_player;
  self->_player = v6;

  objc_msgSend(v5, "mainMixerNode");
  v8 = (AVAudioMixerNode *)objc_claimAutoreleasedReturnValue();
  mixer = self->_mixer;
  self->_mixer = v8;

  objc_msgSend(v5, "attachNode:", self->_player);
  v11 = self->_player;
  v10 = self->_mixer;
  -[AVAudioPlayerNode outputFormatForBus:](v11, "outputFormatForBus:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "connect:to:format:", v11, v10, v12);

  v13 = objc_msgSend(v5, "startAndReturnError:", a3);
  v14 = 0;
  if (v13)
    v14 = v5;

  return v14;
}

- (void)playOnePulse
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v7;

  *(float *)&v4 = self->_rightBalance;
  *(float *)&v2 = self->_pitchFactor;
  *(float *)&v5 = self->_volume;
  *(float *)&v3 = self->_leftBalance;
  -[ToneGenerator playSoundWithPitchFactor:leftBalance:rightBalance:volume:loop:](self, "playSoundWithPitchFactor:leftBalance:rightBalance:volume:loop:", 0, v2, v3, v4, v5);
  *(float *)&v7 = self->_volume;
  -[ToneGenerator playHapticsWithVolume:pulseDuration:](self, "playHapticsWithVolume:pulseDuration:", v7, self->_pulseDuration);
}

- (void)pause
{
  if (!-[AVAudioEngine isRunning](self->_audioEngine, "isRunning"))
    -[AVAudioEngine startAndReturnError:](self->_audioEngine, "startAndReturnError:", 0);
  -[AVAudioPlayerNode pause](self->_player, "pause");
}

- (void)configurePlayerWithPitchFactor:(float)a3 leftBalance:(float)a4 rightBalance:(float)a5 volume:(float)a6 loop:(BOOL)a7
{
  void *v12;
  double v13;
  double v14;
  id v15;
  NSURL *audioFileURL;
  void *v17;
  id v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  id v22;
  void *v23;
  NSObject *v24;
  float v25;
  float v26;
  uint64_t v27;
  id v28;
  void *v29;
  AVAudioPCMBuffer *v30;
  AVAudioPCMBuffer *buffer;
  void *v32;
  unsigned int v33;
  uint64_t v34;
  float *const *v35;
  float *v36;
  float v37;
  uint64_t v38;
  uint64x2_t v39;
  int64x2_t v40;
  float *v41;
  int64x2_t v42;
  int32x2_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  float v48;
  uint64_t v49;
  float *v50;
  float v51;
  signed int v52;
  float v53;
  id v54;
  id v55;

  if (self->_audioFileURL)
  {
    -[AVAudioMixerNode outputFormatForBus:](self->_mixer, "outputFormatForBus:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sampleRate");
    v14 = v13;

    v15 = objc_alloc(MEMORY[0x24BDB1810]);
    audioFileURL = self->_audioFileURL;
    v55 = 0;
    v17 = (void *)objc_msgSend(v15, "initForReading:error:", audioFileURL, &v55);
    v18 = v55;
    if (v18)
    {
      v19 = v18;
      MAGLogCommon();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[ToneGenerator configurePlayerWithPitchFactor:leftBalance:rightBalance:volume:loop:].cold.2();
    }
    else
    {
      v21 = objc_msgSend(v17, "length");
      v22 = objc_alloc(MEMORY[0x24BDB1838]);
      objc_msgSend(v17, "processingFormat");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v22, "initWithPCMFormat:frameCapacity:", v23, v21);

      -[NSObject setFrameLength:](v20, "setFrameLength:", v21);
      v54 = 0;
      objc_msgSend(v17, "readIntoBuffer:error:", v20, &v54);
      v19 = v54;
      if (v19)
      {
        MAGLogCommon();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          -[ToneGenerator configurePlayerWithPitchFactor:leftBalance:rightBalance:volume:loop:].cold.1();

      }
      else
      {
        v25 = v14;
        v26 = (float)v21 / a3;
        v27 = v26;
        self->_pulseDuration = (float)((float)v26 / v25);
        v28 = objc_alloc(MEMORY[0x24BDB1838]);
        objc_msgSend(v17, "processingFormat");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (AVAudioPCMBuffer *)objc_msgSend(v28, "initWithPCMFormat:frameCapacity:", v29, v27);
        buffer = self->_buffer;
        self->_buffer = v30;

        -[AVAudioPCMBuffer setFrameLength:](self->_buffer, "setFrameLength:", v27);
        -[AVAudioMixerNode outputFormatForBus:](self->_mixer, "outputFormatForBus:", 0);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "channelCount");

        if (v33)
        {
          v34 = -[NSObject floatChannelData](v20, "floatChannelData");
          v35 = -[AVAudioPCMBuffer floatChannelData](self->_buffer, "floatChannelData");
          v36 = (float *)malloc_type_malloc(4 * v33, 0x100004052888210uLL);
          if (v33 == 1)
          {
            if (a4 >= a5)
              v37 = a4;
            else
              v37 = a5;
            *v36 = v37 * a6;
          }
          else
          {
            v38 = (v33 + 1) & 0x1FFFFFFFELL;
            v39 = (uint64x2_t)vdupq_n_s64((unint64_t)v33 - 1);
            v40 = (int64x2_t)xmmword_227593A00;
            v41 = v36 + 1;
            v42 = vdupq_n_s64(2uLL);
            do
            {
              v43 = vmovn_s64((int64x2_t)vcgeq_u64(v39, (uint64x2_t)v40));
              if ((v43.i8[0] & 1) != 0)
                *(v41 - 1) = a4 * a6;
              if ((v43.i8[4] & 1) != 0)
                *v41 = a5 * a6;
              v40 = vaddq_s64(v40, v42);
              v41 += 2;
              v38 -= 2;
            }
            while (v38);
          }
          v44 = 0;
          v45 = (v21 - 1);
          if (v33 <= 1)
            v46 = 1;
          else
            v46 = v33;
          do
          {
            if ((_DWORD)v27)
            {
              v47 = 0;
              v48 = v36[v44];
              v49 = *(_QWORD *)(v34 + 8 * v44);
              v50 = v35[v44];
              do
              {
                v51 = (float)(int)v47 * a3;
                if (v51 >= (float)v45)
                {
                  v53 = *(float *)(v49 + 4 * v45);
                }
                else
                {
                  v52 = vcvtms_s32_f32(v51);
                  v53 = *(float *)(v49 + 4 * v52)
                      + (float)((float)(*(float *)(v49 + 4 * (int)vcvtps_s32_f32(v51)) - *(float *)(v49 + 4 * v52))
                              * (float)(v51 - (float)(int)floorf(v51)));
                }
                v50[v47++] = v48 * v53;
              }
              while (v27 != v47);
            }
            ++v44;
          }
          while (v44 != v46);
          free(v36);
        }
      }
    }

  }
}

- (void)playSoundWithPitchFactor:(float)a3 leftBalance:(float)a4 rightBalance:(float)a5 volume:(float)a6 loop:(BOOL)a7
{
  NSObject *hapticQueue;
  _QWORD block[4];
  id v15;
  float v16;
  float v17;
  float v18;
  float v19;
  BOOL v20;
  id location;

  objc_initWeak(&location, self);
  hapticQueue = self->_hapticQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __79__ToneGenerator_playSoundWithPitchFactor_leftBalance_rightBalance_volume_loop___block_invoke;
  block[3] = &unk_24EF97CC8;
  objc_copyWeak(&v15, &location);
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  dispatch_async(hapticQueue, block);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __79__ToneGenerator_playSoundWithPitchFactor_leftBalance_rightBalance_volume_loop___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  int v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  char v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  NSObject *v25;
  id v26;
  id v27;

  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = objc_msgSend(WeakRetained, "useSoundFeedback");

  if (v4)
  {
    v5 = objc_loadWeakRetained(v2);
    LODWORD(v6) = *(_DWORD *)(a1 + 40);
    LODWORD(v7) = *(_DWORD *)(a1 + 44);
    LODWORD(v8) = *(_DWORD *)(a1 + 48);
    LODWORD(v9) = *(_DWORD *)(a1 + 52);
    objc_msgSend(v5, "configurePlayerWithPitchFactor:leftBalance:rightBalance:volume:loop:", *(unsigned __int8 *)(a1 + 56), v6, v7, v8, v9);

    v10 = objc_loadWeakRetained(v2);
    objc_msgSend(v10, "buffer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = objc_loadWeakRetained(v2);
      objc_msgSend(v12, "audioEngine");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isRunning");

      if ((v14 & 1) != 0)
      {
        if (*(_BYTE *)(a1 + 56))
          v15 = 5;
        else
          v15 = 4;
        v16 = objc_loadWeakRetained(v2);
        objc_msgSend(v16, "player");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_loadWeakRetained(v2);
        objc_msgSend(v18, "buffer");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "scheduleBuffer:atTime:options:completionHandler:", v19, 0, v15, &__block_literal_global_1);

        v26 = objc_loadWeakRetained(v2);
        objc_msgSend(v26, "player");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "play");

      }
      else
      {
        v21 = objc_loadWeakRetained(v2);
        v27 = 0;
        objc_msgSend(v21, "configureAudioEngineWithError:", &v27);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v27;
        v24 = objc_loadWeakRetained(v2);
        objc_msgSend(v24, "setAudioEngine:", v22);

        if (v23)
        {
          MAGLogCommon();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            -[ToneGenerator setUseSoundFeedback:].cold.1();

        }
      }
    }
  }
}

- (id)configureHapticPlayerWithVolume:(float)a3 duration:(double)a4 error:(id *)a5
{
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t detectionType;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  ToneGenerator *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  double v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  double v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v74;
  void *v75;
  ToneGenerator *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  _QWORD v82[2];
  _QWORD v83[2];
  void *v84;
  _QWORD v85[5];
  _QWORD v86[5];
  uint64_t v87;
  void *v88;
  void *v89;
  uint64_t v90;
  void *v91;
  _QWORD v92[2];
  _QWORD v93[2];
  void *v94;
  _QWORD v95[5];
  _QWORD v96[5];
  uint64_t v97;
  void *v98;
  void *v99;
  uint64_t v100;
  void *v101;
  _QWORD v102[2];
  _QWORD v103[2];
  void *v104;
  _QWORD v105[5];
  _QWORD v106[5];
  uint64_t v107;
  void *v108;
  void *v109;
  uint64_t v110;
  void *v111;
  _QWORD v112[2];
  _QWORD v113[2];
  void *v114;
  _QWORD v115[5];
  _QWORD v116[5];
  uint64_t v117;
  void *v118;
  void *v119;
  uint64_t v120;
  void *v121;
  _QWORD v122[2];
  _QWORD v123[2];
  void *v124;
  _QWORD v125[4];
  _QWORD v126[4];
  uint64_t v127;
  void *v128;
  void *v129;
  uint64_t v130;
  _QWORD v131[3];

  v131[1] = *MEMORY[0x24BDAC8D0];
  v130 = *MEMORY[0x24BDBF598];
  v127 = *MEMORY[0x24BDBF568];
  v8 = *MEMORY[0x24BDBF560];
  v9 = *MEMORY[0x24BDBF5A0];
  v125[0] = *MEMORY[0x24BDBF580];
  v125[1] = v9;
  v126[0] = v8;
  v126[1] = &unk_24EFC1828;
  v125[2] = *MEMORY[0x24BDBF570];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v126[2] = v10;
  v125[3] = *MEMORY[0x24BDBF578];
  v11 = *MEMORY[0x24BDBF588];
  v123[0] = *MEMORY[0x24BDBF540];
  v12 = *MEMORY[0x24BDBF590];
  v122[0] = v11;
  v122[1] = v12;
  *(float *)&v13 = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v123[1] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v123, v122, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v124 = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v124, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v126[3] = v16;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v126, v125, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v128 = v17;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v128, &v127, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v129 = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v129, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v131[0] = v19;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v131, &v130, 1);
  v78 = (void *)objc_claimAutoreleasedReturnValue();

  detectionType = self->_detectionType;
  v21 = (_QWORD *)MEMORY[0x24BDBF548];
  v77 = self;
  if (detectionType == 1)
  {
    v120 = *MEMORY[0x24BDBF598];
    v117 = *MEMORY[0x24BDBF568];
    v22 = *MEMORY[0x24BDBF560];
    v23 = *MEMORY[0x24BDBF5A0];
    v115[0] = *MEMORY[0x24BDBF580];
    v115[1] = v23;
    v116[0] = v22;
    v116[1] = &unk_24EFC1828;
    v115[2] = *MEMORY[0x24BDBF570];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v116[2] = v74;
    v115[3] = *MEMORY[0x24BDBF578];
    v24 = *MEMORY[0x24BDBF588];
    v113[0] = *MEMORY[0x24BDBF540];
    v25 = *MEMORY[0x24BDBF590];
    v112[0] = v24;
    v112[1] = v25;
    *(float *)&v26 = a3;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v113[1] = v27;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v113, v112, 2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v114 = v28;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v114, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v115[4] = *v21;
    v116[3] = v29;
    v116[4] = &unk_24EFC1838;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v116, v115, 5);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v118 = v30;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v118, &v117, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v119 = v31;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v119, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v121 = v32;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v121, &v120, 1);
    v33 = objc_claimAutoreleasedReturnValue();

    detectionType = v77->_detectionType;
    v34 = (void *)v33;
  }
  else
  {
    v34 = v78;
  }
  if (detectionType == 2)
  {
    v110 = *MEMORY[0x24BDBF598];
    v107 = *MEMORY[0x24BDBF568];
    v35 = *MEMORY[0x24BDBF560];
    v36 = *MEMORY[0x24BDBF5A0];
    v105[0] = *MEMORY[0x24BDBF580];
    v105[1] = v36;
    v106[0] = v35;
    v106[1] = &unk_24EFC1828;
    v105[2] = *MEMORY[0x24BDBF570];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v106[2] = v75;
    v105[3] = *MEMORY[0x24BDBF578];
    v37 = *MEMORY[0x24BDBF588];
    v103[0] = *MEMORY[0x24BDBF540];
    v38 = *MEMORY[0x24BDBF590];
    v102[0] = v37;
    v102[1] = v38;
    *(float *)&v39 = a3;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v39);
    v79 = v34;
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v103[1] = v40;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v103, v102, 2);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = v41;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v104, 1);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v105[4] = *MEMORY[0x24BDBF548];
    v106[3] = v42;
    v106[4] = &unk_24EFC1848;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v106, v105, 5);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = v43;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v108, &v107, 1);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = v44;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v109, 1);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v111 = v45;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v111, &v110, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v46 = v77;
    detectionType = v77->_detectionType;
  }
  else
  {
    v46 = v77;
  }
  if (detectionType == 3)
  {
    v100 = *MEMORY[0x24BDBF598];
    v97 = *MEMORY[0x24BDBF568];
    v47 = *MEMORY[0x24BDBF560];
    v48 = *MEMORY[0x24BDBF5A0];
    v95[0] = *MEMORY[0x24BDBF580];
    v95[1] = v48;
    v96[0] = v47;
    v96[1] = &unk_24EFC1828;
    v95[2] = *MEMORY[0x24BDBF570];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
    v80 = v34;
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v96[2] = v49;
    v95[3] = *MEMORY[0x24BDBF578];
    v50 = *MEMORY[0x24BDBF588];
    v93[0] = *MEMORY[0x24BDBF540];
    v51 = *MEMORY[0x24BDBF590];
    v92[0] = v50;
    v92[1] = v51;
    *(float *)&v52 = a3;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v93[1] = v53;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v93, v92, 2);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = v54;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v94, 1);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v95[4] = *MEMORY[0x24BDBF548];
    v96[3] = v55;
    v96[4] = &unk_24EFC1858;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v96, v95, 5);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = v56;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v98, &v97, 1);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = v57;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v99, 1);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = v58;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v101, &v100, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v46 = v77;
    detectionType = v77->_detectionType;
  }
  if (detectionType == 4)
  {
    v90 = *MEMORY[0x24BDBF598];
    v87 = *MEMORY[0x24BDBF568];
    v59 = *MEMORY[0x24BDBF560];
    v60 = *MEMORY[0x24BDBF5A0];
    v85[0] = *MEMORY[0x24BDBF580];
    v85[1] = v60;
    v86[0] = v59;
    v86[1] = &unk_24EFC1828;
    v85[2] = *MEMORY[0x24BDBF570];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
    v81 = v34;
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v86[2] = v61;
    v85[3] = *MEMORY[0x24BDBF578];
    v62 = *MEMORY[0x24BDBF588];
    v83[0] = *MEMORY[0x24BDBF540];
    v63 = *MEMORY[0x24BDBF590];
    v82[0] = v62;
    v82[1] = v63;
    *(float *)&v64 = a3;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v83[1] = v65;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v83, v82, 2);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = v66;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v84, 1);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v85[4] = *MEMORY[0x24BDBF548];
    v86[3] = v67;
    v86[4] = &unk_24EFC1868;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v86, v85, 5);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = v68;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v88, &v87, 1);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = v69;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v89, 1);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = v70;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v91, &v90, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v46 = v77;
  }
  v71 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBF5E0]), "initWithDictionary:error:", v34, a5);
  if (v71)
  {
    -[CHHapticEngine createPlayerWithPattern:error:](v46->_hapticEngine, "createPlayerWithPattern:error:", v71, a5);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v72 = 0;
  }

  return v72;
}

- (void)playHapticsWithVolume:(float)a3 pulseDuration:(double)a4
{
  NSObject *hapticQueue;
  _QWORD v8[4];
  id v9[2];
  float v10;
  id location;

  objc_initWeak(&location, self);
  hapticQueue = self->_hapticQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __53__ToneGenerator_playHapticsWithVolume_pulseDuration___block_invoke;
  v8[3] = &unk_24EF97CF0;
  objc_copyWeak(v9, &location);
  v10 = a3;
  v9[1] = *(id *)&a4;
  dispatch_async(hapticQueue, v8);
  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

void __53__ToneGenerator_playHapticsWithVolume_pulseDuration___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  int v4;
  id v5;
  char v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  double v13;
  double v14;
  NSObject *v15;
  id v16;
  id v17;

  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = objc_msgSend(WeakRetained, "useHapticFeedback");

  if (v4)
  {
    v5 = objc_loadWeakRetained(v2);
    v6 = objc_msgSend(v5, "hapticEngineStarted");

    if ((v6 & 1) == 0)
    {
      v7 = objc_loadWeakRetained(v2);
      objc_msgSend(v7, "hapticEngine");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 0;
      objc_msgSend(v8, "startAndReturnError:", &v17);
      v9 = v17;

      if (v9)
      {
        MAGLogCommon();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          __53__ToneGenerator_playHapticsWithVolume_pulseDuration___block_invoke_cold_3();
LABEL_12:

        return;
      }
      v11 = objc_loadWeakRetained(v2);
      objc_msgSend(v11, "setHapticEngineStarted:", 1);

    }
    v12 = objc_loadWeakRetained(v2);
    LODWORD(v13) = *(_DWORD *)(a1 + 48);
    v14 = *(double *)(a1 + 40);
    v16 = 0;
    objc_msgSend(v12, "configureHapticPlayerWithVolume:duration:error:", &v16, v13, v14);
    v10 = objc_claimAutoreleasedReturnValue();
    v9 = v16;

    if (v9)
    {
      MAGLogCommon();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        __53__ToneGenerator_playHapticsWithVolume_pulseDuration___block_invoke_cold_2();

    }
    else
    {
      -[NSObject startAtTime:error:](v10, "startAtTime:error:", 0, 0.0);
    }
    goto LABEL_12;
  }
}

- (double)pulseFrequency
{
  return self->_pulseFrequency;
}

- (void)setPulseFrequency:(double)a3
{
  self->_pulseFrequency = a3;
}

- (float)volume
{
  return self->_volume;
}

- (void)setVolume:(float)a3
{
  self->_volume = a3;
}

- (float)leftBalance
{
  return self->_leftBalance;
}

- (void)setLeftBalance:(float)a3
{
  self->_leftBalance = a3;
}

- (float)rightBalance
{
  return self->_rightBalance;
}

- (void)setRightBalance:(float)a3
{
  self->_rightBalance = a3;
}

- (float)pitchFactor
{
  return self->_pitchFactor;
}

- (void)setPitchFactor:(float)a3
{
  self->_pitchFactor = a3;
}

- (NSURL)audioFileURL
{
  return self->_audioFileURL;
}

- (void)setAudioFileURL:(id)a3
{
  objc_storeStrong((id *)&self->_audioFileURL, a3);
}

- (unint64_t)detectionType
{
  return self->_detectionType;
}

- (void)setDetectionType:(unint64_t)a3
{
  self->_detectionType = a3;
}

- (AVAudioEngine)audioEngine
{
  return self->_audioEngine;
}

- (void)setAudioEngine:(id)a3
{
  objc_storeStrong((id *)&self->_audioEngine, a3);
}

- (AVAudioPlayerNode)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_player, a3);
}

- (AVAudioMixerNode)mixer
{
  return self->_mixer;
}

- (void)setMixer:(id)a3
{
  objc_storeStrong((id *)&self->_mixer, a3);
}

- (AVAudioPCMBuffer)buffer
{
  return self->_buffer;
}

- (void)setBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_buffer, a3);
}

- (double)pulseDuration
{
  return self->_pulseDuration;
}

- (void)setPulseDuration:(double)a3
{
  self->_pulseDuration = a3;
}

- (CHHapticEngine)hapticEngine
{
  return self->_hapticEngine;
}

- (void)setHapticEngine:(id)a3
{
  objc_storeStrong((id *)&self->_hapticEngine, a3);
}

- (BOOL)hapticEngineStarted
{
  return self->_hapticEngineStarted;
}

- (void)setHapticEngineStarted:(BOOL)a3
{
  self->_hapticEngineStarted = a3;
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_hapticEngine, 0);
  objc_storeStrong((id *)&self->_buffer, 0);
  objc_storeStrong((id *)&self->_mixer, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_audioEngine, 0);
  objc_storeStrong((id *)&self->_audioFileURL, 0);
  objc_storeStrong((id *)&self->_hapticQueue, 0);
}

- (void)setUseSoundFeedback:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_2272F4000, v0, v1, "Cannot start AVAudioEngine: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __38__ToneGenerator_setUseHapticFeedback___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_2272F4000, v0, v1, "Cannot start CHHapticEngine: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __38__ToneGenerator_setUseHapticFeedback___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_2272F4000, v0, v1, "Cannot initialize CHHapticEngine: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __38__ToneGenerator_setUseHapticFeedback___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_2272F4000, v0, v1, "Cannot restart CHHapticEngine: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __38__ToneGenerator_setUseHapticFeedback___block_invoke_4_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_2272F4000, v0, v1, "CHHapticEngine stopped: Unknown reason", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __38__ToneGenerator_setUseHapticFeedback___block_invoke_4_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_2272F4000, v0, v1, "CHHapticEngine stopped: Audio Session Interrupt", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __38__ToneGenerator_setUseHapticFeedback___block_invoke_4_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_2272F4000, v0, v1, "CHHapticEngine stopped: Application Suspended", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __38__ToneGenerator_setUseHapticFeedback___block_invoke_4_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_2272F4000, v0, v1, "CHHapticEngine stopped: Idle Timeout", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __38__ToneGenerator_setUseHapticFeedback___block_invoke_4_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_2272F4000, v0, v1, "CHHapticEngine stopped: System Error", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __38__ToneGenerator_setUseHapticFeedback___block_invoke_6_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_2272F4000, v0, v1, "Cannot stop CHHapticEngine: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)configurePlayerWithPitchFactor:leftBalance:rightBalance:volume:loop:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_2272F4000, v0, v1, "Cannot read audio file into buffer: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)configurePlayerWithPitchFactor:leftBalance:rightBalance:volume:loop:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_2272F4000, v0, v1, "Cannot read audio file: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __79__ToneGenerator_playSoundWithPitchFactor_leftBalance_rightBalance_volume_loop___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_2272F4000, v0, v1, "Could not play player with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __53__ToneGenerator_playHapticsWithVolume_pulseDuration___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_2272F4000, v0, v1, "Cannot start haptic player: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __53__ToneGenerator_playHapticsWithVolume_pulseDuration___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_2272F4000, v0, v1, "Cannot configure haptic player: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __53__ToneGenerator_playHapticsWithVolume_pulseDuration___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_2272F4000, v0, v1, "Cannot restart haptic engine: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
