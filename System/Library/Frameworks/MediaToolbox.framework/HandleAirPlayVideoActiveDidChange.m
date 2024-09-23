@implementation HandleAirPlayVideoActiveDidChange

void __fpic_HandleAirPlayVideoActiveDidChange_block_invoke(_QWORD *a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *DerivedStorage;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  const void *v11;
  CFTypeRef *v12;
  uint64_t v13;
  uint64_t v14;
  const __CFArray *Copy;
  __int128 v16;
  uint64_t v17;
  CFIndex Count;
  unint64_t v19;
  const void *ValueAtIndex;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  CMTime v26;
  CMTime v27;
  CMTime v28;

  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = fpic_isAirplayVideoActive(a1[8]);
  v2 = *(unsigned __int8 *)(*(_QWORD *)(a1[4] + 8) + 24);
  v3 = a1[9];
  if (v2 != *(unsigned __int8 *)(v3 + 1080))
  {
    *(_BYTE *)(v3 + 1080) = v2;
    if (CFArrayGetCount(*(CFArrayRef *)(v3 + 600)) >= 1)
    {
      v4 = MEMORY[0x1E0CA2E18];
      if (*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
      {
        if (fpic_ShouldIgnoreInterstitialsDueToExternalPlaybackStrategy(a1[7]))
        {
          v5 = a1[7];
          v6 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
          DerivedStorage = (_BYTE *)CMBaseObjectGetDerivedStorage();
          if (DerivedStorage[975])
          {
            v8 = DerivedStorage;
            if (DerivedStorage[352] || DerivedStorage[353])
            {
              if (fpic_GetCurrentlyPlayingEvent())
              {
                v9 = CMBaseObjectGetDerivedStorage();
                *(_DWORD *)(v9 + 720) = FPSupport_IncrementSeekID(*(_DWORD *)(v9 + 720));
                memset(&v28, 0, sizeof(v28));
                fpic_GetCurrentDepartureTime((__n128 *)&v28);
                v27 = *(CMTime *)(v8 + 16);
                fpic_AccumulateDuration(&v28, &v27);
                fpic_GetCurrentlyPlayingEventPlayoutTime(v5, 0, v6, &v27);
                fpic_AccumulateDuration(&v28, &v27);
                v10 = *((_QWORD *)v8 + 19);
                v26 = v28;
                v24 = *(_OWORD *)v4;
                v25 = *(_QWORD *)(v4 + 16);
                v22 = v24;
                v23 = v25;
                FPSupport_SetCurrentTimeWithRangeIDAndReason(v10, (__int128 *)&v26.value, 5, &v24, &v22);
              }
            }
          }
        }
      }
      v11 = (const void *)a1[7];
      v12 = (CFTypeRef *)(*(_QWORD *)(a1[6] + 8) + 24);
      v13 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
      v14 = CMBaseObjectGetDerivedStorage();
      Copy = (const __CFArray *)FigCFArrayCreateCopy();
      v16 = *(_OWORD *)v4;
      *(_OWORD *)(v14 + 896) = *(_OWORD *)v4;
      v17 = *(_QWORD *)(v4 + 16);
      *(_QWORD *)(v14 + 912) = v17;
      *(_OWORD *)(v14 + 744) = v16;
      *(_QWORD *)(v14 + 760) = v17;
      if (fpic_GetCurrentlyPlayingEvent())
      {
        fpic_GetCurrentlyPlayingEventPlayoutTime((uint64_t)v11, 0, v13, &v28);
        *(CMTime *)(v14 + 744) = v28;
      }
      fpic_ResetCurrentEventList(v11, v13, v12);
      if (Copy)
      {
        Count = CFArrayGetCount(Copy);
        if (Count >= 1)
        {
          v19 = Count + 1;
          do
          {
            ValueAtIndex = CFArrayGetValueAtIndex(Copy, v19 - 2);
            CFSetRemoveValue(*(CFMutableSetRef *)(v14 + 632), ValueAtIndex);
            --v19;
          }
          while (v19 > 1);
        }
        CFRelease(Copy);
      }
    }
    v21 = a1[9];
    if (*(_DWORD *)(v21 + 1084) == 1)
    {
      fpic_PostNotification(v21, (uint64_t)CFSTR("fpiEventsDidChange"), (const void *)a1[7], 0);
      fpic_UpdatePlaybackItemEventList(a1[7], *(_QWORD *)(a1[9] + 152));
    }
  }
}

@end
