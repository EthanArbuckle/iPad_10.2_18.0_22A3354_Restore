@implementation InitializeUIEventManager

uint64_t __InitializeUIEventManager_block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD v5[5];
  _QWORD v6[5];

  v2 = (_QWORD *)operator new();
  v2[1] = 0;
  *v2 = os_log_create("com.apple.coreaudio", "ui");
  kUIEventManagerLogSubsystem = (uint64_t)v2;
  gOrientationObserver = (uint64_t)objc_alloc_init(MEMORY[0x1E0D23180]);
  v3 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __InitializeUIEventManager_block_invoke_2;
  v6[3] = &unk_1E450F518;
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend((id)gOrientationObserver, "setHandler:", v6);
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __InitializeUIEventManager_block_invoke_4;
  v5[3] = &unk_1E450F518;
  v5[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend((id)gOrientationObserver, "activeInterfaceOrientationWithCompletion:", v5);
}

void __InitializeUIEventManager_block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD v5[5];
  _QWORD v6[5];
  __int128 v7;
  uint64_t v8;
  const char *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  __int128 v15;
  uint64_t v16;

  v2 = *(NSObject **)(a1 + 32);
  v3 = MEMORY[0x1E0C809B0];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __InitializeUIEventManager_block_invoke_3;
  v5[3] = &unk_1E4516D60;
  v5[4] = a2;
  if (AudioControlQueue(void)::once != -1)
    dispatch_once(&AudioControlQueue(void)::once, &__block_literal_global_5);
  v4 = v5;
  if (AudioControlQueue(void)::gAudioControlQueue == v2)
  {
    v15 = 0uLL;
    v16 = 0;
    CreateACQDispatchID();
    v6[0] = v3;
    v6[1] = 3221225472;
    v6[2] = ___ZN2AT13DispatchBlockEPU28objcproto17OS_dispatch_queue8NSObjectU13block_pointerFvvEbPKcS6_iyy_block_invoke_5416;
    v6[3] = &unk_1E4516518;
    v7 = v15;
    v8 = v16;
    v9 = "dispatch_async";
    v10 = "InitializeUIEventManager_block_invoke_2";
    v11 = "UIEventManager.mm";
    v14 = 94;
    v12 = 0;
    v13 = 0;
    v6[4] = v5;
    MEMORY[0x1A1B05ECC](&v15, 0);
    v4 = v6;
  }
  dispatch_async(v2, v4);
}

void __InitializeUIEventManager_block_invoke_4(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD v5[5];
  _QWORD v6[5];
  __int128 v7;
  uint64_t v8;
  const char *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  __int128 v15;
  uint64_t v16;

  v2 = *(NSObject **)(a1 + 32);
  v3 = MEMORY[0x1E0C809B0];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __InitializeUIEventManager_block_invoke_5;
  v5[3] = &unk_1E4516D60;
  v5[4] = a2;
  if (AudioControlQueue(void)::once != -1)
    dispatch_once(&AudioControlQueue(void)::once, &__block_literal_global_5);
  v4 = v5;
  if (AudioControlQueue(void)::gAudioControlQueue == v2)
  {
    v15 = 0uLL;
    v16 = 0;
    CreateACQDispatchID();
    v6[0] = v3;
    v6[1] = 3221225472;
    v6[2] = ___ZN2AT13DispatchBlockEPU28objcproto17OS_dispatch_queue8NSObjectU13block_pointerFvvEbPKcS6_iyy_block_invoke_5416;
    v6[3] = &unk_1E4516518;
    v7 = v15;
    v8 = v16;
    v9 = "dispatch_async";
    v10 = "InitializeUIEventManager_block_invoke";
    v11 = "UIEventManager.mm";
    v14 = 103;
    v12 = 0;
    v13 = 0;
    v6[4] = v5;
    MEMORY[0x1A1B05ECC](&v15, 0);
    v4 = v6;
  }
  dispatch_async(v2, v4);
}

void __InitializeUIEventManager_block_invoke_5(uint64_t a1)
{
  NSObject *v1;
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (kUIEventManagerLogSubsystem)
  {
    if ((*(_BYTE *)(kUIEventManagerLogSubsystem + 8) & 1) != 0)
    {
      v1 = *(NSObject **)kUIEventManagerLogSubsystem;
      if (*(_QWORD *)kUIEventManagerLogSubsystem)
      {
        if (os_log_type_enabled(*(os_log_t *)kUIEventManagerLogSubsystem, OS_LOG_TYPE_DEBUG))
        {
          v2 = 136315394;
          v3 = "UIEventManager.mm";
          v4 = 1024;
          v5 = 101;
          _os_log_impl(&dword_1A0F4D000, v1, OS_LOG_TYPE_DEBUG, "%25s:%-5d Orientation will be valid from here on.", (uint8_t *)&v2, 0x12u);
        }
      }
    }
  }
}

void __InitializeUIEventManager_block_invoke_3(uint64_t a1)
{
}

@end
