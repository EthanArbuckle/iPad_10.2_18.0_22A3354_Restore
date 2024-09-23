@implementation MNHapticResourceController

- (BOOL)triggerVibration
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint8_t buf[8];
  uint64_t v8;
  void *v9;
  _QWORD v10[2];
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[MNHapticResourceController stopVibrating](self, "stopVibrating");
  v10[0] = *MEMORY[0x1E0C9AE50];
  v10[1] = &unk_1E620F0B0;
  v11 = *MEMORY[0x1E0C9AE40];
  v12 = &unk_1E620F0C8;
  v13 = v10[0];
  v14 = &unk_1E620F0E0;
  v15 = v11;
  v16 = &unk_1E620F0F8;
  v17 = v10[0];
  v18 = &unk_1E620F110;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 10);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", &unk_1E620F9D8, CFSTR("Intensity"), v2, CFSTR("VibePattern"), 0);
  v8 = *MEMORY[0x1E0C92548];
  v9 = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  GetAudioLogForMNHapticResourceControllerCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_INFO, "ⓗ Started vibration", buf, 2u);
  }

  AudioServicesPlaySystemSoundWithOptions();
  return 1;
}

- (void)stopVibrating
{
  NSObject *v3;
  uint8_t v4[16];

  GetAudioLogForMNHapticResourceControllerCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_INFO, "ⓗ Stopping vibration", v4, 2u);
  }

  AudioServicesStopSystemSound();
  self->_isVibrating = 0;
}

- (BOOL)vibrating
{
  return self->_isVibrating;
}

- (BOOL)playHapticSound:(unint64_t)a3 andReport:(id *)a4
{
  int v6;
  SystemSoundID v7;
  NSObject *v8;
  void *v10;
  void *v11;
  _QWORD v13[6];
  uint8_t buf[4];
  unint64_t v15;
  __int16 v16;
  SystemSoundID v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a3 >= 3)
  {
    if (a4)
    {
      v10 = (void *)MEMORY[0x1E0CB35C8];
      NAVAudioErrorDomain();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 3500, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    if (a3 == 2)
      v6 = 1415;
    else
      v6 = 1417;
    if (a3 == 1)
      v7 = 1414;
    else
      v7 = v6;
    GetAudioLogForMNHapticResourceControllerCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      v15 = a3;
      v16 = 1024;
      v17 = v7;
      _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_INFO, "ⓗ Starting haptic playback for id %lu (system id %u)", buf, 0x12u);
    }

    self->_isVibrating = 1;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __56__MNHapticResourceController_playHapticSound_andReport___block_invoke;
    v13[3] = &unk_1E61D23F0;
    v13[4] = self;
    v13[5] = a3;
    AudioServicesPlaySystemSoundWithCompletion(v7, v13);
  }
  return a3 < 3;
}

void __56__MNHapticResourceController_playHapticSound_andReport___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD v2[6];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __56__MNHapticResourceController_playHapticSound_andReport___block_invoke_2;
  v2[3] = &unk_1E61D23F0;
  v1 = *(_QWORD *)(a1 + 40);
  v2[4] = *(_QWORD *)(a1 + 32);
  v2[5] = v1;
  dispatch_async(MEMORY[0x1E0C80D38], v2);
}

void __56__MNHapticResourceController_playHapticSound_andReport___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  char v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 0;
  GetAudioLogForMNHapticResourceControllerCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v7 = 134217984;
    v8 = v3;
    _os_log_impl(&dword_1B0AD7000, v2, OS_LOG_TYPE_INFO, "ⓗ Finished haptic playback for id %lu", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hapticResourceController:didFinishPlayingHapticIndicator:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (MNHapticControllerDelegate)delegate
{
  return (MNHapticControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
