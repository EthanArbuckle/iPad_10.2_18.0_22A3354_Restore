@implementation EnsureNextEventWillBuffer

void __fpic_EnsureNextEventWillBuffer_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  CFIndex Count;
  CFIndex v4;
  CFIndex v5;
  CFIndex v6;
  CFIndex v7;
  CFIndex v8;
  const __CFString *v9;
  const void *v10;
  CFTypeRef v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const __CFString *v16;
  __CFArray *v17;
  CFIndex v18;
  CFTypeRef *v19;
  CMTimeValue v20;
  CFMutableDictionaryRef v21;
  uint64_t v22;
  CFIndex v23;
  CMTime *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t DerivedStorage;
  uint64_t v29;
  uint64_t FigBaseObject;
  unsigned int (*v31)(uint64_t, const __CFString *, _QWORD, CMTime *);
  uint64_t v32;
  BOOL v33;
  __CFString **v34;
  CFIndex i;
  CMTimeValue value;
  uint64_t v37;
  uint64_t SInt32;
  unsigned int (*v39)(uint64_t, uint64_t, const __CFString *, uint64_t, CMTime *);
  CFIndex j;
  CFIndex v41;
  const opaqueCMFormatDescription *ValueAtIndex;
  const AudioFormatListItem *RichestDecodableFormat;
  int mChannelsPerFrame;
  CFIndex v45;
  CMTime v46;
  CMTime rhs;
  CMTime v48;
  CMTime lhs;
  __int128 v50;
  uint64_t v51;
  CMTime time2;
  CMTime time1;

  if (CFArrayGetCount(*(CFArrayRef *)(a1[8] + 600)) < 1)
    return;
  v2 = a1[8];
  Count = CFArrayGetCount(*(CFArrayRef *)(v2 + 600));
  if (Count < 1)
  {
LABEL_7:
    v6 = CFArrayGetCount(*(CFArrayRef *)(a1[8] + 600));
    if (v6 < 1)
    {
LABEL_51:
      if (CFArrayGetCount(*(CFArrayRef *)(*(_QWORD *)(a1[6] + 8) + 24)) >= 1)
      {
        DerivedStorage = CMBaseObjectGetDerivedStorage();
        time1.value = 0;
        time2.value = 0;
        v29 = *(_QWORD *)(DerivedStorage + 152);
        if (v29
          && (FigBaseObject = FigPlaybackItemGetFigBaseObject(v29),
              (v31 = *(unsigned int (**)(uint64_t, const __CFString *, _QWORD, CMTime *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                                  + 48)) != 0)
          && (v32 = *MEMORY[0x1E0C9AE00], !v31(FigBaseObject, CFSTR("ChosenTrackIDArray"), *MEMORY[0x1E0C9AE00], &time1)))
        {
          v33 = 0;
          for (i = 0; ; ++i)
          {
            value = time1.value;
            if (time1.value)
              value = CFArrayGetCount((CFArrayRef)time1.value);
            if (i >= value || v33)
              break;
            v37 = *(_QWORD *)(DerivedStorage + 152);
            CFArrayGetValueAtIndex((CFArrayRef)time1.value, i);
            SInt32 = FigCFNumberGetSInt32();
            v39 = *(unsigned int (**)(uint64_t, uint64_t, const __CFString *, uint64_t, CMTime *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 40);
            if (v39 && !v39(v37, SInt32, CFSTR("FormatDescriptionArray"), v32, &time2))
            {
              v33 = 0;
              for (j = 0; ; ++j)
              {
                v41 = time2.value ? CFArrayGetCount((CFArrayRef)time2.value) : 0;
                if (j >= v41 || v33)
                  break;
                ValueAtIndex = (const opaqueCMFormatDescription *)CFArrayGetValueAtIndex((CFArrayRef)time2.value, j);
                if (CMFormatDescriptionGetMediaType(ValueAtIndex) == 1936684398)
                {
                  RichestDecodableFormat = CMAudioFormatDescriptionGetRichestDecodableFormat(ValueAtIndex);
                  if (RichestDecodableFormat)
                    mChannelsPerFrame = RichestDecodableFormat->mASBD.mChannelsPerFrame;
                  else
                    mChannelsPerFrame = CMAudioFormatDescriptionGetChannelCount();
                  v33 = mChannelsPerFrame < 3;
                }
                else
                {
                  v33 = 0;
                }
              }
              if (time2.value)
              {
                CFRelease((CFTypeRef)time2.value);
                time2.value = 0;
              }
            }
            else
            {
              v33 = 0;
            }
          }
        }
        else
        {
          v33 = 0;
        }
        if (time1.value)
          CFRelease((CFTypeRef)time1.value);
        v34 = kFigPlayerMultichannelAudioStrategy_PreferStereo;
        if (!v33)
          v34 = kFigPlayerMultichannelAudioStrategy_MatchMultichannelTrackPreferenceToAudioDevice;
        *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = *v34;
      }
      return;
    }
    v7 = v6;
    v8 = 0;
    v9 = CFSTR("PlaybackItem");
    v45 = v6;
    while (1)
    {
      v10 = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1[8] + 600), v8);
      if (v10)
        v11 = CFRetain(v10);
      else
        v11 = 0;
      v12 = (*(uint64_t (**)(_QWORD, _QWORD, CFTypeRef))(a1[8] + 80))(a1[9], a1[10], v11);
      if ((*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 44) & 1) == 0)
      {
        time1 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
        memset(&time2, 0, sizeof(time2));
        fpic_PredictEventGroupDurationOnPrimary(a1[9], v11, a1[10], 0, (uint64_t)&time1, &time2);
        v13 = a1[9];
        v14 = a1[10];
        lhs = time2;
        fpic_GetOffsetForEvent(v13, (uint64_t)v11, (__int128 *)&lhs.value, v14, (uint64_t)&v50);
        v15 = *(_QWORD *)(a1[4] + 8);
        *(_OWORD *)(v15 + 32) = v50;
        *(_QWORD *)(v15 + 48) = v51;
        if (!*(_DWORD *)(CMBaseObjectGetDerivedStorage() + 724))
        {
          lhs = *(CMTime *)(*(_QWORD *)(a1[4] + 8) + 32);
          rhs = time1;
          CMTimeSubtract(&v48, &lhs, &rhs);
          *(CMTime *)(*(_QWORD *)(a1[4] + 8) + 32) = v48;
        }
      }
      if (!fpic_GetPerAssetPerEventTrackedObject(a1[8], v8, 0, v9))
        break;
      if (v11)
        goto LABEL_17;
LABEL_18:
      if (++v8 == v7)
        goto LABEL_51;
    }
    v16 = v9;
    v17 = fpic_CopyPerAssetPerEventTrackedObjects(a1[8], v8, CFSTR("AssetURL"));
    v18 = CFArrayGetCount(v17);
    v19 = FigPlayerInterstitialEventCopyAssetListUrl(v12);
    if (v19)
    {
      time1.value = 0;
      if ((*(unsigned int (**)(_QWORD, _QWORD, uint64_t, __CFArray *, CMTime *))(a1[8] + 104))(a1[9], a1[10], v12, v17, &time1))
      {
        v20 = (CMTimeValue)v11;
      }
      else
      {
        fpic_UpdateEventInAddOrder((const void *)a1[9], v11, (const void *)time1.value);
        v21 = fpic_CreateAssetListResponseStatusDidChangeNotificationPayload(time1.value, 0, 0);
        fpic_PostNotification(a1[8], (uint64_t)CFSTR("fpiAssetListResponseStatusDidChange"), (const void *)a1[9], v21);
        v20 = time1.value;
        if (time1.value)
          CFRetain((CFTypeRef)time1.value);
        if (v11)
          CFRelease(v11);
        if (v21)
          CFRelease(v21);
        if (time1.value)
          CFRelease((CFTypeRef)time1.value);
      }
      v11 = (CFTypeRef)v20;
    }
    if (v8)
      goto LABEL_33;
    v22 = *(_QWORD *)(a1[4] + 8);
    if ((*(_BYTE *)(v22 + 44) & 1) != 0)
    {
      time1 = *(CMTime *)(v22 + 32);
      time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
      CMTimeCompare(&time1, &time2);
      if (v18 >= 1)
      {
        v23 = 0;
        while (1)
        {
          memset(&time1, 0, sizeof(time1));
          fpic_GetEventItemDuration(a1[9], a1[10], (uint64_t)v11, 0, v23, (uint64_t)&time1);
          if ((time1.flags & 1) == 0)
            break;
          time2 = *(CMTime *)(*(_QWORD *)(a1[4] + 8) + 32);
          lhs = time1;
          if (CMTimeCompare(&time2, &lhs) > 0)
          {
            time2 = *(CMTime *)(*(_QWORD *)(a1[4] + 8) + 32);
            lhs = time1;
            CMTimeSubtract(&v46, &time2, &lhs);
            *(CMTime *)(*(_QWORD *)(a1[4] + 8) + 32) = v46;
            v24 = (CMTime *)a1[8];
            lhs = v24[19];
            rhs = time1;
            CMTimeAdd(&time2, &lhs, &rhs);
            v24[19] = time2;
            ++*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
            if (v18 != ++v23)
              continue;
          }
          goto LABEL_48;
        }
        if (v23 < v18 - 1)
        {
          v25 = *(_QWORD *)(a1[4] + 8);
          v26 = MEMORY[0x1E0CA2E18];
          *(_OWORD *)(v25 + 32) = *MEMORY[0x1E0CA2E18];
          *(_QWORD *)(v25 + 48) = *(_QWORD *)(v26 + 16);
        }
      }
    }
LABEL_48:
    v27 = *(_QWORD *)(a1[5] + 8);
    if (*(_QWORD *)(v27 + 24) < v18)
    {
LABEL_33:
      CFArrayAppendValue(*(CFMutableArrayRef *)(*(_QWORD *)(a1[6] + 8) + 24), v11);
      if (!v19)
        goto LABEL_35;
    }
    else
    {
      *(_QWORD *)(v27 + 24) = 0;
      if (!v19)
      {
LABEL_35:
        if (v17)
          CFRelease(v17);
        v9 = v16;
        v7 = v45;
        if (!v11)
          goto LABEL_18;
LABEL_17:
        CFRelease(v11);
        goto LABEL_18;
      }
    }
    CFRelease(v19);
    goto LABEL_35;
  }
  v4 = Count;
  v5 = 0;
  while (fpic_GetPerAssetPerEventTrackedObject(v2, v5, 0, CFSTR("PlaybackItem")) == CFSTR("DummyItem")
       || fpic_GetPerAssetPerEventTrackedObject(v2, v5, 0, CFSTR("AssetURL")))
  {
    if (v4 == ++v5)
      goto LABEL_7;
  }
}

uint64_t __fpic_EnsureNextEventWillBuffer_block_invoke_86(_QWORD *a1)
{
  uint64_t v2;
  CFIndex v3;
  uint64_t FirstIndexOfValue;
  CFIndex v5;
  const __CFArray *ValueAtIndex;
  CFIndex v7;
  CFIndex v8;
  CFIndex Count;
  uint64_t v10;
  CFIndex v11;
  const void *v12;
  uint64_t v13;
  uint64_t result;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t DerivedStorage;
  CFIndex v22;
  CFIndex PerEventTrackingCount;
  CFIndex v24;
  CMTime *v25;
  CFIndex v26;
  const __CFString *PerAssetPerEventTrackedObject;
  BOOL v28;
  const __CFString *v29;
  uint64_t v30;
  uint64_t v31;
  CMTimeFlags flags;
  CMTimeEpoch epoch;
  int v34;
  uint64_t v35;
  _OWORD *v36;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  unsigned int v38;
  uint64_t v39;
  __CFArray *theArray;
  uint64_t v41;
  CMTime *v42;
  CMTime v43;
  CMTime v44;
  os_log_type_t type;
  CMTime v46;
  CMTime time1;
  CMTime v48;
  CMTime v49;
  CMTime v50;
  CMTime rhs;
  CMTime lhs;
  CMTimeValue value;
  CMTimeScale timescale;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  if (v2 >= 1)
  {
    v3 = 0;
    do
    {
      CFArrayGetValueAtIndex(*(CFArrayRef *)(*(_QWORD *)(a1[5] + 8) + 24), v3);
      CMBaseObjectGetDerivedStorage();
      FirstIndexOfValue = FigCFArrayGetFirstIndexOfValue();
      if ((FirstIndexOfValue & 0x8000000000000000) == 0)
      {
        v5 = FirstIndexOfValue;
        ValueAtIndex = (const __CFArray *)CFArrayGetValueAtIndex(*(CFArrayRef *)(*(_QWORD *)(a1[6] + 8) + 24), v3);
        if (*(uint64_t *)(*(_QWORD *)(a1[7] + 8) + 24) >= 1)
        {
          v7 = 0;
          do
            fpic_SetPerAssetPerEventTrackedObject(a1[11], v5, v7++, CFSTR("PlaybackItem"), CFSTR("DummyItem"));
          while (v7 < *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24));
        }
        v8 = 0;
        if (ValueAtIndex)
        {
LABEL_8:
          Count = CFArrayGetCount(ValueAtIndex);
          goto LABEL_10;
        }
        while (1)
        {
          Count = 0;
LABEL_10:
          if (v8 >= Count)
            break;
          v10 = a1[11];
          v11 = v8 + *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24);
          v12 = CFArrayGetValueAtIndex(ValueAtIndex, v8);
          fpic_SetPerAssetPerEventTrackedObject(v10, v5, v11, CFSTR("PlaybackItem"), v12);
          ++v8;
          if (ValueAtIndex)
            goto LABEL_8;
        }
        *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = 0;
        CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(*(_QWORD *)(a1[6] + 8) + 24), v3);
        CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(*(_QWORD *)(a1[5] + 8) + 24), v3--);
        --*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
      }
      ++v3;
    }
    while (v3 < *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24));
  }
  if (!*(_DWORD *)(CMBaseObjectGetDerivedStorage() + 724)
    || *(_BYTE *)(a1[11] + 860)
    || (CMBaseObjectGetDerivedStorage(), FigCFArrayGetFirstIndexOfValue())
    || (v13 = a1[11], (*(_BYTE *)(v13 + 756) & 1) == 0))
  {
    result = CMBaseObjectGetDerivedStorage();
    if (*(_DWORD *)(result + 724))
      v15 = 1;
    else
      v15 = v2 < 1;
    if (!v15)
    {
      v16 = a1[11];
      if ((*(_BYTE *)(v16 + 756) & 1) != 0)
      {
        v17 = MEMORY[0x1E0CA2E18];
        *(_OWORD *)(v16 + 744) = *MEMORY[0x1E0CA2E18];
        *(_QWORD *)(v16 + 760) = *(_QWORD *)(v17 + 16);
      }
    }
    return result;
  }
  v18 = *(_QWORD *)(v13 + 736);
  v38 = *(_DWORD *)(v13 + 856);
  v19 = a1[12];
  v20 = a1[10];
  theArray = *(__CFArray **)(*(_QWORD *)(a1[9] + 8) + 24);
  *(_OWORD *)&v43.value = *(_OWORD *)(v13 + 744);
  v43.epoch = *(_QWORD *)(v13 + 760);
  v49 = *(CMTime *)(v13 + 808);
  v48 = *(CMTime *)(v13 + 832);
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  CMBaseObjectGetDerivedStorage();
  v41 = v18;
  v22 = FigCFArrayGetFirstIndexOfValue();
  v42 = (CMTime *)DerivedStorage;
  PerEventTrackingCount = fpic_GetPerEventTrackingCount(DerivedStorage, v22);
  v50 = v43;
  if (v22 == -1)
  {
    result = FigSignalErrorAt();
    goto LABEL_51;
  }
  v24 = PerEventTrackingCount;
  if (PerEventTrackingCount < 1)
    goto LABEL_40;
  v25 = (CMTime *)(DerivedStorage + 456);
  lhs = v43;
  rhs = v42[19];
  CMTimeSubtract(&v50, &lhs, &rhs);
  v26 = 0;
  while (1)
  {
    PerAssetPerEventTrackedObject = (const __CFString *)fpic_GetPerAssetPerEventTrackedObject((uint64_t)v42, v22, v26, CFSTR("PlaybackItem"));
    if (PerAssetPerEventTrackedObject)
      v28 = PerAssetPerEventTrackedObject == CFSTR("DummyItem");
    else
      v28 = 1;
    if (v28)
      goto LABEL_39;
    v29 = PerAssetPerEventTrackedObject;
    v30 = CMBaseObjectGetDerivedStorage();
    if (v19)
      v39 = (*(uint64_t (**)(uint64_t, uint64_t, const __CFString *))(v30 + 72))(v20, v19, v29);
    else
      v39 = 0;
    v31 = v19;
    fpic_GetEventItemDuration(v20, v19, v41, v22, v26, (uint64_t)&lhs);
    value = lhs.value;
    flags = lhs.flags;
    timescale = lhs.timescale;
    if ((lhs.flags & 1) == 0)
      goto LABEL_40;
    epoch = lhs.epoch;
    lhs = v50;
    rhs.value = value;
    rhs.timescale = timescale;
    rhs.flags = flags;
    rhs.epoch = epoch;
    if (CMTimeCompare(&lhs, &rhs) < 1)
      break;
    rhs = v50;
    time1.value = value;
    time1.timescale = timescale;
    time1.flags = flags;
    time1.epoch = epoch;
    CMTimeSubtract(&lhs, &rhs, &time1);
    v50 = lhs;
    CFArrayAppendValue(theArray, v29);
    rhs = *v25;
    time1.value = value;
    time1.timescale = timescale;
    time1.flags = flags;
    time1.epoch = epoch;
    CMTimeAdd(&lhs, &rhs, &time1);
    *v25 = lhs;
    fpic_SetPerAssetPerEventTrackedObject((uint64_t)v42, v22, v26, CFSTR("PlaybackItem"), CFSTR("DummyItem"));
    v19 = v31;
LABEL_39:
    if (v24 == ++v26)
      goto LABEL_40;
  }
  if (!v39)
  {
LABEL_40:
    v34 = 0;
    goto LABEL_41;
  }
  lhs = v49;
  rhs = *v25;
  CMTimeSubtract(&time1, &lhs, &rhs);
  lhs = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  CMTimeMaximum(&v49, &time1, &lhs);
  lhs = v48;
  rhs = *v25;
  CMTimeSubtract(&v46, &lhs, &rhs);
  lhs.value = value;
  lhs.timescale = timescale;
  lhs.flags = flags;
  lhs.epoch = epoch;
  CMTimeMinimum(&v48, &v46, &lhs);
  if (dword_1EE2A33C8)
  {
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  CMNotificationCenterGetDefaultLocalCenter();
  FigNotificationCenterAddWeakListener();
  CMNotificationCenterGetDefaultLocalCenter();
  FigNotificationCenterAddWeakListener();
  lhs = v50;
  rhs = v49;
  v44 = v48;
  result = FPSupport_SetCurrentTimeWithRangeIDAndReason(v39, (__int128 *)&lhs.value, v38, (__int128 *)&rhs.value, (__int128 *)&v44.value);
  if ((_DWORD)result)
  {
LABEL_51:
    v34 = 0;
    goto LABEL_42;
  }
  v34 = 1;
LABEL_41:
  result = 0;
LABEL_42:
  *(_DWORD *)(*(_QWORD *)(a1[8] + 8) + 24) = result;
  if (v34 && !*(_DWORD *)(*(_QWORD *)(a1[8] + 8) + 24))
  {
    v35 = a1[11];
    v36 = (_OWORD *)MEMORY[0x1E0CA2E18];
    *(_QWORD *)(v35 + 760) = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    *(_OWORD *)(v35 + 744) = *v36;
  }
  return result;
}

@end
