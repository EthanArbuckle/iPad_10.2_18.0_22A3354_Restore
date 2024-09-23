@implementation FigPlayerAirPlayRoute

uint64_t __FigPlayerAirPlayRoute_GetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  FigPlayerAirPlayRoute_GetTypeID_FigPlayerAirPlayRouteTypeID = result;
  return result;
}

const void *__FigPlayerAirPlayRoute_CopyProperty_block_invoke(uint64_t a1)
{
  const void *result;
  _QWORD *v3;

  result = (const void *)FigCFDictionaryGetBooleanIfPresent();
  v3 = *(_QWORD **)(a1 + 40);
  if (v3)
  {
    result = (const void *)*MEMORY[0x1E0C9AE40];
    if (*MEMORY[0x1E0C9AE40])
    {
      result = CFRetain(result);
      v3 = *(_QWORD **)(a1 + 40);
    }
    *v3 = result;
  }
  return result;
}

uint64_t __FigPlayerAirPlayRoute_CopyProperty_block_invoke_2(uint64_t a1)
{
  return playerairplay_copyRoutingContext(*(_QWORD *)(a1 + 40), (CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
}

CFTypeRef __FigPlayerAirPlayRoute_CopyProperty_block_invoke_3(uint64_t a1)
{
  CFTypeRef result;

  result = *(CFTypeRef *)(*(_QWORD *)(a1 + 40) + 48);
  if (result)
    result = CFRetain(result);
  **(_QWORD **)(a1 + 32) = result;
  return result;
}

void __FigPlayerAirPlayRoute_SetProperty_block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  const void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, _QWORD, uint64_t);

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 16))
  {
    v5 = *(_QWORD *)(v2 + 192);
    if (v5)
    {
      v6 = *(_QWORD *)(a1 + 40);
      v7 = *(_QWORD *)(CMBaseObjectGetVTable() + 16);
      if (v7)
      {
        v8 = *(void (**)(uint64_t, _QWORD, uint64_t))(v7 + 56);
        if (v8)
          v8(v5, *MEMORY[0x1E0D49CA0], v6);
      }
    }
  }
  v3 = *(const void **)(a1 + 40);
  if (v3)
    CFRelease(v3);
  v4 = *(const void **)(a1 + 32);
  if (v4)
    CFRelease(v4);
}

void __FigPlayerAirPlayRoute_ResetRoutingContextIfNeeded_block_invoke(uint64_t a1)
{
  _BYTE *v2;

  v2 = *(_BYTE **)(a1 + 32);
  if (v2[16]
    || (playerairplayroute_resetRoutingContextIfNeededInternal((uint64_t)v2), (v2 = *(_BYTE **)(a1 + 32)) != 0))
  {
    CFRelease(v2);
  }
}

uint64_t __FigPlayerAirPlayRoute_ReevaluateCurrentRoute_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(result + 16))
    return playerairplayroute_pickableRoutesChangedGuts(result);
  return result;
}

void __FigPlayerAirPlayRoute_setNewFigAudioSession_block_invoke(uint64_t a1)
{
  uint64_t v2;
  CFTypeRef v3;
  NSObject *global_queue;
  uint64_t v5;
  const void *v6;
  const void *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  const void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, _QWORD, _QWORD, uint64_t);
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  const void *v18;
  _QWORD v19[5];
  CFTypeRef cf;

  cf = 0;
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 16))
    goto LABEL_24;
  if (*(_QWORD *)(v2 + 192))
  {
    playerairplayroute_stopFigAudioSessionListeners(v2);
    v3 = CFRetain(*(CFTypeRef *)(*(_QWORD *)(a1 + 32) + 192));
    global_queue = dispatch_get_global_queue(0, 0);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 0x40000000;
    v19[2] = __FigPlayerAirPlayRoute_setNewFigAudioSession_block_invoke_2;
    v19[3] = &__block_descriptor_tmp_75_0;
    v19[4] = v3;
    dispatch_async(global_queue, v19);
    v5 = *(_QWORD *)(a1 + 32);
    *(_WORD *)(v5 + 216) = 0;
    playerairplayroute_createOrReleaseClientAssertionIfNeeded((unsigned int *)v5);
    v2 = *(_QWORD *)(a1 + 32);
    v6 = *(const void **)(v2 + 192);
  }
  else
  {
    v6 = 0;
  }
  v7 = *(const void **)(a1 + 40);
  *(_QWORD *)(v2 + 192) = v7;
  if (v7)
    CFRetain(v7);
  if (v6)
    CFRelease(v6);
  playerairplayroute_updateAudioSessionPolicyForBuffered(*(_QWORD *)(a1 + 32));
  v8 = *(_QWORD *)(a1 + 32);
  v9 = (_QWORD *)MEMORY[0x1E0C9AE00];
  if (*(_QWORD *)(v8 + 192))
  {
    CMNotificationCenterGetDefaultLocalCenter();
    FigNotificationCenterAddWeakListener();
    CMNotificationCenterGetDefaultLocalCenter();
    FigNotificationCenterAddWeakListener();
    CMNotificationCenterGetDefaultLocalCenter();
    FigNotificationCenterAddWeakListener();
    CMNotificationCenterGetDefaultLocalCenter();
    FigNotificationCenterAddWeakListener();
    CMNotificationCenterGetDefaultLocalCenter();
    FigNotificationCenterAddWeakListener();
    CMNotificationCenterGetDefaultLocalCenter();
    FigNotificationCenterAddWeakListener();
    CMNotificationCenterGetDefaultLocalCenter();
    FigNotificationCenterAddWeakListener();
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(const void **)(v10 + 224);
    if (v11)
    {
      CFRelease(v11);
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224) = 0;
      v10 = *(_QWORD *)(a1 + 32);
    }
    v12 = *(_QWORD *)(v10 + 192);
    if (v12)
    {
      v13 = *(_QWORD *)(CMBaseObjectGetVTable() + 16);
      if (v13)
      {
        v14 = *(void (**)(uint64_t, _QWORD, _QWORD, uint64_t))(v13 + 48);
        if (v14)
          v14(v12, *MEMORY[0x1E0D497D0], *v9, v10 + 224);
      }
    }
    playerairplay_checkIfPrimaryAppChanged(*(NSObject ***)(a1 + 32));
    v8 = *(_QWORD *)(a1 + 32);
  }
  playerairplayroute_resetRoutingContextIfNeededInternal(v8);
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 192);
  if (v15)
  {
    v16 = *(_QWORD *)(CMBaseObjectGetVTable() + 16);
    if (v16)
    {
      v17 = *(void (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(v16 + 48);
      if (v17)
        v17(v15, *MEMORY[0x1E0D49528], *v9, &cf);
    }
  }
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 184) + 16))();
  if (cf)
    CFRelease(cf);
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
LABEL_24:
    CFRelease((CFTypeRef)v2);
  v18 = *(const void **)(a1 + 40);
  if (v18)
    CFRelease(v18);
}

void __FigPlayerAirPlayRoute_setNewFigAudioSession_block_invoke_2(uint64_t a1)
{
  CFMutableDictionaryRef Mutable;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, CFMutableDictionaryRef, _QWORD);

  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  FigCFDictionarySetValue();
  FigCFDictionarySetValue();
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v4 = *(_QWORD *)(CMBaseObjectGetVTable() + 16);
    if (v4)
    {
      v5 = *(void (**)(uint64_t, CFMutableDictionaryRef, _QWORD))(v4 + 104);
      if (v5)
        v5(v3, Mutable, 0);
    }
  }
  if (Mutable)
    CFRelease(Mutable);
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
