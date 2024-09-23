@implementation FVSynthEngine

void __FVSynthEngine_SendVibeStoppedNotification_block_invoke(uint64_t a1)
{
  const void *v2;

  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterPostNotification();
  v2 = *(const void **)(a1 + 40);
  if (v2)
    CFRelease(v2);
}

void __FVSynthEngine_StartVibrationWithPattern_block_invoke(uint64_t a1)
{
  NSObject *v1;
  _QWORD v2[5];

  v1 = *(NSObject **)(gFVInfo + 8);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 0x40000000;
  v2[2] = __FVSynthEngine_StartVibrationWithPattern_block_invoke_2;
  v2[3] = &__block_descriptor_tmp_2;
  v2[4] = *(_QWORD *)(a1 + 32);
  MXDispatchAsync((uint64_t)"FVSynthEngine_StartVibrationWithPattern_block_invoke", (uint64_t)"FigVibrator_VibeSynthEngine.c", 51, 0, 0, v1, (uint64_t)v2);
}

void __FVSynthEngine_StartVibrationWithPattern_block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  const void *v5;

  if (gFVInfo)
  {
    v2 = *(void **)(a1 + 32);
    if (!MEMORY[0x1940352F8](*(_QWORD *)gFVInfo))
    {
      v3 = gFVInfo;
      v4 = *(_DWORD *)(gFVInfo + 68);
      if (v4)
        *(_DWORD *)(gFVInfo + 68) = --v4;
      if (*(_BYTE *)(v3 + 20))
      {
        notify_set_state(*(_DWORD *)(v3 + 16), 0);
        notify_post("com.apple.coremedia.vibration");
        v4 = *(_DWORD *)(v3 + 68);
      }
      if (!v4)
        FigVibratorPostNotification(CFSTR("VibeWillStop"));
      if (v2)
        FVSynthEngine_SendVibeStoppedNotification(v3, v2);
      MEMORY[0x194035304](*(_QWORD *)gFVInfo);
    }
  }
  else
  {
    FigSignalErrorAt();
  }
  v5 = *(const void **)(a1 + 32);
  if (v5)
    CFRelease(v5);
}

@end
