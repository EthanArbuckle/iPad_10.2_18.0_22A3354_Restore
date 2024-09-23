@implementation EnsureNextEventHasAssets

void __fpic_EnsureNextEventHasAssets_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t DerivedStorage;
  uint64_t v4;
  uint64_t v5;
  CMTime *v6;
  CFIndex FirstIndexOfValue;
  const void *ValueAtIndex;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  unsigned int v12;
  unsigned int v13;
  CFIndex v14;
  CFIndex PerEventTrackingCount;
  CFIndex v16;
  CFIndex v17;
  __CFString *PerAssetPerEventTrackedObject;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  CFTypeRef v24;
  CFIndex v25;
  CFTypeRef v26;
  _BOOL4 v27;
  CFTypeRef v28;
  BOOL v29;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  CMTime *v35;
  __CFArray *Mutable;
  int v37;
  CFIndex v38;
  const void *v39;
  uint64_t v40;
  CFTypeRef *v41;
  const __CFArray *v42;
  CFIndex v43;
  CFIndex v44;
  CFIndex j;
  uint64_t v46;
  const void *v47;
  NSObject *v48;
  unsigned int v49;
  unsigned int v50;
  uint64_t v51;
  const void *value;
  CFTypeRef v53;
  NSObject *v54;
  uint64_t v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  NSObject *v59;
  unsigned int v60;
  unsigned int v61;
  uint64_t v62;
  _BOOL4 v63;
  CFIndex i;
  const void *v65;
  uint64_t v66;
  const __CFAllocator *allocator;
  int v68;
  __CFArray *theArray;
  CFIndex Count;
  CFIndex v71;
  CFTypeRef v72;
  os_log_type_t type[8];
  os_log_type_t v74[8];
  CMTime cf;
  _BYTE v76[40];
  CMTime v77;
  CFTypeRef v78;
  CMTime rhs;
  uint64_t v80;
  _BYTE lhs[32];
  uint64_t v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(a1 + 72))
    goto LABEL_106;
  v2 = *(_QWORD *)(a1 + 40);
  if (!*(_BYTE *)(v2 + 232) && !*(_BYTE *)(v2 + 233))
    goto LABEL_106;
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*(unsigned __int8 *)(DerivedStorage + 352) | *(unsigned __int8 *)(DerivedStorage + 353))
    goto LABEL_106;
  if (fpic_ShouldIgnoreInterstitialsDueToExternalPlaybackStrategy(*(_QWORD *)(a1 + 48)))
    goto LABEL_106;
  if (*(_DWORD *)(CMBaseObjectGetDerivedStorage() + 728))
    goto LABEL_106;
  v4 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(v4 + 860))
    goto LABEL_106;
  Count = CFArrayGetCount(*(CFArrayRef *)(v4 + 184));
  v78 = 0;
  v5 = (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 64))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40));
  v6 = (CMTime *)MEMORY[0x1E0CA2E68];
  v77 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  fpic_AccumulateDuration((CMTime *)(*(_QWORD *)(a1 + 40) + 384), MEMORY[0x1E0CA2E68]);
  fpic_AccumulateDuration((CMTime *)(*(_QWORD *)(a1 + 40) + 432), v6);
  if (v5)
    fpic_CopyNextItem(v5, &v78);
  if (CFArrayGetCount(*(CFArrayRef *)(*(_QWORD *)(a1 + 40) + 600)) < 1)
  {
    FirstIndexOfValue = 0;
  }
  else
  {
    CFArrayGetValueAtIndex(*(CFArrayRef *)(*(_QWORD *)(a1 + 40) + 600), 0);
    CMBaseObjectGetDerivedStorage();
    FirstIndexOfValue = FigCFArrayGetFirstIndexOfValue();
  }
  if (FirstIndexOfValue >= Count)
  {
    Mutable = 0;
    goto LABEL_65;
  }
  theArray = 0;
  v68 = 0;
  allocator = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  do
  {
    ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(*(_QWORD *)(a1 + 40) + 184), FirstIndexOfValue);
    v9 = (*(uint64_t (**)(_QWORD, _QWORD, const void *))(*(_QWORD *)(a1 + 40) + 80))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), ValueAtIndex);
    v10 = *(_QWORD *)(a1 + 40);
    fpic_EventDateTimeMoment(v9, (uint64_t)v76);
    v11 = *(_OWORD *)(v10 + 216);
    *(_OWORD *)lhs = *(_OWORD *)(v10 + 200);
    *(_OWORD *)&lhs[16] = v11;
    v82 = *(_QWORD *)(v10 + 232);
    LODWORD(v10) = fpic_MomentsAreClose((uint64_t)lhs, (uint64_t)v76);
    v12 = FigPlayerInterstitialEventIsPostRoll(v9);
    if (v10 | v12)
    {
      v13 = v12;
      if (!CFSetContainsValue(*(CFSetRef *)(*(_QWORD *)(a1 + 40) + 632), ValueAtIndex))
      {
        CMBaseObjectGetDerivedStorage();
        v14 = FigCFArrayGetFirstIndexOfValue();
        memset(&cf, 0, sizeof(cf));
        fpic_PredictEventDurationOnPrimary(*(_QWORD *)(a1 + 48), (uint64_t)ValueAtIndex, *(_QWORD *)(a1 + 56), (uint64_t)&cf);
        if ((cf.flags & 1) != 0)
        {
          *(CMTime *)lhs = v77;
          rhs = cf;
          CMTimeAdd(&v77, (CMTime *)lhs, &rhs);
        }
        if (v14 != -1)
        {
          if (!v5)
            goto LABEL_17;
          if (!v78)
            goto LABEL_17;
          PerEventTrackingCount = fpic_GetPerEventTrackingCount(*(_QWORD *)(a1 + 40), v14);
          if (PerEventTrackingCount < 1)
            goto LABEL_17;
          v16 = PerEventTrackingCount;
          v17 = 0;
          while (2)
          {
            PerAssetPerEventTrackedObject = (__CFString *)fpic_GetPerAssetPerEventTrackedObject(*(_QWORD *)(a1 + 40), v14, v17, CFSTR("PlaybackItem"));
            v19 = *(_QWORD *)(a1 + 48);
            v20 = *(_QWORD *)(a1 + 56);
            v21 = CMBaseObjectGetDerivedStorage();
            if (PerAssetPerEventTrackedObject)
              v22 = PerAssetPerEventTrackedObject == CFSTR("DummyItem");
            else
              v22 = 1;
            if (v22 || v20 == 0)
              v24 = 0;
            else
              v24 = (CFTypeRef)(*(uint64_t (**)(uint64_t, uint64_t, __CFString *))(v21 + 72))(v19, v20, PerAssetPerEventTrackedObject);
            if (PerAssetPerEventTrackedObject != CFSTR("DummyItem"))
            {
              v71 = v16;
              v25 = v14;
              v26 = v78;
              v27 = v78 != 0;
              if (v24 != v78 && v78)
              {
                do
                {
                  v28 = *(CFTypeRef *)(CMBaseObjectGetDerivedStorage() + 864);
                  if (v28)
                    v29 = v28 == v26;
                  else
                    v29 = 0;
                  if (!v29)
                  {
                    *(_DWORD *)v74 = 0;
                    type[0] = OS_LOG_TYPE_DEFAULT;
                    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
                    fig_log_call_emit_and_clean_up_after_send_and_compose();
                  }
                  fpic_CopyNextItem(v5, &v78);
                  v26 = v78;
                  v27 = v78 != 0;
                }
                while (v24 != v78 && v78 != 0);
              }
              if (v24 == v26)
              {
                fpic_CopyNextItem(v5, &v78);
                v14 = v25;
              }
              else
              {
                v14 = v25;
                if (v27)
                {
                  *(_DWORD *)v74 = 0;
                  type[0] = OS_LOG_TYPE_DEFAULT;
                  v32 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                  os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
                  fig_log_call_emit_and_clean_up_after_send_and_compose();
                  fpic_RemovePerAssetPerEventTrackedObjects(*(_QWORD *)(a1 + 40), v25, v17--);
                  v16 = v71 - 1;
                  goto LABEL_53;
                }
              }
              v16 = v71;
            }
LABEL_53:
            if (++v17 >= v16)
              goto LABEL_17;
            continue;
          }
        }
        if (theArray || (theArray = CFArrayCreateMutable(allocator, 0, MEMORY[0x1E0C9B378])) != 0)
        {
          memset(lhs, 0, 24);
          v33 = *(_QWORD *)(a1 + 48);
          v34 = *(_QWORD *)(a1 + 56);
          rhs = v77;
          fpic_GetOffsetForEvent(v33, (uint64_t)ValueAtIndex, (__int128 *)&rhs.value, v34, (uint64_t)lhs);
          if (v13)
          {
            v68 = 1;
          }
          else if ((lhs[12] & 1) != 0)
          {
            CFArrayAppendValue(theArray, ValueAtIndex);
          }
          else if ((cf.flags & 1) != 0)
          {
            v35 = (CMTime *)(*(_QWORD *)(a1 + 40) + 384);
            rhs = cf;
            fpic_AccumulateDuration(v35, &rhs);
          }
        }
        else
        {
          theArray = 0;
        }
      }
    }
LABEL_17:
    ++FirstIndexOfValue;
  }
  while (FirstIndexOfValue != Count);
  if (theArray)
  {
    v63 = CFArrayGetCount(theArray) == 0;
    Mutable = theArray;
  }
  else
  {
    Mutable = 0;
    v63 = 1;
  }
  if (v63
    && v68
    && (!CFArrayGetCount(*(CFArrayRef *)(*(_QWORD *)(a1 + 40) + 600)) || *(_BYTE *)(*(_QWORD *)(a1 + 40) + 978)))
  {
    if (!theArray)
      Mutable = CFArrayCreateMutable(allocator, 0, MEMORY[0x1E0C9B378]);
    if (Count >= 1 && Mutable)
    {
      for (i = 0; i < Count; ++i)
      {
        v65 = CFArrayGetValueAtIndex(*(CFArrayRef *)(*(_QWORD *)(a1 + 40) + 184), i);
        v66 = (*(uint64_t (**)(_QWORD, _QWORD, const void *))(*(_QWORD *)(a1 + 40) + 80))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v65);
        if (FigPlayerInterstitialEventIsPostRoll(v66))
        {
          CMBaseObjectGetDerivedStorage();
          if (FigCFArrayGetFirstIndexOfValue() == -1)
          {
            if (!*(_BYTE *)(*(_QWORD *)(a1 + 40) + 978))
              fpic_AssertPostRoll(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
            CFArrayAppendValue(Mutable, v65);
          }
        }
      }
    }
  }
LABEL_65:
  v37 = 0;
  v38 = 0;
  if (!Mutable)
    goto LABEL_68;
LABEL_66:
  if (v38 < CFArrayGetCount(Mutable))
  {
    while (1)
    {
      v39 = CFArrayGetValueAtIndex(Mutable, v38);
      v40 = (*(uint64_t (**)(_QWORD, _QWORD, const void *))(*(_QWORD *)(a1 + 40) + 80))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v39);
      v41 = FigPlayerInterstitialEventCopyInterstitialAssetURLs(v40);
      v42 = (const __CFArray *)v41;
      if (v41)
        v43 = CFArrayGetCount((CFArrayRef)v41);
      else
        v43 = 0;
      v44 = CFArrayGetCount(*(CFArrayRef *)(*(_QWORD *)(a1 + 40) + 600));
      CFArrayAppendValue(*(CFMutableArrayRef *)(*(_QWORD *)(a1 + 40) + 600), v39);
      if (v43 >= 1)
      {
        for (j = 0; j != v43; ++j)
        {
          v46 = *(_QWORD *)(a1 + 40);
          v47 = CFArrayGetValueAtIndex(v42, j);
          fpic_SetPerAssetPerEventTrackedObject(v46, v44, j, CFSTR("AssetURL"), v47);
        }
        goto LABEL_75;
      }
      *(_QWORD *)v74 = 0;
      cf.value = 0;
      v72 = 0;
      *(_QWORD *)type = 0;
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = fpic_ScheduleAssetListReadForEvent(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v39, 0, &cf, v74, type, (CMBlockBufferRef *)&v72);
      value = (const void *)cf.value;
      if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
        break;
      if (cf.value)
      {
        fpic_AddNewHttpReq(*(_QWORD *)(a1 + 48), v39, (const void *)cf.value, v72);
LABEL_90:
        CFRelease(value);
LABEL_91:
        v53 = v72;
        if (!v72)
          goto LABEL_93;
LABEL_92:
        CFRelease(v53);
        goto LABEL_93;
      }
      if (!*(_QWORD *)v74)
        goto LABEL_91;
      v53 = v72;
      fpic_AddNewCustomURLReq(*(_QWORD *)(a1 + 48), v39, *(const void **)v74, *(uint64_t *)type, v72);
      if (v53)
        goto LABEL_92;
LABEL_93:
      if (*(_QWORD *)v74)
        CFRelease(*(CFTypeRef *)v74);
      if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      {
        v54 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        v55 = *(_QWORD *)(a1 + 40);
        v56 = *(_DWORD *)(v55 + 1024) + 1;
        *(_DWORD *)(v55 + 1024) = v56;
        fpic_setItemPropertyInt32(*(_QWORD *)(v55 + 152), (uint64_t)CFSTR("interstitialPlaybackFailureCount"), v56);
        fpic_ClearAssetListResponseAfterAssetListReadFailure(*(const void **)(a1 + 48), v39, *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
        fpic_RemoveEvent(*(const void **)(a1 + 48), v39, 0, 0, 0);
        --v38;
        goto LABEL_97;
      }
LABEL_75:
      if (v42)
        CFRelease(v42);
      if (dword_1EE2A33C8)
      {
        LODWORD(cf.value) = 0;
        v74[0] = OS_LOG_TYPE_DEFAULT;
        v48 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        v49 = cf.value;
        if (os_log_type_enabled(v48, v74[0]))
          v50 = v49;
        else
          v50 = v49 & 0xFFFFFFFE;
        if (v50)
        {
          v51 = *(_QWORD *)(a1 + 48);
          LODWORD(rhs.value) = 136315650;
          *(CMTimeValue *)((char *)&rhs.value + 4) = (CMTimeValue)"fpic_EnsureNextEventHasAssets_block_invoke";
          LOWORD(rhs.flags) = 2048;
          *(_QWORD *)((char *)&rhs.flags + 2) = v51;
          HIWORD(rhs.epoch) = 2112;
          v80 = v40;
          _os_log_send_and_compose_impl();
        }
        v37 = 1;
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      else
      {
        v37 = 1;
      }
LABEL_97:
      ++v38;
      if (Mutable)
        goto LABEL_66;
LABEL_68:
      if ((v38 & 0x8000000000000000) == 0)
        goto LABEL_102;
    }
    if (cf.value)
      goto LABEL_90;
    goto LABEL_91;
  }
  CFRelease(Mutable);
LABEL_102:
  if (v37)
    fpic_GatePrimaryPlaybackAtCurrentEvent(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  if (v78)
    CFRelease(v78);
LABEL_106:
  v57 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(v57 + 975))
  {
    if ((*(_BYTE *)(v57 + 908) & 1) != 0 && !CFArrayGetCount(*(CFArrayRef *)(v57 + 600)))
    {
      v58 = CMBaseObjectGetDerivedStorage();
      if (!(*(unsigned __int8 *)(v58 + 352) | *(unsigned __int8 *)(v58 + 353))
        && !*(_DWORD *)(CMBaseObjectGetDerivedStorage() + 728)
        && !*(_BYTE *)(*(_QWORD *)(a1 + 40) + 860))
      {
        if (dword_1EE2A33C8)
        {
          LODWORD(v77.value) = 0;
          LOBYTE(cf.value) = 0;
          v59 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          v60 = v77.value;
          if (os_log_type_enabled(v59, cf.value))
            v61 = v60;
          else
            v61 = v60 & 0xFFFFFFFE;
          if (v61)
          {
            v62 = *(_QWORD *)(a1 + 48);
            LODWORD(rhs.value) = 136315394;
            *(CMTimeValue *)((char *)&rhs.value + 4) = (CMTimeValue)"fpic_EnsureNextEventHasAssets_block_invoke";
            LOWORD(rhs.flags) = 2048;
            *(_QWORD *)((char *)&rhs.flags + 2) = v62;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        fpic_UngatePrimaryPlayback(*(_QWORD *)(a1 + 48));
      }
    }
  }
}

@end
