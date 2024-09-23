@implementation HPSSpatialProfileSingleStepSoundHapticManager

- (HPSSpatialProfileSingleStepSoundHapticManager)init
{
  HPSSpatialProfileSingleStepSoundHapticManager *v2;
  id v3;
  void *v4;
  uint64_t v5;
  CHHapticEngine *engine;
  dispatch_queue_t v7;
  OS_dispatch_queue *soundHapticSerialQueue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HPSSpatialProfileSingleStepSoundHapticManager;
  v2 = -[HPSSpatialProfileSingleStepSoundHapticManager init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0C9DCC8]);
    objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "initWithAudioSession:error:", v4, 0);
    engine = v2->_engine;
    v2->_engine = (CHHapticEngine *)v5;

    v7 = dispatch_queue_create("com.apple.HeadphoneSettings.soundHapticSerialQueue", 0);
    soundHapticSerialQueue = v2->_soundHapticSerialQueue;
    v2->_soundHapticSerialQueue = (OS_dispatch_queue *)v7;

    -[HPSSpatialProfileSingleStepSoundHapticManager readDynamicEnrollmentFeedback](v2, "readDynamicEnrollmentFeedback");
  }
  return v2;
}

- (void)start
{
  NSObject *v3;
  CHHapticEngine *engine;
  id v5;
  NSObject *v6;
  id v7;
  uint8_t buf[16];

  sharedBluetoothSettingsLogComponent();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB30C000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Sound & Haptics: Start Engine", buf, 2u);
  }

  -[HPSSpatialProfileSingleStepSoundHapticManager setupPlayers](self, "setupPlayers");
  engine = self->_engine;
  v7 = 0;
  -[CHHapticEngine startAndReturnError:](engine, "startAndReturnError:", &v7);
  v5 = v7;
  if (v5)
  {
    sharedBluetoothSettingsLogComponent();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[HPSSpatialProfileSoundHapticManager start].cold.1();

  }
}

- (void)stop
{
  NSObject *v3;
  uint8_t v4[16];

  sharedBluetoothSettingsLogComponent();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DB30C000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Sound & Haptics: Stop Engine", v4, 2u);
  }

  -[CHHapticEngine stopWithCompletionHandler:](self->_engine, "stopWithCompletionHandler:", &__block_literal_global_0);
}

void __53__HPSSpatialProfileSingleStepSoundHapticManager_stop__block_invoke(uint64_t a1, uint64_t a2)
{
  NSLog(CFSTR("Spatial Profile: Sound & Haptics: Stop Engine Error: %@"), a2);
}

- (void)setupPlayers
{
  CHHapticAdvancedPatternPlayer *v3;
  CHHapticAdvancedPatternPlayer *scanLockPlayer;
  CHHapticAdvancedPatternPlayer *v5;
  CHHapticAdvancedPatternPlayer *scanInProgressPlayer;
  CHHapticAdvancedPatternPlayer *v7;
  CHHapticAdvancedPatternPlayer *enrollGuidancePlayer;
  CHHapticAdvancedPatternPlayer *v9;
  CHHapticAdvancedPatternPlayer *enrollmentHalfDonePlayer;
  CHHapticAdvancedPatternPlayer *v11;
  CHHapticAdvancedPatternPlayer *scanCompletedPlayer;
  CHHapticAdvancedPatternPlayer *v13;
  CHHapticAdvancedPatternPlayer *scanErrorPlayer;
  CHHapticAdvancedPatternPlayer *v15;
  CHHapticAdvancedPatternPlayer *enrollmentCompletedPlayer;
  void *v17;
  void *v18;
  AVAudioPlayer *v19;
  id v20;
  AVAudioPlayer *enrollLooplayer;
  void *v22;
  double v23;
  id v24;

  -[HPSSpatialProfileSingleStepSoundHapticManager createPlayerWithFileName:](self, "createPlayerWithFileName:", CFSTR("Spatial_Profile_Scan_Lock"));
  v3 = (CHHapticAdvancedPatternPlayer *)objc_claimAutoreleasedReturnValue();
  scanLockPlayer = self->_scanLockPlayer;
  self->_scanLockPlayer = v3;

  -[HPSSpatialProfileSingleStepSoundHapticManager createPlayerWithFileName:](self, "createPlayerWithFileName:", CFSTR("Spatial_Profile_Scan_In_Progress"));
  v5 = (CHHapticAdvancedPatternPlayer *)objc_claimAutoreleasedReturnValue();
  scanInProgressPlayer = self->_scanInProgressPlayer;
  self->_scanInProgressPlayer = v5;

  -[HPSSpatialProfileSingleStepSoundHapticManager createPlayerWithFileName:](self, "createPlayerWithFileName:", CFSTR("Spatial_Profile_Scan_Orient_User"));
  v7 = (CHHapticAdvancedPatternPlayer *)objc_claimAutoreleasedReturnValue();
  enrollGuidancePlayer = self->_enrollGuidancePlayer;
  self->_enrollGuidancePlayer = v7;

  -[HPSSpatialProfileSingleStepSoundHapticManager createPlayerWithFileName:](self, "createPlayerWithFileName:", CFSTR("Spatial_Profile_Single_Step_First_Ear_Completed"));
  v9 = (CHHapticAdvancedPatternPlayer *)objc_claimAutoreleasedReturnValue();
  enrollmentHalfDonePlayer = self->_enrollmentHalfDonePlayer;
  self->_enrollmentHalfDonePlayer = v9;

  -[HPSSpatialProfileSingleStepSoundHapticManager createPlayerWithFileName:](self, "createPlayerWithFileName:", CFSTR("Spatial_Profile_Single_Step_Second_Ear_Completed"));
  v11 = (CHHapticAdvancedPatternPlayer *)objc_claimAutoreleasedReturnValue();
  scanCompletedPlayer = self->_scanCompletedPlayer;
  self->_scanCompletedPlayer = v11;

  -[HPSSpatialProfileSingleStepSoundHapticManager createPlayerWithFileName:](self, "createPlayerWithFileName:", CFSTR("Spatial_Profile_Scan_Error"));
  v13 = (CHHapticAdvancedPatternPlayer *)objc_claimAutoreleasedReturnValue();
  scanErrorPlayer = self->_scanErrorPlayer;
  self->_scanErrorPlayer = v13;

  -[HPSSpatialProfileSingleStepSoundHapticManager createPlayerWithFileName:](self, "createPlayerWithFileName:", CFSTR("Spatial_Profile_Single_Step_Scan_Completed"));
  v15 = (CHHapticAdvancedPatternPlayer *)objc_claimAutoreleasedReturnValue();
  enrollmentCompletedPlayer = self->_enrollmentCompletedPlayer;
  self->_enrollmentCompletedPlayer = v15;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "URLForResource:withExtension:", CFSTR("tonal_loop"), CFSTR("wav"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  NSLog(CFSTR("Path to play: %@"), v18);
  v24 = 0;
  v19 = (AVAudioPlayer *)objc_msgSend(objc_alloc(MEMORY[0x1E0C89AC8]), "initWithContentsOfURL:error:", v18, &v24);
  v20 = v24;
  enrollLooplayer = self->_enrollLooplayer;
  self->_enrollLooplayer = v19;

  if (v20)
  {
    objc_msgSend(v20, "localizedDescription");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Failed with reason: %@"), v22);

  }
  else
  {
    -[AVAudioPlayer setDelegate:](self->_enrollLooplayer, "setDelegate:", self);
    -[AVAudioPlayer setNumberOfLoops:](self->_enrollLooplayer, "setNumberOfLoops:", -1);
    -[AVAudioPlayer setCurrentTime:](self->_enrollLooplayer, "setCurrentTime:", 0.0);
    LODWORD(v23) = 1028443341;
    -[AVAudioPlayer setVolume:](self->_enrollLooplayer, "setVolume:", v23);
  }

}

- (void)setEnrollGuidancePitch:(float)a3
{
  CHHapticAdvancedPatternPlayer *enrollGuidancePlayer;

  enrollGuidancePlayer = self->_enrollGuidancePlayer;
  if (enrollGuidancePlayer)
  {
    if (self->_dynamicEnrollmentFeedback)
      -[CHHapticAdvancedPatternPlayer setPlaybackRate:](enrollGuidancePlayer, "setPlaybackRate:");
  }
}

- (BOOL)isEnrollGuidancePlaying
{
  CHHapticAdvancedPatternPlayer *enrollGuidancePlayer;

  enrollGuidancePlayer = self->_enrollGuidancePlayer;
  if (enrollGuidancePlayer)
    LOBYTE(enrollGuidancePlayer) = -[CHHapticAdvancedPatternPlayer loopEnabled](enrollGuidancePlayer, "loopEnabled");
  return (char)enrollGuidancePlayer;
}

- (void)pauseEnrollGuidancePlayer
{
  CHHapticAdvancedPatternPlayer *enrollGuidancePlayer;
  id v4;
  NSObject *v5;
  id v6;

  if (self->_dynamicEnrollmentFeedback)
  {
    enrollGuidancePlayer = self->_enrollGuidancePlayer;
    if (enrollGuidancePlayer)
    {
      v6 = 0;
      -[CHHapticAdvancedPatternPlayer stopAtTime:error:](enrollGuidancePlayer, "stopAtTime:error:", &v6, 0.0);
      v4 = v6;
      -[CHHapticAdvancedPatternPlayer setLoopEnabled:](self->_enrollGuidancePlayer, "setLoopEnabled:", 0);
      if (v4)
      {
        sharedBluetoothSettingsLogComponent();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
          -[HPSSpatialProfileSoundHapticManager pauseEnrollGuidancePlayer].cold.1();

      }
    }
  }
}

- (void)playEnrollGuidance:(int)a3
{
  CHHapticAdvancedPatternPlayer *enrollGuidancePlayer;
  double v5;
  CHHapticAdvancedPatternPlayer *v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;

  if (self->_dynamicEnrollmentFeedback && (a3 == 11 || a3 == 7))
  {
    enrollGuidancePlayer = self->_enrollGuidancePlayer;
    if (enrollGuidancePlayer)
    {
      if ((-[CHHapticAdvancedPatternPlayer loopEnabled](enrollGuidancePlayer, "loopEnabled") & 1) == 0)
      {
        -[CHHapticAdvancedPatternPlayer setLoopEnabled:](self->_enrollGuidancePlayer, "setLoopEnabled:", 1);
        LODWORD(v5) = 0.5;
        -[CHHapticAdvancedPatternPlayer setPlaybackRate:](self->_enrollGuidancePlayer, "setPlaybackRate:", v5);
        v6 = self->_enrollGuidancePlayer;
        v10 = 0;
        -[CHHapticAdvancedPatternPlayer startAtTime:error:](v6, "startAtTime:error:", &v10, 0.0);
        v7 = v10;
        if (v7)
        {
          v8 = v7;
          sharedBluetoothSettingsLogComponent();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
            -[HPSSpatialProfileSoundHapticManager playEnrollGuidance:].cold.1();

        }
      }
    }
  }
}

- (void)setProgressPlayerPitch:(float)a3
{
  CHHapticAdvancedPatternPlayer *scanInProgressPlayer;

  scanInProgressPlayer = self->_scanInProgressPlayer;
  if (scanInProgressPlayer)
    -[CHHapticAdvancedPatternPlayer setPlaybackRate:](scanInProgressPlayer, "setPlaybackRate:");
}

- (void)pauseProgressPlayer
{
  CHHapticAdvancedPatternPlayer *scanInProgressPlayer;
  id v3;
  void *v4;
  NSObject *v5;
  id v6;

  scanInProgressPlayer = self->_scanInProgressPlayer;
  if (scanInProgressPlayer)
  {
    v6 = 0;
    -[CHHapticAdvancedPatternPlayer stopAtTime:error:](scanInProgressPlayer, "stopAtTime:error:", &v6, 0.0);
    v3 = v6;
    if (v3)
    {
      v4 = v3;
      sharedBluetoothSettingsLogComponent();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[HPSSpatialProfileSoundHapticManager pauseEnrollGuidancePlayer].cold.1();

    }
  }
}

- (void)playProgressPlayer:(int)a3
{
  CHHapticAdvancedPatternPlayer *scanInProgressPlayer;
  double v5;
  CHHapticAdvancedPatternPlayer *v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;

  if (a3 == 11 || a3 == 7)
  {
    scanInProgressPlayer = self->_scanInProgressPlayer;
    if (scanInProgressPlayer)
    {
      -[CHHapticAdvancedPatternPlayer setLoopEnabled:](scanInProgressPlayer, "setLoopEnabled:", 1);
      LODWORD(v5) = 1.0;
      -[CHHapticAdvancedPatternPlayer setPlaybackRate:](self->_scanInProgressPlayer, "setPlaybackRate:", v5);
      v6 = self->_scanInProgressPlayer;
      v10 = 0;
      -[CHHapticAdvancedPatternPlayer startAtTime:error:](v6, "startAtTime:error:", &v10, 0.0);
      v7 = v10;
      if (v7)
      {
        v8 = v7;
        sharedBluetoothSettingsLogComponent();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          -[HPSSpatialProfileSoundHapticManager playEnrollGuidance:].cold.1();

      }
    }
  }
}

- (id)createPlayerWithFileName:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  CHHapticEngine *engine;
  void *v12;
  id v13;
  NSObject *v14;
  id v16;
  id v17;

  v4 = (void *)MEMORY[0x1E0CB34D0];
  v5 = a3;
  objc_msgSend(v4, "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLForResource:withExtension:", v5, CFSTR("ahap"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DD08]), "initWithContentsOfURL:error:", v7, &v17);
  v9 = v17;
  if (v9)
  {
    sharedBluetoothSettingsLogComponent();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[HPSSpatialProfileSoundHapticManager initPlayerWithFileName:].cold.2();

  }
  engine = self->_engine;
  v16 = 0;
  -[CHHapticEngine createAdvancedPlayerWithPattern:error:](engine, "createAdvancedPlayerWithPattern:error:", v8, &v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v16;
  if (v13)
  {
    sharedBluetoothSettingsLogComponent();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[HPSSpatialProfileSoundHapticManager initPlayerWithFileName:].cold.1();

  }
  return v12;
}

- (void)triggerSoundHapticForEnrollmentState:(int)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  dispatch_group_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *soundHapticSerialQueue;
  NSObject *v14;
  CHHapticAdvancedPatternPlayer *scanInProgressPlayer;
  id v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  _QWORD block[5];
  NSObject *v25;
  void (**v26)(_QWORD);
  _QWORD v27[4];
  NSObject *v28;
  HPSSpatialProfileSingleStepSoundHapticManager *v29;
  void (**v30)(_QWORD);
  _QWORD v31[5];
  NSObject *v32;
  void (**v33)(_QWORD);
  _QWORD v34[4];
  NSObject *v35;
  HPSSpatialProfileSingleStepSoundHapticManager *v36;
  void (**v37)(_QWORD);
  int v38;
  uint8_t buf[16];
  id v40;
  id v41;

  v6 = (void (**)(_QWORD))a4;
  v7 = dispatch_group_create();
  objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0C89690];
  v41 = 0;
  objc_msgSend(v8, "setCategory:error:", v9, &v41);
  v10 = v41;

  if (v10)
  {
    sharedBluetoothSettingsLogComponent();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[HPSSpatialProfileSoundHapticManager triggerSoundHapticForEnrollmentState:completion:].cold.3();

  }
  switch(a3)
  {
    case 3:
      sharedBluetoothSettingsLogComponent();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[HPSSpatialProfileSoundHapticManager triggerSoundHapticForEnrollmentState:completion:].cold.2(v12);

      soundHapticSerialQueue = self->_soundHapticSerialQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __97__HPSSpatialProfileSingleStepSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_47;
      block[3] = &unk_1EA29A728;
      block[4] = self;
      v25 = v7;
      v26 = v6;
      dispatch_async(soundHapticSerialQueue, block);

      v14 = v25;
      goto LABEL_27;
    case 6:
      scanInProgressPlayer = self->_scanInProgressPlayer;
      v40 = v10;
      -[CHHapticAdvancedPatternPlayer stopAtTime:error:](scanInProgressPlayer, "stopAtTime:error:", &v40, 0.0);
      v16 = v40;

      if (v16)
      {
        sharedBluetoothSettingsLogComponent();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          -[HPSSpatialProfileSoundHapticManager pauseEnrollGuidancePlayer].cold.1();

      }
      if (v6)
        v6[2](v6);
      v10 = v16;
      break;
    case 7:
      sharedBluetoothSettingsLogComponent();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB30C000, v18, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Sound & Haptics: Scan Start", buf, 2u);
      }

      v19 = self->_soundHapticSerialQueue;
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __97__HPSSpatialProfileSingleStepSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke;
      v34[3] = &unk_1EA29A700;
      v35 = v7;
      v36 = self;
      v38 = 7;
      v37 = v6;
      dispatch_async(v19, v34);

      v14 = v35;
      goto LABEL_27;
    case 8:
      sharedBluetoothSettingsLogComponent();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB30C000, v20, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Sound & Haptics: Scan Completed", buf, 2u);
      }

      v21 = self->_soundHapticSerialQueue;
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __97__HPSSpatialProfileSingleStepSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_37;
      v31[3] = &unk_1EA29A728;
      v31[4] = self;
      v32 = v7;
      v33 = v6;
      dispatch_async(v21, v31);

      v14 = v32;
      goto LABEL_27;
    case 12:
      sharedBluetoothSettingsLogComponent();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB30C000, v22, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Sound & Haptics: Enrollment Completed", buf, 2u);
      }

      v23 = self->_soundHapticSerialQueue;
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __97__HPSSpatialProfileSingleStepSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_42;
      v27[3] = &unk_1EA29A728;
      v28 = v7;
      v29 = self;
      v30 = v6;
      dispatch_async(v23, v27);

      v14 = v28;
LABEL_27:

      break;
    default:
      if (v6)
        v6[2](v6);
      break;
  }

}

void __97__HPSSpatialProfileSingleStepSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  NSObject *v5;
  double v6;
  void *v7;
  id v8;
  _BYTE *v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v2 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __97__HPSSpatialProfileSingleStepSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_2;
  v16[3] = &unk_1EA29A6B0;
  v17 = *(id *)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "setCompletionHandler:", v16);
  v3 = *(void **)(*(_QWORD *)(a1 + 40) + 16);
  v15 = 0;
  objc_msgSend(v3, "startAtTime:error:", &v15, 0.0);
  v4 = v15;
  if (v4)
  {
    sharedBluetoothSettingsLogComponent();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_cold_2();

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "setLoopEnabled:", 1);
  LODWORD(v6) = 1.0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "setPlaybackRate:", v6);
  v7 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
  v14 = v4;
  objc_msgSend(v7, "startAtTime:error:", &v14, 0.0);
  v8 = v14;

  v9 = *(_BYTE **)(a1 + 40);
  if (v9[72])
    objc_msgSend(v9, "playEnrollGuidance:", *(unsigned int *)(a1 + 56));
  if (v8)
  {
    sharedBluetoothSettingsLogComponent();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[HPSSpatialProfileSoundHapticManager playEnrollGuidance:].cold.1();

  }
  v11 = *(NSObject **)(a1 + 32);
  v12[0] = v2;
  v12[1] = 3221225472;
  v12[2] = __97__HPSSpatialProfileSingleStepSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_35;
  v12[3] = &unk_1EA29A6D8;
  v13 = *(id *)(a1 + 48);
  dispatch_group_notify(v11, MEMORY[0x1E0C80D38], v12);

}

void __97__HPSSpatialProfileSingleStepSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
    NSLog(CFSTR("Spatial Profile: Sound & Haptics: Scan Lock Player Error: %@"), a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __97__HPSSpatialProfileSingleStepSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_35(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __97__HPSSpatialProfileSingleStepSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_37(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 72))
  {
    objc_msgSend((id)v2, "pauseEnrollGuidancePlayer");
    v2 = *(_QWORD *)(a1 + 32);
  }
  v3 = *(void **)(v2 + 24);
  v16 = 0;
  objc_msgSend(v3, "stopAtTime:error:", &v16, 0.0);
  v4 = v16;
  if (v4)
  {
    sharedBluetoothSettingsLogComponent();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[HPSSpatialProfileSoundHapticManager pauseEnrollGuidancePlayer].cold.1();

  }
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
  v6 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __97__HPSSpatialProfileSingleStepSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_38;
  v14[3] = &unk_1EA29A6B0;
  v15 = *(id *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setCompletionHandler:", v14);
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v13 = v4;
  objc_msgSend(v7, "startAtTime:error:", &v13, 0.0);
  v8 = v13;

  if (v8)
  {
    sharedBluetoothSettingsLogComponent();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_30_cold_1();

  }
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __97__HPSSpatialProfileSingleStepSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_41;
  v11[3] = &unk_1EA29A6D8;
  v10 = *(NSObject **)(a1 + 40);
  v12 = *(id *)(a1 + 48);
  dispatch_group_notify(v10, MEMORY[0x1E0C80D38], v11);

}

void __97__HPSSpatialProfileSingleStepSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_38(uint64_t a1, uint64_t a2)
{
  if (a2)
    NSLog(CFSTR("Spatial Profile: Sound & Haptics: Scan Completed Player Error: %@"), a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __97__HPSSpatialProfileSingleStepSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_41(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __97__HPSSpatialProfileSingleStepSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_42(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v2 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __97__HPSSpatialProfileSingleStepSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_2_43;
  v10[3] = &unk_1EA29A6B0;
  v11 = *(id *)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 64), "setCompletionHandler:", v10);
  v3 = *(void **)(*(_QWORD *)(a1 + 40) + 64);
  v9 = 0;
  objc_msgSend(v3, "startAtTime:error:", &v9, 0.0);
  v4 = v9;
  if (v4)
  {
    sharedBluetoothSettingsLogComponent();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_35_cold_1();

  }
  v6 = *(NSObject **)(a1 + 32);
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __97__HPSSpatialProfileSingleStepSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_46;
  block[3] = &unk_1EA29A6D8;
  v8 = *(id *)(a1 + 48);
  dispatch_group_notify(v6, MEMORY[0x1E0C80D38], block);

}

void __97__HPSSpatialProfileSingleStepSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_2_43(uint64_t a1, uint64_t a2)
{
  if (a2)
    NSLog(CFSTR("Spatial Profile: Sound & Haptics: Enrollment Completed Player Error: %@"), a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __97__HPSSpatialProfileSingleStepSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_46(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __97__HPSSpatialProfileSingleStepSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_47(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v15 = 0;
  objc_msgSend(v2, "stopAtTime:error:", &v15, 0.0);
  v3 = v15;
  if (v3)
  {
    sharedBluetoothSettingsLogComponent();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[HPSSpatialProfileSoundHapticManager pauseEnrollGuidancePlayer].cold.1();

  }
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
  v5 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __97__HPSSpatialProfileSingleStepSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_48;
  v13[3] = &unk_1EA29A6B0;
  v14 = *(id *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setCompletionHandler:", v13);
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  v12 = v3;
  objc_msgSend(v6, "startAtTime:error:", &v12, 0.0);
  v7 = v12;

  if (v7)
  {
    sharedBluetoothSettingsLogComponent();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_40_cold_1();

  }
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __97__HPSSpatialProfileSingleStepSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_51;
  v10[3] = &unk_1EA29A6D8;
  v9 = *(NSObject **)(a1 + 40);
  v11 = *(id *)(a1 + 48);
  dispatch_group_notify(v9, MEMORY[0x1E0C80D38], v10);

}

void __97__HPSSpatialProfileSingleStepSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_48(uint64_t a1, uint64_t a2)
{
  if (a2)
    NSLog(CFSTR("Spatial Profile: Sound & Haptics: Scan Error Player Error: %@"), a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __97__HPSSpatialProfileSingleStepSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_51(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)triggerSoundHapticForEarCaptureState:(int)a3 completion:(id)a4
{
  id v6;
  dispatch_group_t v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *soundHapticSerialQueue;
  id v11;
  NSObject *v12;
  dispatch_group_t v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  _QWORD v17[5];
  dispatch_group_t v18;
  id v19;
  _QWORD block[4];
  dispatch_group_t v21;
  HPSSpatialProfileSingleStepSoundHapticManager *v22;
  id v23;
  uint8_t buf[16];

  v6 = a4;
  v7 = dispatch_group_create();
  sharedBluetoothSettingsLogComponent();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (a3)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB30C000, v8, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Sound & Haptics: Scan Completed", buf, 2u);
    }

    soundHapticSerialQueue = self->_soundHapticSerialQueue;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __97__HPSSpatialProfileSingleStepSoundHapticManager_triggerSoundHapticForEarCaptureState_completion___block_invoke_53;
    v17[3] = &unk_1EA29A728;
    v17[4] = self;
    v18 = v7;
    v19 = v6;
    v11 = v6;
    v12 = v7;
    dispatch_async(soundHapticSerialQueue, v17);

    v13 = v18;
  }
  else
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB30C000, v8, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Sound & Haptics: Scan Completed", buf, 2u);
    }

    v14 = self->_soundHapticSerialQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __97__HPSSpatialProfileSingleStepSoundHapticManager_triggerSoundHapticForEarCaptureState_completion___block_invoke;
    block[3] = &unk_1EA29A728;
    v21 = v7;
    v22 = self;
    v23 = v6;
    v15 = v6;
    v16 = v7;
    dispatch_async(v14, block);

    v13 = v21;
  }

}

void __97__HPSSpatialProfileSingleStepSoundHapticManager_triggerSoundHapticForEarCaptureState_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v2 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __97__HPSSpatialProfileSingleStepSoundHapticManager_triggerSoundHapticForEarCaptureState_completion___block_invoke_2;
  v10[3] = &unk_1EA29A6B0;
  v11 = *(id *)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "setCompletionHandler:", v10);
  v3 = *(void **)(*(_QWORD *)(a1 + 40) + 40);
  v9 = 0;
  objc_msgSend(v3, "startAtTime:error:", &v9, 0.0);
  v4 = v9;
  if (v4)
  {
    sharedBluetoothSettingsLogComponent();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_30_cold_1();

  }
  v6 = *(NSObject **)(a1 + 32);
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __97__HPSSpatialProfileSingleStepSoundHapticManager_triggerSoundHapticForEarCaptureState_completion___block_invoke_52;
  block[3] = &unk_1EA29A6D8;
  v8 = *(id *)(a1 + 48);
  dispatch_group_notify(v6, MEMORY[0x1E0C80D38], block);

}

void __97__HPSSpatialProfileSingleStepSoundHapticManager_triggerSoundHapticForEarCaptureState_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
    NSLog(CFSTR("Spatial Profile: Sound & Haptics: Scan Completed Player Error: %@"), a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __97__HPSSpatialProfileSingleStepSoundHapticManager_triggerSoundHapticForEarCaptureState_completion___block_invoke_52(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __97__HPSSpatialProfileSingleStepSoundHapticManager_triggerSoundHapticForEarCaptureState_completion___block_invoke_53(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 72))
  {
    objc_msgSend((id)v2, "pauseEnrollGuidancePlayer");
    v2 = *(_QWORD *)(a1 + 32);
  }
  v3 = *(void **)(v2 + 24);
  v16 = 0;
  objc_msgSend(v3, "stopAtTime:error:", &v16, 0.0);
  v4 = v16;
  if (v4)
  {
    sharedBluetoothSettingsLogComponent();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[HPSSpatialProfileSoundHapticManager pauseEnrollGuidancePlayer].cold.1();

  }
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
  v6 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __97__HPSSpatialProfileSingleStepSoundHapticManager_triggerSoundHapticForEarCaptureState_completion___block_invoke_54;
  v14[3] = &unk_1EA29A6B0;
  v15 = *(id *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setCompletionHandler:", v14);
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v13 = v4;
  objc_msgSend(v7, "startAtTime:error:", &v13, 0.0);
  v8 = v13;

  if (v8)
  {
    sharedBluetoothSettingsLogComponent();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_30_cold_1();

  }
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __97__HPSSpatialProfileSingleStepSoundHapticManager_triggerSoundHapticForEarCaptureState_completion___block_invoke_55;
  v11[3] = &unk_1EA29A6D8;
  v10 = *(NSObject **)(a1 + 40);
  v12 = *(id *)(a1 + 48);
  dispatch_group_notify(v10, MEMORY[0x1E0C80D38], v11);

}

void __97__HPSSpatialProfileSingleStepSoundHapticManager_triggerSoundHapticForEarCaptureState_completion___block_invoke_54(uint64_t a1, uint64_t a2)
{
  if (a2)
    NSLog(CFSTR("Spatial Profile: Sound & Haptics: Scan Completed Player Error: %@"), a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __97__HPSSpatialProfileSingleStepSoundHapticManager_triggerSoundHapticForEarCaptureState_completion___block_invoke_55(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)readDynamicEnrollmentFeedback
{
  int AppBooleanValue;
  BOOL v4;
  BOOL v5;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  CFPreferencesAppSynchronize(CFSTR("com.apple.BTServer"));
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("DynamicEnrollmentFeedback"), CFSTR("com.apple.BTServer"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v4 = AppBooleanValue == 0;
  else
    v4 = 1;
  v5 = !v4;
  self->_dynamicEnrollmentFeedback = v5;
}

- (void)startEnrollLoop
{
  NSObject *soundHapticSerialQueue;
  _QWORD block[5];

  if (!-[AVAudioPlayer isPlaying](self->_enrollLooplayer, "isPlaying"))
  {
    soundHapticSerialQueue = self->_soundHapticSerialQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__HPSSpatialProfileSingleStepSoundHapticManager_startEnrollLoop__block_invoke;
    block[3] = &unk_1EA29A770;
    block[4] = self;
    dispatch_async(soundHapticSerialQueue, block);
  }
}

uint64_t __64__HPSSpatialProfileSingleStepSoundHapticManager_startEnrollLoop__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "play");
}

- (void)stopEnrollLoop
{
  NSObject *soundHapticSerialQueue;
  _QWORD block[5];

  soundHapticSerialQueue = self->_soundHapticSerialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__HPSSpatialProfileSingleStepSoundHapticManager_stopEnrollLoop__block_invoke;
  block[3] = &unk_1EA29A770;
  block[4] = self;
  dispatch_async(soundHapticSerialQueue, block);
}

uint64_t __63__HPSSpatialProfileSingleStepSoundHapticManager_stopEnrollLoop__block_invoke(uint64_t a1)
{
  double v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "stop");
  LODWORD(v2) = 0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "setVolume:", v2);
}

- (void)updateEnrollLoopVolume:(double)a3
{
  NSObject *soundHapticSerialQueue;
  _QWORD v4[6];

  soundHapticSerialQueue = self->_soundHapticSerialQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __72__HPSSpatialProfileSingleStepSoundHapticManager_updateEnrollLoopVolume___block_invoke;
  v4[3] = &unk_1EA29A798;
  v4[4] = self;
  *(double *)&v4[5] = a3 * 0.7 + 0.05;
  dispatch_async(soundHapticSerialQueue, v4);
}

uint64_t __72__HPSSpatialProfileSingleStepSoundHapticManager_updateEnrollLoopVolume___block_invoke(uint64_t a1)
{
  double v1;

  v1 = *(double *)(a1 + 40);
  *(float *)&v1 = v1;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "setVolume:", v1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enrollLooplayer, 0);
  objc_storeStrong((id *)&self->_soundHapticSerialQueue, 0);
  objc_storeStrong((id *)&self->_enrollmentCompletedPlayer, 0);
  objc_storeStrong((id *)&self->_scanErrorPlayer, 0);
  objc_storeStrong((id *)&self->_scanCompletedPlayer, 0);
  objc_storeStrong((id *)&self->_enrollmentHalfDonePlayer, 0);
  objc_storeStrong((id *)&self->_enrollGuidancePlayer, 0);
  objc_storeStrong((id *)&self->_scanInProgressPlayer, 0);
  objc_storeStrong((id *)&self->_scanLockPlayer, 0);
  objc_storeStrong((id *)&self->_engine, 0);
}

@end
