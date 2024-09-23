@implementation RegisterForThermalNotifications

void __fpServer_RegisterForThermalNotifications_block_invoke(int a1, int token)
{
  uint64_t v2;
  CFMutableDictionaryRef Mutable;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, _QWORD, const __CFString *);
  uint64_t v7;
  uint64_t v8;
  unsigned int (*v9)(uint64_t, CFMutableDictionaryRef, CFTypeRef *);
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, _QWORD);
  _BOOL4 v13;
  const void *v14;
  _BOOL4 v15;
  uint64_t state64;
  CFTypeRef cf;
  CFTypeRef v18;

  state64 = 0;
  notify_get_state(token, &state64);
  if (state64 >= 0x28)
  {
    v18 = 0;
    if (bigBossSession)
      return;
    getpid();
    v2 = *MEMORY[0x1E0C9AE00];
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    cf = 0;
    if (FPSupport_CanUseCMSession())
    {
      if (CMSessionCreate() || FigAudioSessionCreateWithCMSession(v2, v18, &bigBossSession))
        goto LABEL_23;
      v4 = bigBossSession;
      if (bigBossSession)
      {
        v5 = *(_QWORD *)(CMBaseObjectGetVTable() + 16);
        if (v5)
        {
          v6 = *(void (**)(uint64_t, _QWORD, const __CFString *))(v5 + 56);
          if (v6)
            v6(v4, *MEMORY[0x1E0D495D8], CFSTR("BigBadThermalBoss"));
        }
      }
    }
    else if (FigAudioSessionCreateUsingAuxiliaryAVAudioSession(v2, 0, (uint64_t)CFSTR("BigBadThermalBoss"), &bigBossSession))
    {
      goto LABEL_23;
    }
    FigCFDictionarySetInt32();
    FigCFDictionarySetInt32();
    FigCFDictionarySetInt32();
    FigCFDictionarySetInt32();
    v7 = bigBossSession;
    if (bigBossSession
      && (v8 = *(_QWORD *)(CMBaseObjectGetVTable() + 16)) != 0
      && (v9 = *(unsigned int (**)(uint64_t, CFMutableDictionaryRef, CFTypeRef *))(v8 + 104)) != 0
      && v9(v7, Mutable, &cf))
    {
      v10 = bigBossSession;
      if (bigBossSession)
      {
        v11 = *(_QWORD *)(CMBaseObjectGetVTable() + 16);
        if (v11)
        {
          v12 = *(uint64_t (**)(uint64_t, _QWORD))(v11 + 80);
          if (v12)
          {
            v13 = v12(v10, 0) != 0;
LABEL_24:
            if (cf)
              CFRelease(cf);
            if (Mutable)
              CFRelease(Mutable);
            if (v18)
              CFRelease(v18);
            if (bigBossSession)
              v15 = v13;
            else
              v15 = 0;
            if (v15)
            {
              CFRelease((CFTypeRef)bigBossSession);
              bigBossSession = 0;
            }
            return;
          }
        }
      }
    }
    else
    {
      v14 = (const void *)FigCFCopyCompactDescription();
      if (v14)
        CFRelease(v14);
    }
LABEL_23:
    v13 = 1;
    goto LABEL_24;
  }
  if (bigBossSession)
  {
    CFRelease((CFTypeRef)bigBossSession);
    bigBossSession = 0;
  }
}

@end
