@implementation FigCaptureSessionServerStart

void __FigCaptureSessionServerStart_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = mach_absolute_time();
  v4 = mach_continuous_time();
  FigCaptureSessionPrewarm(a2, v3, v4, CFSTR("RBSProcessMonitor"));
}

uint64_t __FigCaptureSessionServerStart_block_invoke_2(uint64_t a1, uint64_t a2)
{
  captureSessionServer_setWombatEnabledState(0, a2);
  return captureSessionServer_setWombatInUseState(0, a2);
}

void __FigCaptureSessionServerStart_block_invoke_3()
{
  const __CFString *v0;
  const __CFString *v1;
  CFPropertyListRef v2;
  const void *v3;
  void *v4;
  id v5;

  if (FigDebugIsInternalBuild())
  {
    v0 = (const __CFString *)*MEMORY[0x1E0C9B260];
    v1 = (const __CFString *)*MEMORY[0x1E0C9B230];
    v2 = (id)CFPreferencesCopyValue(CFSTR("LastShownGPUErrorTTRPromptDate"), CFSTR("com.apple.cameracapture.volatile"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
    v3 = (const void *)objc_msgSend(MEMORY[0x1E0C99D68], "date");
    if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar"), "isDate:inSameDayAsDate:", v2, v3) & 1) == 0)
    {
      v4 = (id)CFPreferencesCopyValue(CFSTR("LastShownGPUErrorTTRPromptBuildVersion"), CFSTR("com.apple.cameracapture.volatile"), v0, v1);
      v5 = (id)MGCopyAnswer();
      if ((objc_msgSend(v4, "isEqualToString:", v5) & 1) == 0)
      {
        FigCapturePromptOpenTapToRadar((uint64_t)CFSTR("Photo processing error. Please file a radar."), (uint64_t)CFSTR("GPU error during processing"), (uint64_t)CFSTR("GPU error during processing"), 2, 2, 6, 0.0);
        CFPreferencesSetValue(CFSTR("LastShownGPUErrorTTRPromptDate"), v3, CFSTR("com.apple.cameracapture.volatile"), v0, v1);
        CFPreferencesSetValue(CFSTR("LastShownGPUErrorTTRPromptBuildVersion"), v5, CFSTR("com.apple.cameracapture.volatile"), v0, v1);
      }
    }
  }
}

@end
