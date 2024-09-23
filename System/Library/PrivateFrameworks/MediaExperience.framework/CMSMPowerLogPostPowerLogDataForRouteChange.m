@implementation CMSMPowerLogPostPowerLogDataForRouteChange

void __CMSMPowerLogPostPowerLogDataForRouteChange_block_invoke()
{
  NSPointerArray *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  __CFDictionary *PowerLogDataForSession;
  __CFDictionary *v8;
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v10;
  uint64_t CurrentRouteTypeAtIndex;
  const __CFString *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[MXSessionManager mxCoreSessionListBeginIteration](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "mxCoreSessionListBeginIteration");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v0 = -[MXSessionManager mxCoreSessionList](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance", 0), "mxCoreSessionList");
  v1 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v0, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v1)
  {
    v2 = v1;
    v3 = 0;
    v4 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v14 != v4)
          objc_enumerationMutation(v0);
        v6 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v6, "isPlaying"))
        {
          PowerLogDataForSession = CMSMPowerLogCreatePowerLogDataForSession(v6);
          if (PowerLogDataForSession)
          {
            v8 = PowerLogDataForSession;
            CMSMPowerLogPostPowerLogData(CFSTR("CoreMedia_AudioPlayback"), PowerLogDataForSession);
            CFRelease(v8);
          }
          v3 = 1;
        }
      }
      v2 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v0, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v2);
  }
  else
  {
    v3 = 0;
  }
  -[MXSessionManager mxCoreSessionListEndIteration](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "mxCoreSessionListEndIteration");
  if (!v3)
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    if (Mutable)
    {
      v10 = Mutable;
      CurrentRouteTypeAtIndex = CMSMUtility_GetCurrentRouteTypeAtIndex(0);
      v12 = cmsmpowerlogConvertToExternalRouteNameForPowerLog(CurrentRouteTypeAtIndex);
      CFDictionarySetValue(v10, CFSTR("AudioRoute"), v12);
      CFDictionarySetValue(v10, CFSTR("Operation"), CFSTR("AudioPlayback_RouteChange"));
      CMSMPowerLogPostPowerLogData(CFSTR("CoreMedia_AudioPlayback"), v10);
      CFRelease(v10);
    }
  }
}

@end
