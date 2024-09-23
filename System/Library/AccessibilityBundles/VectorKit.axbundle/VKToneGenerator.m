@implementation VKToneGenerator

- (double)maxPulseFrequency
{
  return 2.5;
}

- (double)minPulseFrequency
{
  return 0.5;
}

- (float)minPitchFactor
{
  return 1.0;
}

- (float)maxPitchFactor
{
  return 1.34;
}

- (BOOL)usesSoundFeedback
{
  return self->_usesSoundFeedback && UIAccessibilityIsVoiceOverRunning();
}

- (void)setUsesSoundFeedback:(BOOL)a3
{
  AVAudioEngine *v4;
  id v5;
  AVAudioEngine *audioEngine;
  NSObject *v7;
  id v8;

  if (self->_usesSoundFeedback != a3)
  {
    if (a3)
    {
      v8 = 0;
      -[VKToneGenerator configureAudioEngineWithError:](self, "configureAudioEngineWithError:", &v8);
      v4 = (AVAudioEngine *)objc_claimAutoreleasedReturnValue();
      v5 = v8;
      audioEngine = self->_audioEngine;
      self->_audioEngine = v4;

      if (v5)
      {
        AXLogCommon();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
          -[VKToneGenerator setUsesSoundFeedback:].cold.1();

      }
      else
      {
        self->_usesSoundFeedback = 1;
      }

    }
    else
    {
      -[AVAudioEngine stop](self->_audioEngine, "stop");
      self->_usesSoundFeedback = 0;
    }
  }
}

- (VKToneGenerator)initWithHapticEngineDelegate:(id)a3
{
  id v4;
  char *v5;
  VKToneGenerator *v6;
  void *v12;
  uint64_t v13;
  NSURL *audioFileURL;
  AVAudioEngine *audioEngine;
  NSTimer *timer;
  VKToneGenerator *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)VKToneGenerator;
  v5 = -[VKToneGenerator init](&v19, sel_init);
  v6 = (VKToneGenerator *)v5;
  if (v5)
  {
    v5[8] = 0;
    __asm { FMOV            V0.4S, #1.0 }
    *(_OWORD *)(v5 + 12) = _Q0;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "URLForResource:withExtension:", CFSTR("3beacon"), CFSTR("aiff"));
    v13 = objc_claimAutoreleasedReturnValue();
    audioFileURL = v6->_audioFileURL;
    v6->_audioFileURL = (NSURL *)v13;

    audioEngine = v6->_audioEngine;
    v6->_audioEngine = 0;

    timer = v6->_timer;
    v6->_timer = 0;

    objc_storeWeak((id *)&v6->_hapticEngineDelegate, v4);
    v17 = v6;

  }
  return v6;
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

  if (!UIAccessibilityIsVoiceOverRunning())
    -[VKToneGenerator stopPulse](self, "stopPulse");
  if (!self->_timer)
  {
    objc_initWeak(&location, self);
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x3032000000;
    v16[3] = __Block_byref_object_copy_;
    v16[4] = __Block_byref_object_dispose_;
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
    v10 = __29__VKToneGenerator_startPulse__block_invoke;
    v11 = &unk_2503C4CD0;
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

void __29__VKToneGenerator_startPulse__block_invoke(uint64_t a1)
{
  id WeakRetained;
  float v3;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v22 = WeakRetained;
    objc_msgSend(WeakRetained, "volume");
    if (v3 <= 0.0)
    {
      objc_msgSend(v22, "pause");
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

      objc_msgSend(v22, "maxPulseFrequency");
      v12 = v11;
      v13 = a1 + 40;
LABEL_14:
      WeakRetained = v22;
      *(double *)(*(_QWORD *)(*(_QWORD *)v13 + 8) + 24) = 1.0 / v12;
      goto LABEL_15;
    }
    objc_msgSend(v22, "minPulseFrequency");
    v5 = v4;
    objc_msgSend(v22, "pulseFrequency");
    if (v5 <= v6)
      objc_msgSend(v22, "pulseFrequency");
    else
      objc_msgSend(v22, "minPulseFrequency");
    v12 = 13.0;
    if (v7 <= 13.0)
    {
      objc_msgSend(v22, "minPulseFrequency");
      v15 = v14;
      objc_msgSend(v22, "pulseFrequency");
      if (v15 <= v16)
        objc_msgSend(v22, "pulseFrequency");
      else
        objc_msgSend(v22, "minPulseFrequency");
      v12 = v17;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "timeIntervalSinceNow");
    v13 = a1 + 40;
    WeakRetained = v22;
    if (*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) <= -v18)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v21 = *(void **)(v20 + 40);
      *(_QWORD *)(v20 + 40) = v19;

      objc_msgSend(v22, "playOnePulse");
      goto LABEL_14;
    }
  }
LABEL_15:

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

    -[VKToneGenerator pause](self, "pause");
  }
}

- (id)configureAudioEngineWithError:(id *)a3
{
  id v5;
  AVAudioPlayerNode *v6;
  AVAudioPlayerNode *player;
  AVAudioMixerNode *v8;
  AVAudioMixerNode *mixer;
  id v10;

  v5 = objc_alloc_init(MEMORY[0x24BDB1800]);
  v6 = (AVAudioPlayerNode *)objc_alloc_init(MEMORY[0x24BDB1850]);
  player = self->_player;
  self->_player = v6;

  objc_msgSend(v5, "mainMixerNode");
  v8 = (AVAudioMixerNode *)objc_claimAutoreleasedReturnValue();
  mixer = self->_mixer;
  self->_mixer = v8;

  objc_msgSend(v5, "attachNode:", self->_player);
  if (objc_msgSend(v5, "startAndReturnError:", a3))
    v10 = v5;
  else
    v10 = 0;

  return v10;
}

- (void)playOnePulse
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v7;
  id v8;

  *(float *)&v4 = self->_rightBalance;
  *(float *)&v2 = self->_pitchFactor;
  *(float *)&v5 = self->_volume;
  *(float *)&v3 = self->_leftBalance;
  -[VKToneGenerator playSoundWithPitchFactor:leftBalance:rightBalance:volume:loop:](self, "playSoundWithPitchFactor:leftBalance:rightBalance:volume:loop:", 0, v2, v3, v4, v5);
  if (self->_shouldPlayHapticPulse)
  {
    -[VKToneGenerator hapticEngineDelegate](self, "hapticEngineDelegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    *(float *)&v7 = self->_volume;
    objc_msgSend(v8, "playSingleHapticPulseWithIntensity:duration:", v7, self->_pulseDuration);

  }
}

- (void)pause
{
  if (!-[AVAudioEngine isRunning](self->_audioEngine, "isRunning"))
    -[AVAudioEngine startAndReturnError:](self->_audioEngine, "startAndReturnError:", 0);
  -[AVAudioPlayerNode pause](self->_player, "pause");
}

- (void)configurePlayerWithPitchFactor:(float)a3 leftBalance:(float)a4 rightBalance:(float)a5 volume:(float)a6 loop:(BOOL)a7
{
  id v12;
  NSURL *audioFileURL;
  void *v14;
  id v15;
  id v16;
  NSObject *v17;
  double v18;
  double v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  NSObject *v24;
  float v25;
  float v26;
  uint64_t v27;
  id v28;
  void *v29;
  AVAudioPCMBuffer *v30;
  AVAudioPCMBuffer *buffer;
  unsigned int v32;
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
    v12 = objc_alloc(MEMORY[0x24BDB1810]);
    audioFileURL = self->_audioFileURL;
    v55 = 0;
    v14 = (void *)objc_msgSend(v12, "initForReading:error:", audioFileURL, &v55);
    v15 = v55;
    if (v15)
    {
      v16 = v15;
      AXLogCommon();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        -[VKToneGenerator configurePlayerWithPitchFactor:leftBalance:rightBalance:volume:loop:].cold.3();
      goto LABEL_35;
    }
    objc_msgSend(v14, "processingFormat");
    v17 = objc_claimAutoreleasedReturnValue();
    -[AVAudioEngine connect:to:format:](self->_audioEngine, "connect:to:format:", self->_player, self->_mixer, v17);
    -[NSObject sampleRate](v17, "sampleRate");
    v19 = v18;
    v20 = objc_msgSend(v14, "length");
    v21 = objc_alloc(MEMORY[0x24BDB1838]);
    objc_msgSend(v14, "processingFormat");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v21, "initWithPCMFormat:frameCapacity:", v22, v20);

    objc_msgSend(v23, "setFrameLength:", v20);
    v54 = 0;
    objc_msgSend(v14, "readIntoBuffer:error:", v23, &v54);
    v16 = v54;
    if (v16)
    {
      AXLogCommon();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
        -[VKToneGenerator configurePlayerWithPitchFactor:leftBalance:rightBalance:volume:loop:].cold.2();
    }
    else
    {
      v25 = v19;
      v26 = (float)v20 / a3;
      v27 = v26;
      self->_pulseDuration = (float)((float)v26 / v25);
      v28 = objc_alloc(MEMORY[0x24BDB1838]);
      objc_msgSend(v14, "processingFormat");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (AVAudioPCMBuffer *)objc_msgSend(v28, "initWithPCMFormat:frameCapacity:", v29, v27);
      buffer = self->_buffer;
      self->_buffer = v30;

      -[AVAudioPCMBuffer setFrameLength:](self->_buffer, "setFrameLength:", v27);
      v32 = -[NSObject channelCount](v17, "channelCount");
      if (v32)
      {
        v33 = v32;
        v34 = objc_msgSend(v23, "floatChannelData");
        v35 = -[AVAudioPCMBuffer floatChannelData](self->_buffer, "floatChannelData");
        v36 = (float *)malloc_type_malloc(4 * v33, 0x100004052888210uLL);
        if (v33 == 1)
        {
          if (a4 <= a5)
            v37 = a5;
          else
            v37 = a4;
          *v36 = v37 * a6;
        }
        else
        {
          v38 = (v33 + 1) & 0x1FFFFFFFELL;
          v39 = (uint64x2_t)vdupq_n_s64((unint64_t)v33 - 1);
          v40 = (int64x2_t)xmmword_232B5BBD0;
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
        v45 = (v20 - 1);
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
        goto LABEL_34;
      }
      AXLogCommon();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
        -[VKToneGenerator configurePlayerWithPitchFactor:leftBalance:rightBalance:volume:loop:].cold.1(v24);
    }

LABEL_34:
LABEL_35:

  }
}

- (void)playSoundWithPitchFactor:(float)a3 leftBalance:(float)a4 rightBalance:(float)a5 volume:(float)a6 loop:(BOOL)a7
{
  _BOOL4 v7;
  uint64_t v9;
  AVAudioEngine *v10;
  id v11;
  AVAudioEngine *audioEngine;
  NSObject *v13;
  id v14;

  if (self->_usesSoundFeedback)
  {
    v7 = a7;
    -[VKToneGenerator configurePlayerWithPitchFactor:leftBalance:rightBalance:volume:loop:](self, "configurePlayerWithPitchFactor:leftBalance:rightBalance:volume:loop:");
    if (self->_buffer)
    {
      if (-[AVAudioEngine isRunning](self->_audioEngine, "isRunning"))
      {
        if (v7)
          v9 = 5;
        else
          v9 = 4;
        -[AVAudioPlayerNode scheduleBuffer:atTime:options:completionHandler:](self->_player, "scheduleBuffer:atTime:options:completionHandler:", self->_buffer, 0, v9, &__block_literal_global_0);
        -[AVAudioPlayerNode play](self->_player, "play");
      }
      else
      {
        v14 = 0;
        -[VKToneGenerator configureAudioEngineWithError:](self, "configureAudioEngineWithError:", &v14);
        v10 = (AVAudioEngine *)objc_claimAutoreleasedReturnValue();
        v11 = v14;
        audioEngine = self->_audioEngine;
        self->_audioEngine = v10;

        if (v11)
        {
          AXLogCommon();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
            -[VKToneGenerator setUsesSoundFeedback:].cold.1();

        }
      }
    }
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

- (BOOL)shouldPlayHapticPulse
{
  return self->_shouldPlayHapticPulse;
}

- (void)setShouldPlayHapticPulse:(BOOL)a3
{
  self->_shouldPlayHapticPulse = a3;
}

- (NSURL)audioFileURL
{
  return self->_audioFileURL;
}

- (void)setAudioFileURL:(id)a3
{
  objc_storeStrong((id *)&self->_audioFileURL, a3);
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

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (VKWalkAssistHapticEngineDelegate)hapticEngineDelegate
{
  return (VKWalkAssistHapticEngineDelegate *)objc_loadWeakRetained((id *)&self->_hapticEngineDelegate);
}

- (void)setHapticEngineDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_hapticEngineDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hapticEngineDelegate);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_buffer, 0);
  objc_storeStrong((id *)&self->_mixer, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_audioEngine, 0);
  objc_storeStrong((id *)&self->_audioFileURL, 0);
}

- (void)setUsesSoundFeedback:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_232B35000, v0, v1, "Cannot start AVAudioEngine: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)configurePlayerWithPitchFactor:(os_log_t)log leftBalance:rightBalance:volume:loop:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_232B35000, log, OS_LOG_TYPE_FAULT, "Channel count equal to zero", v1, 2u);
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

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_232B35000, v0, v1, "Cannot read audio file into buffer: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)configurePlayerWithPitchFactor:leftBalance:rightBalance:volume:loop:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_232B35000, v0, v1, "Cannot read audio file: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
