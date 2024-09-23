@implementation FigCaptureSpeakerInterferenceMitigationInitialize

uint64_t __FigCaptureSpeakerInterferenceMitigationInitialize_block_invoke()
{
  uint64_t result;
  const char *CStringPtr;
  uint64_t state64;

  sIsSpeakerInterferenceMitigationRequiredLock = FigSimpleMutexCreate();
  result = FigCaptureAudiomxdSupportEnabled();
  if ((_DWORD)result)
  {
    CStringPtr = CFStringGetCStringPtr(CFSTR("SpeakerInterferenceMitigationRequiredChanged"), 0x8000100u);
    if (FigCaptureCurrentProcessIsCameracaptured()
      || FigCaptureCurrentProcessIsMediaserverd())
    {
      return notify_register_check(CStringPtr, &gSpeakerInterferenceMitigationToken);
    }
    else
    {
      result = FigCaptureCurrentProcessIsAudiomxd();
      if ((_DWORD)result)
      {
        sNotifyQueue = FigDispatchQueueCreateWithPriority();
        result = notify_register_dispatch(CStringPtr, &gSpeakerInterferenceMitigationToken, (dispatch_queue_t)sNotifyQueue, &__block_literal_global_4);
        if (!(_DWORD)result)
        {
          state64 = 0;
          result = notify_get_state(gSpeakerInterferenceMitigationToken, &state64);
          sIsSpeakerInterferenceMitigationRequired = state64;
        }
      }
    }
  }
  return result;
}

void __FigCaptureSpeakerInterferenceMitigationInitialize_block_invoke_2()
{
  uint64_t state64;

  state64 = 0;
  notify_get_state(gSpeakerInterferenceMitigationToken, &state64);
  FigCaptureSpeakerSetInterferenceMitigationIsRequired(state64, 0);
}

@end
