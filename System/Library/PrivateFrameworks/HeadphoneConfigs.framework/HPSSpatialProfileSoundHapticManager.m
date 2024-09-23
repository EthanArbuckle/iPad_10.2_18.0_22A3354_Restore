@implementation HPSSpatialProfileSoundHapticManager

- (HPSSpatialProfileSoundHapticManager)init
{
  HPSSpatialProfileSoundHapticManager *v2;
  id v3;
  void *v4;
  uint64_t v5;
  CHHapticEngine *engine;
  dispatch_queue_t v7;
  OS_dispatch_queue *soundHapticSerialQueue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HPSSpatialProfileSoundHapticManager;
  v2 = -[HPSSpatialProfileSoundHapticManager init](&v10, sel_init);
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

    -[HPSSpatialProfileSoundHapticManager readDynamicEnrollmentFeedback](v2, "readDynamicEnrollmentFeedback");
  }
  return v2;
}

- (void)start
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1DB30C000, v0, v1, "Spatial Profile: Sound & Haptics: Start Engine Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
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

  -[CHHapticEngine stopWithCompletionHandler:](self->_engine, "stopWithCompletionHandler:", &__block_literal_global);
}

void __43__HPSSpatialProfileSoundHapticManager_stop__block_invoke(uint64_t a1, uint64_t a2)
{
  NSLog(CFSTR("Spatial Profile: Sound & Haptics: Stop Engine Error: %@"), a2);
}

- (void)setupPlayers
{
  HPSSpatialProfileSoundHapticManager *v2;
  uint64_t v3;
  CHHapticAdvancedPatternPlayer *scanLockPlayer;
  HPSSpatialProfileSoundHapticManager *v5;
  uint64_t v6;
  CHHapticAdvancedPatternPlayer *scanInProgressPlayer;
  HPSSpatialProfileSoundHapticManager *v8;
  uint64_t v9;
  CHHapticAdvancedPatternPlayer *enrollGuidancePlayer;
  HPSSpatialProfileSoundHapticManager *v11;
  uint64_t v12;
  CHHapticAdvancedPatternPlayer *scanFirstTickPlayer;
  HPSSpatialProfileSoundHapticManager *v14;
  uint64_t v15;
  CHHapticAdvancedPatternPlayer *scanSecondTickPlayer;
  HPSSpatialProfileSoundHapticManager *v17;
  uint64_t v18;
  CHHapticAdvancedPatternPlayer *scanCompletedPlayer;
  HPSSpatialProfileSoundHapticManager *v20;
  uint64_t v21;
  CHHapticAdvancedPatternPlayer *scanErrorPlayer;
  HPSSpatialProfileSoundHapticManager *v23;
  uint64_t v24;
  CHHapticAdvancedPatternPlayer *enrollmentCompletedPlayer;

  v2 = self;
  v3 = -[HPSSpatialProfileSoundHapticManager initPlayerWithFileName:](v2, "initPlayerWithFileName:", CFSTR("Spatial_Profile_Scan_Lock"));
  scanLockPlayer = v2->_scanLockPlayer;
  v2->_scanLockPlayer = (CHHapticAdvancedPatternPlayer *)v3;

  v5 = v2;
  v6 = -[HPSSpatialProfileSoundHapticManager initPlayerWithFileName:](v5, "initPlayerWithFileName:", CFSTR("Spatial_Profile_Scan_In_Progress"));
  scanInProgressPlayer = v5->_scanInProgressPlayer;
  v5->_scanInProgressPlayer = (CHHapticAdvancedPatternPlayer *)v6;

  v8 = v5;
  v9 = -[HPSSpatialProfileSoundHapticManager initPlayerWithFileName:](v8, "initPlayerWithFileName:", CFSTR("Spatial_Profile_Scan_Orient_User"));
  enrollGuidancePlayer = v8->_enrollGuidancePlayer;
  v8->_enrollGuidancePlayer = (CHHapticAdvancedPatternPlayer *)v9;

  v11 = v8;
  v12 = -[HPSSpatialProfileSoundHapticManager initPlayerWithFileName:](v11, "initPlayerWithFileName:", CFSTR("Spatial_Profile_Scan_First_Tick"));
  scanFirstTickPlayer = v11->_scanFirstTickPlayer;
  v11->_scanFirstTickPlayer = (CHHapticAdvancedPatternPlayer *)v12;

  v14 = v11;
  v15 = -[HPSSpatialProfileSoundHapticManager initPlayerWithFileName:](v14, "initPlayerWithFileName:", CFSTR("Spatial_Profile_Scan_Second_Tick"));
  scanSecondTickPlayer = v14->_scanSecondTickPlayer;
  v14->_scanSecondTickPlayer = (CHHapticAdvancedPatternPlayer *)v15;

  v17 = v14;
  v18 = -[HPSSpatialProfileSoundHapticManager initPlayerWithFileName:](v17, "initPlayerWithFileName:", CFSTR("Spatial_Profile_Scan_Completed"));
  scanCompletedPlayer = v17->_scanCompletedPlayer;
  v17->_scanCompletedPlayer = (CHHapticAdvancedPatternPlayer *)v18;

  v20 = v17;
  v21 = -[HPSSpatialProfileSoundHapticManager initPlayerWithFileName:](v20, "initPlayerWithFileName:", CFSTR("Spatial_Profile_Scan_Error"));
  scanErrorPlayer = v20->_scanErrorPlayer;
  v20->_scanErrorPlayer = (CHHapticAdvancedPatternPlayer *)v21;

  v23 = v20;
  v24 = -[HPSSpatialProfileSoundHapticManager initPlayerWithFileName:](v23, "initPlayerWithFileName:", CFSTR("Spatial_Profile_Enrollment_Completed"));
  enrollmentCompletedPlayer = v23->_enrollmentCompletedPlayer;
  v23->_enrollmentCompletedPlayer = (CHHapticAdvancedPatternPlayer *)v24;

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
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1DB30C000, v0, v1, "Spatial Profile: Sound & Haptics: Stop Scan In Progress Player Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
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

- (id)initPlayerWithFileName:(id)a3
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
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  CHHapticAdvancedPatternPlayer *scanInProgressPlayer;
  id v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  _QWORD v24[5];
  NSObject *v25;
  void (**v26)(_QWORD);
  _QWORD v27[4];
  NSObject *v28;
  HPSSpatialProfileSoundHapticManager *v29;
  void (**v30)(_QWORD);
  _QWORD v31[5];
  NSObject *v32;
  void (**v33)(_QWORD);
  _QWORD block[4];
  NSObject *v35;
  HPSSpatialProfileSoundHapticManager *v36;
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
    case 2:
      scanInProgressPlayer = self->_scanInProgressPlayer;
      v40 = v10;
      -[CHHapticAdvancedPatternPlayer stopAtTime:error:](scanInProgressPlayer, "stopAtTime:error:", &v40, 0.0);
      v20 = v40;

      if (v20)
      {
        sharedBluetoothSettingsLogComponent();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          -[HPSSpatialProfileSoundHapticManager pauseEnrollGuidancePlayer].cold.1();

      }
      if (v6)
        v6[2](v6);
      v10 = v20;
      break;
    case 3:
    case 7:
    case 11:
      sharedBluetoothSettingsLogComponent();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB30C000, v12, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Sound & Haptics: Scan Start", buf, 2u);
      }

      soundHapticSerialQueue = self->_soundHapticSerialQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke;
      block[3] = &unk_1EA29A700;
      v35 = v7;
      v36 = self;
      v38 = a3;
      v37 = v6;
      dispatch_async(soundHapticSerialQueue, block);

      v14 = v35;
      goto LABEL_27;
    case 4:
    case 8:
    case 12:
      sharedBluetoothSettingsLogComponent();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB30C000, v15, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Sound & Haptics: Scan Completed", buf, 2u);
      }

      v16 = self->_soundHapticSerialQueue;
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_30;
      v31[3] = &unk_1EA29A728;
      v31[4] = self;
      v32 = v7;
      v33 = v6;
      dispatch_async(v16, v31);

      v14 = v32;
      goto LABEL_27;
    case 16:
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
      v27[2] = __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_35;
      v27[3] = &unk_1EA29A728;
      v28 = v7;
      v29 = self;
      v30 = v6;
      dispatch_async(v23, v27);

      v14 = v28;
      goto LABEL_27;
    case 17:
    case 18:
    case 19:
      sharedBluetoothSettingsLogComponent();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[HPSSpatialProfileSoundHapticManager triggerSoundHapticForEnrollmentState:completion:].cold.2(v17);

      v18 = self->_soundHapticSerialQueue;
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_40;
      v24[3] = &unk_1EA29A728;
      v24[4] = self;
      v25 = v7;
      v26 = v6;
      dispatch_async(v18, v24);

      v14 = v25;
LABEL_27:

      break;
    default:
      if (v6)
        v6[2](v6);
      break;
  }

}

void __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke(uint64_t a1)
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
  v16[2] = __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_2;
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
  if (v9[80])
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
  v12[2] = __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_28;
  v12[3] = &unk_1EA29A6D8;
  v13 = *(id *)(a1 + 48);
  dispatch_group_notify(v11, MEMORY[0x1E0C80D38], v12);

}

void __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
    NSLog(CFSTR("Spatial Profile: Sound & Haptics: Scan Lock Player Error: %@"), a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_28(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_30(uint64_t a1)
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
  if (*(_BYTE *)(v2 + 80))
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
  v14[2] = __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_31;
  v14[3] = &unk_1EA29A6B0;
  v15 = *(id *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setCompletionHandler:", v14);
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
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
  v11[2] = __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_34;
  v11[3] = &unk_1EA29A6D8;
  v10 = *(NSObject **)(a1 + 40);
  v12 = *(id *)(a1 + 48);
  dispatch_group_notify(v10, MEMORY[0x1E0C80D38], v11);

}

void __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_31(uint64_t a1, uint64_t a2)
{
  if (a2)
    NSLog(CFSTR("Spatial Profile: Sound & Haptics: Scan Completed Player Error: %@"), a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_34(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_35(uint64_t a1)
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
  v10[2] = __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_2_36;
  v10[3] = &unk_1EA29A6B0;
  v11 = *(id *)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "setCompletionHandler:", v10);
  v3 = *(void **)(*(_QWORD *)(a1 + 40) + 72);
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
  block[2] = __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_39;
  block[3] = &unk_1EA29A6D8;
  v8 = *(id *)(a1 + 48);
  dispatch_group_notify(v6, MEMORY[0x1E0C80D38], block);

}

void __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_2_36(uint64_t a1, uint64_t a2)
{
  if (a2)
    NSLog(CFSTR("Spatial Profile: Sound & Haptics: Enrollment Completed Player Error: %@"), a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_39(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_40(uint64_t a1)
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
  v13[2] = __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_41;
  v13[3] = &unk_1EA29A6B0;
  v14 = *(id *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setCompletionHandler:", v13);
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
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
  v10[2] = __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_44;
  v10[3] = &unk_1EA29A6D8;
  v9 = *(NSObject **)(a1 + 40);
  v11 = *(id *)(a1 + 48);
  dispatch_group_notify(v9, MEMORY[0x1E0C80D38], v10);

}

void __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_41(uint64_t a1, uint64_t a2)
{
  if (a2)
    NSLog(CFSTR("Spatial Profile: Sound & Haptics: Scan Error Player Error: %@"), a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_44(uint64_t a1)
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
  void *v7;
  dispatch_group_t v8;
  NSObject *soundHapticSerialQueue;
  id v10;
  NSObject *v11;
  _QWORD v12[4];
  dispatch_group_t v13;
  HPSSpatialProfileSoundHapticManager *v14;
  id v15;
  int v16;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCategory:error:", *MEMORY[0x1E0C89690], 0);

  v8 = dispatch_group_create();
  soundHapticSerialQueue = self->_soundHapticSerialQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEarCaptureState_completion___block_invoke;
  v12[3] = &unk_1EA29A700;
  v16 = a3;
  v13 = v8;
  v14 = self;
  v15 = v6;
  v10 = v6;
  v11 = v8;
  dispatch_async(soundHapticSerialQueue, v12);

}

void __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEarCaptureState_completion___block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  uint64_t v4;
  id *v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id *v10;
  NSObject *v11;
  _QWORD *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  uint8_t buf[16];

  v2 = *(_DWORD *)(a1 + 56);
  if (v2 == 1)
  {
    sharedBluetoothSettingsLogComponent();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB30C000, v13, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Sound & Haptics: Ear Progress Second", buf, 2u);
    }

    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    v14 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEarCaptureState_completion___block_invoke_49;
    v20[3] = &unk_1EA29A6B0;
    v5 = &v21;
    v21 = *(id *)(a1 + 32);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "setCompletionHandler:", v20);
    v15 = *(void **)(*(_QWORD *)(a1 + 40) + 48);
    v19 = 0;
    objc_msgSend(v15, "startAtTime:error:", &v19, 0.0);
    v7 = v19;
    if (v7)
    {
      sharedBluetoothSettingsLogComponent();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEarCaptureState_completion___block_invoke_cold_2();

    }
    v9 = *(NSObject **)(a1 + 32);
    v17[0] = v14;
    v17[1] = 3221225472;
    v17[2] = __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEarCaptureState_completion___block_invoke_52;
    v17[3] = &unk_1EA29A6D8;
    v10 = &v18;
    v18 = *(id *)(a1 + 48);
    v11 = MEMORY[0x1E0C80D38];
    v12 = v17;
  }
  else
  {
    if (v2)
      return;
    sharedBluetoothSettingsLogComponent();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB30C000, v3, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Sound & Haptics: Ear Progress First", buf, 2u);
    }

    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    v4 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEarCaptureState_completion___block_invoke_45;
    v25[3] = &unk_1EA29A6B0;
    v5 = &v26;
    v26 = *(id *)(a1 + 32);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "setCompletionHandler:", v25);
    v6 = *(void **)(*(_QWORD *)(a1 + 40) + 40);
    v24 = 0;
    objc_msgSend(v6, "startAtTime:error:", &v24, 0.0);
    v7 = v24;
    if (v7)
    {
      sharedBluetoothSettingsLogComponent();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEarCaptureState_completion___block_invoke_cold_1();

    }
    v9 = *(NSObject **)(a1 + 32);
    v22[0] = v4;
    v22[1] = 3221225472;
    v22[2] = __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEarCaptureState_completion___block_invoke_48;
    v22[3] = &unk_1EA29A6D8;
    v10 = &v23;
    v23 = *(id *)(a1 + 48);
    v11 = MEMORY[0x1E0C80D38];
    v12 = v22;
  }
  dispatch_group_notify(v9, v11, v12);

}

void __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEarCaptureState_completion___block_invoke_45(uint64_t a1, uint64_t a2)
{
  if (a2)
    NSLog(CFSTR("Spatial Profile: Sound & Haptics: Scan First Tick Player Error: %@"), a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEarCaptureState_completion___block_invoke_48(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEarCaptureState_completion___block_invoke_49(uint64_t a1, uint64_t a2)
{
  if (a2)
    NSLog(CFSTR("Spatial Profile: Sound & Haptics: Scan Second Tick Player Error: %@"), a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEarCaptureState_completion___block_invoke_52(uint64_t a1)
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_soundHapticSerialQueue, 0);
  objc_storeStrong((id *)&self->_enrollmentCompletedPlayer, 0);
  objc_storeStrong((id *)&self->_scanErrorPlayer, 0);
  objc_storeStrong((id *)&self->_scanCompletedPlayer, 0);
  objc_storeStrong((id *)&self->_scanSecondTickPlayer, 0);
  objc_storeStrong((id *)&self->_scanFirstTickPlayer, 0);
  objc_storeStrong((id *)&self->_enrollGuidancePlayer, 0);
  objc_storeStrong((id *)&self->_scanInProgressPlayer, 0);
  objc_storeStrong((id *)&self->_scanLockPlayer, 0);
  objc_storeStrong((id *)&self->_engine, 0);
}

- (void)playEnrollGuidance:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1DB30C000, v0, v1, "Spatial Profile: Sound & Haptics: Start Scan In Progress Player Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initPlayerWithFileName:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1DB30C000, v0, v1, "Spatial Profile: Sound & Haptics: Create Pattern Player Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initPlayerWithFileName:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1DB30C000, v0, v1, "Spatial Profile: Sound & Haptics: Create Pattern Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)triggerSoundHapticForEnrollmentState:(os_log_t)log completion:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DB30C000, log, OS_LOG_TYPE_ERROR, "Spatial Profile: Sound & Haptics: Scan Error", v1, 2u);
}

- (void)triggerSoundHapticForEnrollmentState:completion:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1DB30C000, v0, v1, "Spatial Profile: Sound & Haptics: Set Category Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1DB30C000, v0, v1, "Spatial Profile: Sound & Haptics: Start Scan Lock Player Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_30_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1DB30C000, v0, v1, "Spatial Profile: Sound & Haptics: Start Scan Completed Player Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_35_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1DB30C000, v0, v1, "Spatial Profile: Sound & Haptics: Start Enrollment Completed Player Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEnrollmentState_completion___block_invoke_40_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1DB30C000, v0, v1, "Spatial Profile: Sound & Haptics: Start Scan Error Player Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEarCaptureState_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1DB30C000, v0, v1, "Spatial Profile: Sound & Haptics: Start Scan First Tick Player Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __87__HPSSpatialProfileSoundHapticManager_triggerSoundHapticForEarCaptureState_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1DB30C000, v0, v1, "Spatial Profile: Sound & Haptics: Start Scan Second Tick Player Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
