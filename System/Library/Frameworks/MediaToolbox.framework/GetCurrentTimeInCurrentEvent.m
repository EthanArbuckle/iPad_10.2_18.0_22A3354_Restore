@implementation GetCurrentTimeInCurrentEvent

const void *__fpic_GetCurrentTimeInCurrentEvent_block_invoke(uint64_t a1)
{
  const void *CurrentlyPlayingEvent;
  uint64_t FirstCurrentItem;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  CMTime *v9;
  CMTime *v10;
  const void *result;
  CMTime v12;

  CurrentlyPlayingEvent = fpic_GetCurrentlyPlayingEvent();
  FirstCurrentItem = fpic_GetFirstCurrentItem(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  if (CurrentlyPlayingEvent)
  {
    v4 = FirstCurrentItem;
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = MEMORY[0x1E0CA2E68];
    *(_OWORD *)(v5 + 32) = *MEMORY[0x1E0CA2E68];
    *(_QWORD *)(v5 + 48) = *(_QWORD *)(v6 + 16);
    if (FirstCurrentItem)
    {
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v8 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
      if (v8)
        v8(v4, v7 + 32);
      v9 = (CMTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32);
      v12 = *(CMTime *)(*(_QWORD *)(a1 + 56) + 408);
      fpic_AccumulateDuration(v9, &v12);
      v10 = (CMTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32);
      v12 = *(CMTime *)(*(_QWORD *)(a1 + 56) + 456);
      fpic_AccumulateDuration(v10, &v12);
    }
    result = (const void *)fpic_UnwrapEvent(*(_QWORD *)(a1 + 40), (uint64_t)CurrentlyPlayingEvent);
    if (result)
      result = CFRetain(result);
  }
  else
  {
    result = 0;
  }
  **(_QWORD **)(a1 + 64) = result;
  return result;
}

void __fpirc_GetCurrentTimeInCurrentEvent_block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *CurrentEventWrapperOnQueue;
  BOOL v4;
  uint64_t v5;
  void (*v6)(uint64_t, _QWORD, CFTypeRef *);
  uint64_t FigBaseObject;
  void (*v8)(uint64_t, const __CFString *, _QWORD, CMTimebaseRef *);
  CMTime v9;
  CMTimebaseRef timebase;
  CFTypeRef cf;

  timebase = 0;
  v2 = (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 56))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32));
  CurrentEventWrapperOnQueue = fpirc_GetCurrentEventWrapperOnQueue(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  if (CurrentEventWrapperOnQueue)
    v4 = v2 == 0;
  else
    v4 = 1;
  if (v4)
  {
    **(_QWORD **)(a1 + 64) = 0;
  }
  else
  {
    v5 = (uint64_t)CurrentEventWrapperOnQueue;
    cf = 0;
    v6 = *(void (**)(uint64_t, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
    if (v6)
    {
      v6(v2, 0, &cf);
      if (cf)
      {
        FigBaseObject = FigPlaybackItemGetFigBaseObject(cf);
        v8 = *(void (**)(uint64_t, const __CFString *, _QWORD, CMTimebaseRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                         + 48);
        if (v8)
          v8(FigBaseObject, CFSTR("Timebase"), *MEMORY[0x1E0C9AE00], &timebase);
        if (cf)
          CFRelease(cf);
      }
    }
    if (timebase)
    {
      CMTimebaseGetTime(&v9, timebase);
      *(CMTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = v9;
    }
    fpirc_UnwrapEvent(*(_QWORD *)(a1 + 48), v5);
    **(_QWORD **)(a1 + 64) = 0;
    if (timebase)
      CFRelease(timebase);
  }
}

@end
