@implementation APAudioEngineRealTimeCreate

void __APAudioEngineRealTimeCreate_block_invoke(uint64_t a1, int a2)
{
  void *specific;
  uint64_t v4;
  uint64_t v5;
  const void *v6;
  float v7;
  uint64_t state64;

  specific = dispatch_get_specific((const void *)kAPAudioEngineRealTimeDispatchSpecificKey_WeakAudioEngineHolder);
  state64 = 0;
  notify_get_state(a2, &state64);
  if (specific)
  {
    v4 = state64;
    v5 = FigCFWeakReferenceHolderCopyReferencedObject();
    if (v5)
    {
      v6 = (const void *)v5;
      v7 = (double)v4 / 1000.0;
      CMBaseObjectGetDerivedStorage();
      if (gLogCategory_APAudioEngineRealTime <= 50
        && (gLogCategory_APAudioEngineRealTime != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      realTimeAudioEngine_setAudioLatency(v7);
      CFRelease(v6);
    }
  }
  else
  {
    APSLogErrorAt();
  }
}

@end
